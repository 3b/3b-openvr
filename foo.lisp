#++ (ql:quickload '(sb-cga 3b-openvr))
(in-package 3b-openvr)

#++
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
                                           (cadr p) (car p))))
  (loop repeat 10
        do (loop for ev = (poll-next-event)
                 for i from 0
                 while ev
                 do (format t "got event ~s:~% ~s~%" i ev))

           ;; process SteamVR controller state
           (loop for device below +max-tracked-device-count+
                 for state = (get-controller-state device)
                 when state
                   do (format t "got controller ~s: ~s~%"
                              device state))
           (sleep 1)))

