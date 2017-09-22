#++ (ql:quickload '(alexandria cffi cl-json cl-ppcre cffi-libffi))
;;; translate openvr_api.json from openvr sdk to cffi defs
;; https://github.com/ValveSoftware/openvr/blob/master/headers/openvr_api.json

(defpackage 3b-openvr-generate
  (:use :cl :cl-ppcre))
(in-package 3b-openvr-generate)

(defparameter *openvr-api*
  (with-open-file (s (asdf:system-relative-pathname '3b-openvr
                                                    "spec/openvr_api.json"))
    (cl-json:decode-json s)))

(defparameter *package-name* "3b-openvr")
(defparameter *symbols* (make-hash-table :test 'equal))
(defparameter *typedefs* (make-hash-table :test 'equal))
(Defparameter *special-case-names*
  (alexandria:plist-hash-table
   `("VROverlayIntersectionMaskPrimitive_Data_t"
     "vr-overlay-intersection-mask-primitive-data-t"
     "uMin" "u-min"
     "vMin" "v-min"
     "uMax" "u-max"
     "vMax" "v-max"
     "uOffset" "u-offset"
     "vOffset" "v-offset"
     "uScale" "u-scale"
     "vScale" "v-scale")
   :test 'equal))

(Defparameter *member-prefixes*
  ;; takes first match, so put "m-foo-" before "m-"
  `("f-" "fl-" "v-" "e-" "b-" "c-" "ul-" "un-" "u-" "n-"
         "p-" "rf-" "r-" "pch-" "rub-"
         "m-fl-" "m-u-" "m-n-" "m-p-"
         "m-"))

(defparameter *name-map* (make-hash-table :test 'equal))

(defparameter *base-types*
  (alexandria:plist-hash-table
   '("float" ":float"
     "double" ":double"
     "void" ":void"
     "bool" ":bool"
     "int8_t" ":int8"
     "int16_t" ":int16"
     "int32_t" ":int32"
     "int64_t" ":int64"
     "uint8_t" ":uint8"
     "uint16_t" ":uint16"
     "uint32_t" ":uint32"
     "uint64_t" ":uint64"
     "_Bool" ":bool"
     "char" ":char"
     "int" ":int"
     "unsigned" ":uint"
     "unsigned short" ":uint16")
   :test 'equal))

(defun fix-name (name)
  (let ((orig name))
    (when (gethash name *special-case-names*)
      (return-from fix-name (gethash name *special-case-names*)))
    #++(when (gethash name *name-map*)
         (return-from fix-name (gethash name *name-map*)))
    ;; remove vr:: prefix
    (setf name (regex-replace "^vr::" name ""))
    ;; _ -> -
    (setf name (substitute #\- #\_ name))
    ;; VRFoo -> VrFoo so next step adds - properly
    (setf name (regex-replace "VR" name "Vr"))
    (setf name (regex-replace "OS" name "Os"))
    (setf name (regex-replace "DXGI" name "Dxgi"))
    ;; FooBar -> foo-bar
    (setf name (regex-replace-all "([a-z])([A-Z])" name "\\1-\\2"))
    ;; EFoo -> Foo
    (setf name (regex-replace-all "^E([A-Z])" name "\\1"))
    (setf name (regex-replace-all "^I([A-Z])" name "\\1"))
    (setf name (string-downcase name))
    ;; foo0 -> foo-0, 0foo -> 0-foo
    (setf name (regex-replace-all "([a-z])([0-9])" name "\\1-\\2"))
    (setf name (regex-replace-all "([0-9])([a-z])" name "\\1-\\2"))
    ;; int-* -> int*
    (setf name (regex-replace-all "int-(8|16|32|64)" name "int\\1"))
    (setf name (regex-replace-all "d-3-d-" name "d3d"))
    (setf name (regex-replace-all "-2-d" name "-2d"))
    ;; constant name refixes
    (setf name (regex-replace "k-(n|un|ul|pch)-" name ""))
    (setf (gethash orig *name-map*) name)))

(defun fix-type-name (name &key expand-typedefs)
  (when expand-typedefs
    (format *trace-output* "expand? ~s~%" name)
    (when (gethash name *typedefs*)
      (return-from fix-type-name (gethash name *typedefs*)))
    (when (gethash (fix-name name) *typedefs*)
      (return-from fix-type-name (gethash (fix-name name) *typedefs*))))
  (let ((orig name))
    #++(when (gethash name *name-map*)
         (return-from fix-type-name (gethash name *name-map*)))
    (setf name (string-trim '(#\space #\tab) name))
    (when (gethash name *base-types*)
      (return-from fix-type-name (gethash name *base-types*)))
    (when (member name '("char *" "const char *" "const char const *")
                  :test 'string=)
      (return-from fix-type-name ":string"))
    (when (alexandria:ends-with #\* name)
      (return-from fix-type-name
        (let ((pt (fix-type-name (subseq name 0 (- (length name) 2))
                                 :expand-typedefs expand-typedefs)))
          (if pt
              (format nil "(:pointer ~a)" pt)
              ":pointer"))))
    (when (alexandria:ends-with #\] name)
      (let ((counts (loop for a in (all-matches-as-strings "\\[[^]]+\\]" name)
                          collect (subseq a 1 (1- (length a))))))

        (return-from fix-type-name
          (setf (gethash name *name-map*)
                (format nil "~a :count ~a~a"
                        (fix-type-name (subseq name 0 (1- (position #\[ name)))
                                       :expand-typedefs expand-typedefs)
                        (if (= 1 (length counts)) "" "#.")
                        (if (= 1 (length counts))
                            (car counts)
                            (list* '* counts)))))))
    (setf (gethash orig *name-map*)
          (let* ((space (position #\space name))
                 (prefix (when space (subseq name 0 space))))
            (cond
              ((member prefix '("struct" "union") :test 'equal)
               (format nil "(:~a ~a)"
                       (subseq name 0 space)
                       (fix-type-name (subseq name (1+ space)))))
              ((member prefix '("const" "enum") :test 'equal)
               (fix-type-name (subseq name (1+ space))
                              :expand-typedefs expand-typedefs))
              ((member prefix '("class") :test 'equal)
               ;; ignore "class foo", only used in pointers so just
               ;; leave it opaque
               nil)
              (t
               (fix-name name)))))))

(defun fix-member-name (name)
  (when (gethash name *special-case-names*)
    (return-from fix-member-name (gethash name *special-case-names*)))
  (let ((n (fix-name name)))
    (loop for p in *member-prefixes*
          for s = (nth-value
                   1 (alexandria:starts-with-subseq p n :return-suffix t))
          when s
            return s
          finally (return n))))

(defun enum-prefix (enum names)
  (if (<= (length names) 1)
      (mismatch (car names) enum)
      (reduce 'min (mapcar (lambda (a) (mismatch (first names) a))
                           (cdr names)))))

(defun consts ()
  (loop for d in (cdr (assoc :consts *openvr-api*))
        for name = (fix-name (cdr (assoc :constname d)))
        for type = (cdr (assoc :consttype d))
        for value = (cdr (assoc :constval d))
        when (search "char" type)
          ;; keep quotes for string constants and use define-constant
          do (format t "(alexandria:define-constant +~a+ ~s :test 'string=) ;; ~a~%"
                     (fix-name name) value type)
        else ;; otherwise print directly
        do (format t "(defconstant +~a+ ~a) ;; ~a~%" ;
                   name value type)))

;;; todo: see if any of these should be bitfields
(defun enums ()
  (loop for d in (cdr (assoc :enums *openvr-api*))
        for .name = (cdr (assoc :enumname d))
        for name = (fix-name .name)
        for values = (cdr (assoc :values d))
        for prefix = (enum-prefix .name
                                  (mapcar (lambda (a) (cdr (assoc :name a)))
                                          values))
        do (format t "(defcenum ~a" name)
           (loop for e in values
                 for .n = (cdr (assoc :name e))
                 for n = (fix-name (subseq .n prefix))
                 for v = (cdr (assoc :value e))
                 do (format t "~%  (:~a ~a)" n v))
           (format t ")~%~%")))

(defun typedefs ()
  (loop for d in (cdr (assoc :typedefs *openvr-api*))
        for .name = (cdr (assoc :typedef d))
        for name = (fix-name .name)
        for type = (fix-type-name (cdr (assoc :type d)))
        do (format *trace-output* "~s/~s? ~s~%" name type .name)
        when (or (search name type)
                 (search ":struct" type))
          do (setf (gethash name *typedefs*) type)
             (setf (gethash .name *typedefs*) type)
        else
          do (format t "(defctype ~a ~a)~%" name type)))

(defun guess-union-name (fields)
  (let ((f (cdr (assoc :fieldname (first fields))))
        (l (length fields)))
    (cond
      ((and (string= f "m_Rectangle")
            (= l 2))
       "vr-overlay-intersection-mask-primitive-data-t")
      ((and (string= f "reserved")
            (= l 20))
       "vr-event-data-t")
      (t (error "??")))))

(defun structs ()
  (loop for d in (cdr (assoc :structs *openvr-api*))
        for name = (fix-name (cdr (assoc :struct d)))
        for fields = (cdr (assoc :fields d))
        do (if (string= name "(anonymous)") ;; ??
               (format t "(defcunion ~a" (guess-union-name fields))
               (format t "(defcstruct ~a" name))
           (setf (gethash (fix-type-name name) *typedefs*)
                 (format nil "(:struct ~a)" (fix-type-name name)))
           (loop for (e . more) on fields
                 for .fn = (cdr (assoc :fieldname e))
                 for fn = (fix-member-name .fn)
                 for .ft = (cdr (assoc :fieldtype e))
                 for ft = (fix-type-name .ft :expand-typedefs t)
                 do (format t "~%  (~a ~a)~a ;; ~a" fn ft ;
                            (if more "" ")") .ft))
           (format t "~%~%")))

;; for each method, we define a class containing a table of function pointers
;; and a set of %foo functions to call a function from the table
(defun bindings ()
  (let ((classes (make-hash-table :test 'equal))
        (counts (make-hash-table :test 'equal))
        (class-names))
    (loop for d in (cdr (assoc :methods *openvr-api*))
          for class = (fix-name (cdr (assoc :classname d)))
          for name = (cdr (assoc :methodname d))
          for ret = (fix-type-name (cdr (assoc :returntype d)))
          for params = (cdr (assoc :params d))
          do (push (list name ret params) (gethash class classes))
             (pushnew class class-names :test 'equal)
          do (incf (gethash (fix-name name) counts 0)))
    (loop for class in (reverse class-names)
          for methods = (gethash class classes)
          do (format t " (defclass ~a ()~%  ((table :reader table)))~%"
                     (fix-name class))
          do (format t "~(~a~)~%"
                     `(defmethod initialize-instance ":after"
                        ((o,(fix-name class)) &key)
                        (let ((p (vr-get-generic-interface
                                  ,(format nil "+~a-version+"
                                           (fix-name class)))))
                          (setf (slot-value o 'table)
                                (make-array ,(length methods)))
                          (loop for i below ,(length methods)
                                do (setf (aref (table o) i)
                                         ("cffi:mem-aref" p ":pointer" i)))
                          (format t "\"loaded function table for ~s = ~s~%\""
                                  ',(fix-name class)
                                  (table o)))))

             (loop for (.n r p) in (reverse methods)
                   for index from 0
                   for n = (fix-name .n)
                   ;;for ll = (gethash n *manual-methods*)
                   for call = `(cffi:foreign-funcall-pointer
                                (aref table ,index)
                                ()
                                ,@(loop for i in p
                                        for pt = (fix-type-name
                                                  (cdr (assoc :paramtype i))
                                                  :expand-typedefs t)
                                        for n = (cdr (assoc :paramname i))
                                        collect pt collect n)
                                ,r)
                   do (when (> (gethash n counts) 1)
                        (setf n (format nil "~a/~a" n class)))
                      ;;todo: declaim inline
                      (format t "(defun %~a (table~{ ~a~})"
                              n (loop for i in p
                                      collect (cdr (assoc :paramname i))))
                      (format t "~%  ~(~a~)" call)
                      (format t ")~%~%")))))

;; generate stubs for GF wrappers
#++
(defun stubs ()
  (let ((classes (make-hash-table :test 'equal))
        (class-names))
    (loop for d in (cdr (assoc :methods *openvr-api*))
          for class = (fix-name (cdr (assoc :classname d)))
          for name = (cdr (assoc :methodname d))
          for ret = (fix-type-name (cdr (assoc :returntype d)))
          for params = (cdr (assoc :params d))
          do (push (list name ret params) (gethash class classes))
             (pushnew class class-names :test 'equal))
    (loop for class in (reverse class-names)
          for methods = (gethash class classes)
          do (loop for (.n r p) in (reverse methods)
                   for index from 0
                   for n = (fix-name .n)
                   for getter = (alexandria:starts-with-subseq "Get" .n)
                   for setter = (alexandria:starts-with-subseq "Set" .n)
                   for (param-names out-params)
                     = (loop
                         for i in p
                         for pt = (fix-type-name (cdr (assoc :paramtype i))
                                                 :expand-typedefs t)
                         for n = (fix-name (cdr (assoc :paramname i)))
                         ;; skip pointers on getter
                         unless (and getter
                                     (alexandria:starts-with-subseq
                                      "(:pointer" pt)
                                     (not (string= pt ":string")))
                           collect n into ins
                         else
                           collect (list (fix-name n)
                                         (second (read-from-string pt)))
                             into outs
                         finally (return (list ins outs)))
                   for call = `(,(format nil "%~a" n)
                                (aref (table c) ,index)
                                ,@(loop for i in p
                                        for n = (cdr (assoc :paramname i))
                                        collect n)
                                ,r)
                   do (format t "(defmethod ~a (~a(c ~a)~{ ~a~})"
                              n (if setter "n " "") (fix-name class) param-names)
                      (format t "~%  ~(~a~)"
                              (if (and getter out-params)
                                  `(with-foreign-objects (,@out-params)
                                     ,call
                                     (list ;; values?
                                      ,@ (loop for (pn pt) in out-params
                                               collect `(mem-ref ,pn ,pt))))
                                  call))
                      (format t ")~%~%")))))


#++
(with-open-file (*standard-output*
                 (asdf:system-relative-pathname '3b-openvr "low-level.lisp")
                 :direction :output :if-exists :supersede
                 :if-does-not-exist :create)
  (format t ";;; generated file, do not edit~%") ;
                 (format t "(defpackage ~a~%  (:use :cl)~%" *package-name*)
                 (format t "  (:import-from #:cffi~{~%    #:~a~})"
                         '(defcenum defcfun defctype defcstruct defcunion
                           foreign-funcall-pointer))
                 (format t ")~%(in-package ~a)~%~%" *package-name*)
                 (format t "~%~%")
  ;; some opaque types from other APIs
                 (loop for i in '(vk-device-t vk-physical-device-t vk-instance-t vk-queue-t
                                  d3d12-resource d3d12-command-queue)
                       do (format t "(defcstruct ~a)~%" i))
                 (format t "~%~%")
                 (consts)
                 (format t "~%~%")
                 (enums)
                 (format t "~%~%")
                 (typedefs)
                 (format t "~%~%")
                 #++(format t "~a~%"
                            `(cffi:defcunion vr-event-data-t
                               (reserved ,(fix-type-name "VREvent_Reserved_t"))
                               (controller ,(fix-type-name "VREvent_Controller_t"))
                               (mouse ,(fix-type-name "VREvent_Mouse_t"))
                               (scroll ,(fix-type-name "VREvent_Scroll_t"))
                               (process ,(fix-type-name "VREvent_Process_t"))
                               (notification ,(fix-type-name "VREvent_Notification_t"))
                               (overlay ,(fix-type-name "VREvent_Overlay_t"))
                               (status ,(fix-type-name "VREvent_Status_t"))
                               (keyboard ,(fix-type-name "VREvent_Keyboard_t"))
                               (ipd ,(fix-type-name "VREvent_Ipd_t"))
                               (chaperone ,(fix-type-name "VREvent_Chaperone_t"))
                               (performanceTest ,(fix-type-name "VREvent_PerformanceTest_t"))
                               (touchPadMove ,(fix-type-name "VREvent_TouchPadMove_t"))
                               (seatedZeroPoseReset ,(fix-type-name "VREvent_SeatedZeroPoseReset_t"))))
                 (structs)
                 (format t "~%~%")
                 (bindings))

