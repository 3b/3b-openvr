#++ (ql:quickload '(alexandria cffi 3bgl-misc sb-cga trivial-features))
(in-package 3b-openvr)

(with-vr ()
  (format t "running ~s, ~s...~%" *system* *render-models*)
  (format t "driver = ~s~%" (get-string-tracked-device-property
                             +tracked-device-index-hmd+
                             :tracking-system-name-string))
  (format t "device = ~s~%" (get-string-tracked-device-property
                             +tracked-device-index-hmd+
                             :serial-number-string))
  #++(format t "mat = ~s~%" (get-tracked-device-property
                             +tracked-device-index-hmd+
                             :CAMERA-TO-HEAD-TRANSFORM-MATRIX-34))
  (loop for i in (cffi:foreign-enum-keyword-list 'tracked-device-property)
        for p = (multiple-value-list
                 (ignore-errors (get-tracked-device-property
                                 +tracked-device-index-hmd+
                                 i)))
        do (format t "~(~s~) = ~a~%" i (if (cadr p)
                                           (cadr p) (car p)))))
