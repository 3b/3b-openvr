(in-package 3b-openvr)

(defvar *%init*)
(defvar *system*)
(defvar *render-models*)

(defmethod cffi:translate-from-foreign (value (type hmd-matrix-34-t-tclass))
  (let ((a (make-array 16 :element-type 'single-float :initial-element 0.0)))
    (loop for j below 4
          do (loop for i below 3
                   do (setf (aref a (+ (* j 4) i))
                            (cffi:mem-aref value :float (+ (* i 4) j)))))
    a))

(cffi:defcfun (%vr-init-internal "VR_InitInternal") :intptr
  (pe-error (:pointer vr-init-error))
  (type vr-application-type))

(cffi:defcfun (vr-shutdown-internal "VR_ShutdownInternal") :void)

(cffi:defcfun (vr-is-hmd-present "VR_IsHmdPresent") :bool)

(cffi:defcfun (%vr-get-generic-interface "VR_GetGenericInterface") :intptr
  (pch-Interface-Version :string)
  (pe-error (:pointer vr-init-error)))

(cffi:defcfun (vr-is-runtime-installed "VR_IsRuntimeInstalled") :bool)

(cffi:defcfun (vr-get-init-error-as-symbol "VR_GetVRInitErrorAsSymbol") :string
  (error vr-init-error))

(cffi:defcfun (vr-get-init-error-as-english-description
               "VR_GetVRInitErrorAsEnglishDescription") :string
  (error vr-init-error))

(alexandria:define-constant +function-table-prefix+ "FnTable:" :test 'string=)

(defun vr-init (application-type)
  (cffi:with-foreign-object (pe 'vr-init-error)
    (let ((r (%vr-init-internal pe application-type))
          (e (cffi:mem-ref pe 'vr-init-error)))
      (if (eql e :none)
          r
          (error "VR-init error (~s): ~s = ~a = ~a~%" application-type r
                 (vr-get-init-error-as-english-description e)
                 (vr-get-init-error-as-symbol e))))))

(defun vr-get-generic-interface (name &key (table t))
  (format t "get-generic-interface ~s~%" name)
  (cffi:with-foreign-object (pe 'vr-init-error)
    (let* ((name (if table
                     (format nil "~a~a" +function-table-prefix+ name)
                     name))
           (r (%vr-get-generic-interface name pe))
           (e (cffi:mem-ref pe 'vr-init-error)))
      (if (eql e :none)
          r
          (error "failed to get ~s interface: ~s = ~a = ~a~%"
                 name r
                 (vr-get-init-error-as-english-description e)
                 (vr-get-init-error-as-symbol e)))
      (format t " = #x~x~%" r)
      (cffi:make-pointer r))))

(defmacro with-vr ((&key (application-type :scene)) &body body)
  `(let ((*%init* (vr-init ,application-type))
         (*system* (make-instance 'vr-system))
         (*render-models* (make-instance 'vr-render-models)))
     (unwind-protect
          (progn ,@body)
       (vr-shutdown-internal))))

#++
(defmacro check-error (pointer type)
  `(unless (eql (cffi:mem-ref ,pointer ',type) :none)
     (error "error ~s (~s)" (cffi:mem-ref ,pointer ',type) ',type)))
#++
(defmethod get-string-tracked-device-property ((o vr-system) device-index prop)
  (cffi:with-foreign-object (pe 'tracked-property-error)
    (let ((len (%get-string-tracked-device-property (table o) device-index prop
                                                    (cffi:null-pointer) 0
                                                    pe)))
      (check-error pe tracked-property-error)
      (cffi:with-foreign-pointer-as-string (s (1+ len))
        (%get-string-tracked-device-property (table o) device-index prop
                                             s len pe)
        (check-error pe tracked-property-error)))))

(defmacro with-error ((pointer type) &body body)
  `(cffi:with-foreign-object (pe 'tracked-property-error)
     ;; option to pass recursive format string + args instead of just :val?
     (flet ((,pointer (&key val)
              (unless (member (cffi:mem-ref ,pointer ',type)
                              '(:none :success))
                (error "~(~s: ~a~) ~@[(~s)~]"
                       ',type
                       (cffi:mem-ref ,pointer ',type)
                       val))))
       ,@body)))


(defun get-string-tracked-device-property (device-index prop &key (system *system*))
  (with-error (pe tracked-property-error)
    (let ((len (%get-string-tracked-device-property (table system)
                                                    device-index prop
                                                    (cffi:null-pointer) 0
                                                    pe)))
      (unless (eql (cffi:mem-ref pe 'tracked-property-error) :buffer-too-small)
        ;; buffer-too-small is expected here?
        (pe :val prop))
      (if (zerop len)
          ""
          (cffi:with-foreign-pointer-as-string (s (+ 11 len))
            (%get-string-tracked-device-property (table system)
                                                 device-index prop
                                                 s (+ 11 len) pe)
            (pe :val prop))))))

(defun get-float-tracked-device-property (device-index prop &key (system *system*))
  (with-error (pe tracked-property-error)
    (let ((r (%get-float-tracked-device-property (table system)
                                                 device-index prop
                                                 pe)))
      (pe :val prop)
      r)))

(defun get-bool-tracked-device-property (device-index prop &key (system *system*))
  (with-error (pe tracked-property-error)
    (let ((r (%get-bool-tracked-device-property (table system)
                                                device-index prop
                                                pe)))
      (pe :val prop)
      r)))

(defun get-int32-tracked-device-property (device-index prop &key (system *system*))
  (with-error (pe tracked-property-error)
    (let ((r (%get-int32-tracked-device-property (table system)
                                                 device-index prop
                                                 pe)))
      (pe :val prop)
      r)))

(defun get-uint64-tracked-device-property (device-index prop &key (system *system*))
  (with-error (pe tracked-property-error)
    (let ((r (%get-uint64-tracked-device-property (table system)
                                                  device-index prop
                                                  pe)))
      (pe :val prop)
      r)))

(defun get-matrix-34-tracked-device-property (device-index prop &key (system *system*))
  (with-error (pe tracked-property-error)
    (cffi:with-foreign-object (fp :float 12)
      (let ((r (%get-matrix-34-tracked-device-property (table system)
                                                       device-index prop
                                                       pe)))
        ()
        (pe :val prop)
        r))))

(defun get-tracked-device-property (device-index prop &key (system *system*))
  ;; todo: make a hash table of types or something instead of string matching
  (unless (member prop '(:invalid))
    (let ((sprop (string prop)))
      (cond
        ((alexandria:ends-with-subseq "-STRING" sprop)
         (get-string-tracked-device-property device-index prop :system system))
        ((alexandria:ends-with-subseq "-INT32" sprop)
         (get-int32-tracked-device-property device-index prop :system system))
        ((alexandria:ends-with-subseq "-UINT64" sprop)
         (get-uint64-tracked-device-property device-index prop :system system))
        ((alexandria:ends-with-subseq "-BOOL" sprop)
         (get-bool-tracked-device-property device-index prop :system system))
        ((alexandria:ends-with-subseq "-FLOAT" sprop)
         (get-float-tracked-device-property device-index prop :system system))
        ((alexandria:ends-with-subseq "-MATRIX-34" sprop)
         (get-matrix-34-tracked-device-property device-index prop :system system))
        ((or (alexandria:ends-with-subseq "-START" sprop)
             (alexandria:ends-with-subseq "-END" sprop))
         nil)
        (t (error "unknown prop type ~s?" prop))))))
