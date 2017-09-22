(in-package 3b-openvr)

;; fixme: configurable paths (or detect from registry or whatever?)
#+ (and windows x86-64)
(pushnew #P"c:/Program Files (x86)/Steam/steamapps/common/SteamVR/bin/win64/"
         cffi:*foreign-library-directories*
         :test 'equalp)

#+ (and windows x86)
(pushnew #P"c:/Program Files (x86)/Steam/steamapps/common/SteamVR/bin/win32/"
         cffi:*foreign-library-directories*
         :test 'equalp)

;; todo: figure out library name/path on linux/osx

(cffi:define-foreign-library openvr-api
  (:windows "openvr_api.dll"))

(cffi:use-foreign-library openvr-api)
