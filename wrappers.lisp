(in-package 3b-openvr)

(defvar *%init*)
(defvar *system*)
(defvar *chaperone*)
(defvar *chaperone-setup*)
(defvar *compositor*)
(defvar *overlay*)
(defvar *render-models*)
(defvar *extended-display*)
(defvar *settings*)
(defvar *applications*)
(defvar *tracked-camera*)
(defvar *resources*)
(defvar *screenshots*)

(defmethod cffi:translate-from-foreign (value (type hmd-matrix-34-t-tclass))
  (let ((a (make-array 16 :element-type 'single-float :initial-element 0.0)))
    (loop for j below 4
          do (loop for i below 3
                   do (setf (aref a (+ (* j 4) i))
                            (cffi:mem-aref value :float (+ (* i 4) j)))))
    (setf (aref a 15) 1.0)
    a))

(defmethod cffi:translate-from-foreign (value (type hmd-matrix-44-t-tclass))
  (let ((a (make-array 16 :element-type 'single-float :initial-element 0.0)))
    (dotimes (j 4)
      (dotimes (i 4)
        (setf (aref a (+ i (* j 4))) (cffi:mem-aref value :float (+ j (* i 4))))))
    a))

;;; fixme: replace this with map to functions instead of types, so
;;; they don't need runtime dispatch in cffi
(defparameter *event-type-map* ;; indexed by event-type
  ;; todo: verify + figure out more of these
  (alexandria:plist-hash-table
   '(:none nil
     :tracked-device-activated nil
     :tracked-device-deactivated nil
     :tracked-device-updated nil
     :tracked-device-user-interaction-started nil
     :tracked-device-user-interaction-ended nil
     :ipd-changed nil
     :enter-standby-mode nil
     :leave-standby-mode nil
     :tracked-device-role-changed nil
     :watchdog-wake-up-requested nil
     :lens-distortion-changed nil
     :property-changed nil
     :wireless-disconnect nil
     :wireless-reconnect nil
     :button-press (:struct vr-event-controller-t)
     :button-unpress (:struct vr-event-controller-t)
     :button-touch (:struct vr-event-controller-t)
     :button-untouch (:struct vr-event-controller-t)
     :mouse-move (:struct vr-event-mouse-t)
     :mouse-button-down (:struct vr-event-mouse-t)
     :mouse-button-up (:struct vr-event-mouse-t)
     :focus-enter (:struct vr-event-overlay-t)
     :focus-leave (:struct vr-event-overlay-t)
     :scroll (:struct vr-event-mouse-t)
     :touch-pad-move (:struct vr-event-mouse-t)
     :overlay-focus-changed (:struct vr-event-process-t)
     :input-focus-captured (:struct vr-event-process-t)
     :input-focus-released (:struct vr-event-process-t)
     :scene-focus-lost (:struct vr-event-process-t)
     :scene-focus-gained (:struct vr-event-process-t)
     :scene-application-changed (:struct vr-event-process-t)
     :scene-focus-changed (:struct vr-event-process-t)
     :input-focus-changed (:struct vr-event-process-t)
     :scene-application-secondary-rendering-started (:struct vr-event-process-t)
     :hide-render-models nil
     :show-render-models nil
     :overlay-shown nil
     :overlay-hidden nil
     :dashboard-activated nil
     :dashboard-deactivated nil
     :dashboard-thumb-selected (:struct vr-event-overlay-t)
     :dashboard-requested (:struct vr-event-overlay-t)
     :reset-dashboard nil
     :render-toast (:struct vr-event-notification-t) ;;?
     :image-loaded nil
     :show-keyboard nil
     :hide-keyboard nil
     :overlay-gamepad-focus-gained nil
     :overlay-gamepad-focus-lost nil
     :overlay-shared-texture-changed nil
     :dashboard-guide-button-down nil
     :dashboard-guide-button-up nil
     :screenshot-triggered nil
     :image-failed nil
     :dashboard-overlay-created nil
     :request-screenshot nil
     :screenshot-taken nil
     :screenshot-failed nil
     :submit-screenshot-to-dashboard nil
     :screenshot-progress-to-dashboard nil
     :primary-dashboard-device-changed nil
     :notification-shown nil
     :notification-hidden nil
     :notification-begin-interaction nil
     :notification-destroyed nil
     :quit (:struct vr-event-process-t)
     :process-quit (:struct vr-event-process-t)
     :quit-aborted-user-prompt (:struct vr-event-process-t)
     :quit-acknowledged (:struct vr-event-process-t)
     :driver-requested-quit nil
     :chaperone-data-has-changed nil
     :chaperone-universe-has-changed nil
     :chaperone-temp-data-has-changed nil
     :chaperone-settings-have-changed nil
     :seated-zero-pose-reset nil
     :audio-settings-have-changed nil
     :background-setting-has-changed nil
     :camera-settings-have-changed nil
     :reprojection-setting-has-changed nil
     :model-skin-settings-have-changed nil
     :environment-settings-have-changed nil
     :power-settings-have-changed nil
     :enable-home-app-settings-have-changed nil
     :status-update nil
     :mcimage-updated nil
     :firmware-update-started nil
     :firmware-update-finished nil
     :keyboard-closed nil
     :keyboard-char-input nil
     :keyboard-done nil
     :application-transition-started nil
     :application-transition-aborted nil
     :application-transition-new-app-started nil
     :application-list-updated nil
     :application-mime-type-load nil
     :application-transition-new-app-launch-complete nil
     :process-connected nil
     :process-disconnected nil
     :compositor-mirror-window-shown nil
     :compositor-mirror-window-hidden nil
     :compositor-chaperone-bounds-shown nil
     :compositor-chaperone-bounds-hidden nil
     :tracked-camera-start-video-stream nil
     :tracked-camera-stop-video-stream nil
     :tracked-camera-pause-video-stream nil
     :tracked-camera-resume-video-stream nil
     :tracked-camera-editing-surface nil
     :performance-test-enable-capture nil
     :performance-test-disable-capture nil
     :performance-test-fidelity-level nil
     :message-overlay-closed nil
     :message-overlay-close-requested nil
     :vendor-specific-reserved-start nil
     :vendor-specific-reserved-end nil)))

(defmethod cffi:translate-from-foreign (value (type vr-event-t-tclass))
  (let* ((type (cffi:foreign-enum-keyword
                'vr-event-type
                (cffi:foreign-slot-value value '(:struct vr-event-t)
                                         'event-type)))
         (union (gethash type *event-type-map*))
         (tracked-device-index (cffi:foreign-slot-value value
                                                        '(:struct vr-event-t)
                                                        'tracked-device-index))
         (event-age-seconds (cffi:foreign-slot-value value
                                                     '(:struct vr-event-t)
                                                     'event-age-seconds))
         (offset (cffi:foreign-slot-offset '(:struct vr-event-t) 'data))
         (size (cffi:foreign-type-size '(:struct vr-event-t)))
         (data (if union
                   (cffi:mem-ref
                    (cffi:foreign-slot-pointer value '(:struct vr-event-t)
                                               'data)
                    union)
                   (coerce
                    (loop for i from offset below size
                          collect (cffi:mem-aref value :uint8 i))
                    '(simple-array (unsigned-byte 8) (*))))))
    (list :event-type type
          :tracked-device-index tracked-device-index
          :event-age-seconds event-age-seconds
          :data data)))

(cffi:defcfun (%vr-init-internal "VR_InitInternal") :intptr
  (pe-error (:pointer vr-init-error))
  (type vr-application-type))

(cffi:defcfun (%vr-init-internal2 "VR_InitInternal2") :intptr
  (pe-error (:pointer vr-init-error))
  (type vr-application-type)
  (startup-info :string))

(cffi:defcfun (vr-shutdown-internal "VR_ShutdownInternal") :void)

(cffi:defcfun (vr-is-hmd-present "VR_IsHmdPresent") :bool)

(cffi:defcfun (vr-get-init-token "VR_GetInitToken") :uint32)


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

(defun clear ()
  (setf *system* nil)
  (setf *chaperone* nil)
  (setf *chaperone-setup* nil)
  (setf *compositor* nil)
  (setf *overlay* nil)
  (setf *render-models* nil)
  (setf *extended-display* nil)
  (setf *settings* nil)
  (setf *applications* nil)
  (setf *tracked-camera* nil)
  (setf *resources* nil)
  (setf *screenshots* nil))

(defun check-clear ()
  (unless (eql *%init* (vr-get-init-token))
    (clear)
    (setf *%init* (vr-get-init-token))))

(defun vr-system ()
  (check-clear)
  (unless *system*
    (setf *system* (make-instance 'vr-system)))
  *system*)

(defun vr-chaperone ()
  (check-clear)
  (unless *chaperone*
    (setf *chaperone* (make-instance 'vr-chaperone)))
  *chaperone*)

(defun vr-chaperone-setup ()
  (check-clear)
  (unless *chaperone-setup*
    (setf *chaperone-setup* (make-instance 'vr-chaperone-setup)))
  *chaperone-setup*)

(defun vr-compositor ()
  (check-clear)
  (unless *compositor*
    (setf *compositor* (make-instance 'vr-compositor)))
  *compositor*)

(defun vr-overlay ()
  (check-clear)
  (unless *overlay*
    (setf *overlay* (make-instance 'vr-overlay)))
  *overlay*)

(defun vr-render-models ()
  (check-clear)
  (unless *render-models*
    (setf *render-models* (make-instance 'vr-render-models)))
  *render-models*)

(defun vr-extended-display ()
  (check-clear)
  (unless *extended-display*
    (setf *extended-display* (make-instance 'vr-extended-display)))
  *extended-display*)

(defun vr-settings ()
  (check-clear)
  (unless *settings*
    (setf *settings* (make-instance 'vr-settings)))
  *settings*)

(defun vr-applications ()
  (check-clear)
  (unless *applications*
    (setf *applications* (make-instance 'vr-applications)))
  *applications*)

(defun vr-tracked-camera ()
  (check-clear)
  (unless *tracked-camera*
    (setf *tracked-camera* (make-instance 'vr-tracked-camera)))
  *tracked-camera*)

(defun vr-resources ()
  (check-clear)
  (unless *resources*
    (setf *resources* (make-instance 'vr-resources)))
  *resources*)

(defun vr-screenshots ()
  (check-clear)
  (unless *screenshots*
    (setf *screenshots* (make-instance 'vr-screenshots)))
  *screenshots*)

(defmacro with-vr ((&key (application-type :scene)
                      (system t) (render-models t)) &body body)
  `(let ((*%init* (vr-init ,application-type))
         (*system* nil)
         (*chaperone* nil)
         (*chaperone-setup* nil)
         (*compositor* nil)
         (*overlay* nil)
         (*render-models* nil)
         (*extended-display* nil)
         (*settings* nil)
         (*applications* nil)
         (*tracked-camera* nil)
         (*resources* nil)
         (*screenshots* nil))
     (unwind-protect
          (progn ,@(when system '((vr-system)))
                 ,@(when render-models '((vr-render-models)))
                 ,@body)
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

(defmacro check-ret (call &key (ok '(:success :none)))
  `(let ((r ,call))
     (unless (member r ',ok)
       (error "~a failed: ~a" ',(car call) r))
     r))

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


;;; vr-system methods
(defun poll-next-event (&key (system *system*))
  (cffi:with-foreign-object (ev '(:struct vr-event-t))
    (when (%poll-next-event (table system) ev (cffi:foreign-type-size
                                               '(:struct vr-event-t)))
      (let ((R (multiple-value-list
                (ignore-errors
                 (cffi:mem-ref ev '(:struct vr-event-t))))))
        (when (second r)
          (format t "~&~a?~%" (second r))
          (loop for i below 40
                do (format t " #~2,'0x" (cffi:mem-aref ev :uint8 i))
                when (zerop (mod (1+ i) 8))
                  do (format t "~%")))
        (first r)))))

(defun get-controller-state (device &key (system *system*))
  (cffi:with-foreign-object (state '(:struct vr-controller-state-001-t))
    (when (%get-controller-state (table system) device state
                                 (cffi:foreign-type-size
                                  '(:struct vr-controller-state-001-t)))
      (cffi:mem-ref state '(:struct vr-controller-state-001-t)))))

(defun is-tracked-device-connected (index &key (system *system*))
  (%is-tracked-device-connected (table system) index))

(defun get-tracked-device-class (index &key (system *system*))
  (%get-tracked-device-class (table system) index))

(defun get-recommended-render-target-size (&key (system *system*))
  (cffi:with-foreign-objects ((w :uint32)
                              (h :uint32))
    (%get-recommended-render-target-size (table system) w h)
    ;; should this return list, values, or some struct/class or something?
    (list (cffi:mem-ref w :uint32)
          (cffi:mem-ref h :uint32))))

(defun get-projection-matrix (eye near far &key (system *system*))
  (%get-projection-matrix (table system) eye near far))

(defun get-eye-to-head-transform (eye &key (system *system*))
  (%get-eye-to-head-transform (table system) eye))

(defun is-input-focus-captured-by-another-process (&key (system *system*))
  (%is-input-focus-captured-by-another-process (table system)))

;;; vr-extended-display methods

;;; vr-tracked-camera methods

;;; vr-applications methods

;;; vr-chaperone methods

;;; vr-chaperone-setup methods

;;; vr-compositor methods
(defun submit (eye texture &key (compositor *compositor*)
                             bounds (flags :default))
  (cffi:with-foreign-objects ((ptexture '(:struct texture-t))
                              (pbounds '(:struct vr-texture-bounds-t)))
    (when (numberp (getf texture 'handle))
      (setf (getf texture 'handle) (cffi:make-pointer (getf texture 'handle))))
    (setf (cffi:mem-ref ptexture '(:struct texture-t)) texture)
    (when bounds
      (setf (cffi:mem-ref pbounds '(:struct vr-texture-bounds-t)) bounds))
    (%submit (table compositor) eye ptexture (if bounds
                                                 pbounds
                                                 (cffi:null-pointer))
             (alexandria:ensure-list flags))))

(defun wait-get-poses  (pose-array game-pose-array
                        &key (compositor *compositor*))
  (cffi:with-foreign-objects ((ppa '(:struct tracked-device-pose-t)
                                   (length pose-array))
                              (pgpa '(:struct tracked-device-pose-t)
                                    (length game-pose-array)))
    (check-ret
     (%wait-get-poses (table compositor)
                      (if pose-array ppa (null-pointer))
                      (length pose-array)
                      (if game-pose-array pgpa (null-pointer))
                      (length game-pose-array)))
    (loop for i below (length pose-array)
          for p = (cffi:mem-aptr ppa '(:struct tracked-device-pose-t) i)
          do (setf (aref pose-array i)
                   (if (cffi:foreign-slot-value p
                                                '(:struct tracked-device-pose-t)
                                                'pose-is-valid)
                       (cffi:mem-ref p '(:struct tracked-device-pose-t))
                       (list 'pose-is-valid nil))))

    (loop for i below (length game-pose-array)
          for p = (cffi:mem-aptr pgpa '(:struct tracked-device-pose-t) i)
          do (setf (aref game-pose-array i)
                   (if (cffi:foreign-slot-value p
                                                '(:struct tracked-device-pose-t)
                                                'pose-is-valid)
                       (cffi:mem-ref p '(:struct tracked-device-pose-t))
                       (list 'pose-is-valid nil))))))


;;; vr-overlay methods

;;; vr-render-models methods
(defun load-render-model-async (name &key (render-models *render-models*))
  (cffi:with-foreign-object (prm '(:pointer (:struct render-model-t)))
    (let ((r (check-ret
              (%load-render-model-async (table render-models) name prm)
              :ok (:none :loading))))
      ;; return NIL to indicate :loading for now. possibly should
      ;; error w/restarts, but that sounds annoying for general case,
      ;; since :loading is probably most common return value.
      (when (eql r :none)
        (cffi:mem-ref
         (cffi:mem-ref prm '(:pointer (:struct render-model-t)))
         '(:struct render-model-t))))))

(defun load-texture-async (name &key (render-models *render-models*))
  (cffi:with-foreign-object (prmt '(:pointer
                                    (:struct render-model-texture-map-t)))
    (let ((r (check-ret
              (%load-texture-async (table render-models) name prmt)
              :ok (:none :loading))))
      ;; return NIL for :loading
      (when (eql r :none)
        (cffi:mem-ref
         (cffi:mem-ref prmt '(:pointer (:struct render-model-texture-map-t)))
         '(:struct render-model-texture-map-t))))))

(defun free-render-model (model &key (render-models *render-models*))
  (cffi:with-foreign-object (prm '(:struct render-model-t))
    (setf (cffi:mem-ref prm '(:struct render-model-t))
          model)
    (%free-render-model (table render-models) prm)))

(defun free-texture (texture &key (render-models *render-models*))
  (cffi:with-foreign-object (prmt '(:struct render-model-texture-map-t))
    (setf (cffi:mem-ref prmt '(:struct render-model-texture-map-t))
          texture)
    (%free-texture (table render-models) prmt)))

;;; vr-notifications methods

;;; vr-settings methods

;;; vr-screenshots methods

;;; vr-resources methods

;;; vr-driver-manager methods






