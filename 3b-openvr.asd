(defsystem :3b-openvr
  :description "Common Lisp bindings for the OpenVR API"
  :depends-on (cffi-libffi alexandria trivial-features)
  :serial t
  :license "MIT"
  :author "Bart Botta <00003b at gmail.com>"
  :components (;(:file "package")
               (:file "low-level")
               (:file "wrappers")
               (:file "library")
               #++
               (:file "foo")))
