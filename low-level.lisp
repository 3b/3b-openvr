;;; generated file, do not edit
(defpackage 3b-openvr
  (:use :cl)
  (:import-from #:cffi
    #:DEFCENUM
    #:DEFCFUN
    #:DEFCTYPE
    #:DEFCSTRUCT
    #:DEFCUNION
    #:DEFBITFIELD
    #:NULL-POINTER
    #:FOREIGN-FUNCALL-POINTER))
(in-package 3b-openvr)



(defcstruct VK-DEVICE-T)
(defcstruct VK-PHYSICAL-DEVICE-T)
(defcstruct VK-INSTANCE-T)
(defcstruct VK-QUEUE-T)
(defcstruct D3D12-RESOURCE)
(defcstruct D3D12-COMMAND-QUEUE)


(defconstant +driver-none+ 4294967295) ;; const uint32_t
(defconstant +max-driver-debug-response-size+ 32768) ;; const uint32_t
(defconstant +tracked-device-index-hmd+ 0) ;; const uint32_t
(defconstant +max-tracked-device-count+ 16) ;; const uint32_t
(defconstant +tracked-device-index-other+ 4294967294) ;; const uint32_t
(defconstant +tracked-device-index-invalid+ 4294967295) ;; const uint32_t
(defconstant +invalid-property-container+ 0) ;; const PropertyContainerHandle_t
(defconstant +invalid-property-tag+ 0) ;; const PropertyTypeTag_t
(defconstant +float-property-tag+ 1) ;; const PropertyTypeTag_t
(defconstant +int32-property-tag+ 2) ;; const PropertyTypeTag_t
(defconstant +uint64-property-tag+ 3) ;; const PropertyTypeTag_t
(defconstant +bool-property-tag+ 4) ;; const PropertyTypeTag_t
(defconstant +string-property-tag+ 5) ;; const PropertyTypeTag_t
(defconstant +hmd-matrix-34-property-tag+ 20) ;; const PropertyTypeTag_t
(defconstant +hmd-matrix-44-property-tag+ 21) ;; const PropertyTypeTag_t
(defconstant +hmd-vector-3-property-tag+ 22) ;; const PropertyTypeTag_t
(defconstant +hmd-vector-4-property-tag+ 23) ;; const PropertyTypeTag_t
(defconstant +hidden-area-property-tag+ 30) ;; const PropertyTypeTag_t
(defconstant +open-vr-internal-reserved-start+ 1000) ;; const PropertyTypeTag_t
(defconstant +open-vr-internal-reserved-end+ 10000) ;; const PropertyTypeTag_t
(defconstant +max-property-string-size+ 32768) ;; const uint32_t
(defconstant +controller-state-axis-count+ 5) ;; const uint32_t
(defconstant +overlay-handle-invalid+ 0) ;; const VROverlayHandle_t
(defconstant +screenshot-handle-invalid+ 0) ;; const uint32_t
(alexandria:define-constant +vr-system-version+ "IVRSystem_017" :test 'string=) ;; const char *const
(alexandria:define-constant +vr-extended-display-version+ "IVRExtendedDisplay_001" :test 'string=) ;; const char *const
(alexandria:define-constant +vr-tracked-camera-version+ "IVRTrackedCamera_003" :test 'string=) ;; const char *const
(defconstant +max-application-key-length+ 128) ;; const uint32_t
(alexandria:define-constant +mime-type-home-app+ "vr/home" :test 'string=) ;; const char *const
(alexandria:define-constant +mime-type-game-theater+ "vr/game_theater" :test 'string=) ;; const char *const
(alexandria:define-constant +vr-applications-version+ "IVRApplications_006" :test 'string=) ;; const char *const
(alexandria:define-constant +vr-chaperone-version+ "IVRChaperone_003" :test 'string=) ;; const char *const
(alexandria:define-constant +vr-chaperone-setup-version+ "IVRChaperoneSetup_005" :test 'string=) ;; const char *const
(alexandria:define-constant +vr-compositor-version+ "IVRCompositor_021" :test 'string=) ;; const char *const
(defconstant +vr-overlay-max-key-length+ 128) ;; const uint32_t
(defconstant +vr-overlay-max-name-length+ 128) ;; const uint32_t
(defconstant +max-overlay-count+ 64) ;; const uint32_t
(defconstant +max-overlay-intersection-mask-primitives-count+ 32) ;; const uint32_t
(alexandria:define-constant +vr-overlay-version+ "IVROverlay_016" :test 'string=) ;; const char *const
(alexandria:define-constant +controller-component-gdc-2015+ "gdc2015" :test 'string=) ;; const char *const
(alexandria:define-constant +controller-component-base+ "base" :test 'string=) ;; const char *const
(alexandria:define-constant +controller-component-tip+ "tip" :test 'string=) ;; const char *const
(alexandria:define-constant +controller-component-hand-grip+ "handgrip" :test 'string=) ;; const char *const
(alexandria:define-constant +controller-component-status+ "status" :test 'string=) ;; const char *const
(alexandria:define-constant +vr-render-models-version+ "IVRRenderModels_005" :test 'string=) ;; const char *const
(defconstant +notification-text-max-size+ 256) ;; const uint32_t
(alexandria:define-constant +vr-notifications-version+ "IVRNotifications_002" :test 'string=) ;; const char *const
(defconstant +max-settings-key-length+ 128) ;; const uint32_t
(alexandria:define-constant +vr-settings-version+ "IVRSettings_002" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-section+ "steamvr" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-require-hmd-string+ "requireHmd" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-forced-driver-key-string+ "forcedDriver" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-forced-hmd-key-string+ "forcedHmd" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-display-debug-bool+ "displayDebug" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-debug-process-pipe-string+ "debugProcessPipe" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-display-debug-x-int32+ "displayDebugX" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-display-debug-y-int32+ "displayDebugY" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-send-system-button-to-all-apps-bool+ "sendSystemButtonToAllApps" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-log-level-int32+ "loglevel" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-ipd-float+ "ipd" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-background-string+ "background" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-background-use-dome-projection-bool+ "backgroundUseDomeProjection" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-background-camera-height-float+ "backgroundCameraHeight" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-background-dome-radius-float+ "backgroundDomeRadius" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-grid-color-string+ "gridColor" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-play-area-color-string+ "playAreaColor" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-show-stage-bool+ "showStage" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-activate-multiple-drivers-bool+ "activateMultipleDrivers" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-direct-mode-bool+ "directMode" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-direct-mode-edid-vid-int32+ "directModeEdidVid" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-direct-mode-edid-pid-int32+ "directModeEdidPid" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-using-speakers-bool+ "usingSpeakers" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-speakers-forward-yaw-offset-degrees-float+ "speakersForwardYawOffsetDegrees" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-base-station-power-management-bool+ "basestationPowerManagement" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-never-kill-processes-bool+ "neverKillProcesses" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-supersample-scale-float+ "supersampleScale" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-allow-async-reprojection-bool+ "allowAsyncReprojection" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-allow-reprojection-bool+ "allowInterleavedReprojection" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-force-reprojection-bool+ "forceReprojection" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-force-fade-on-bad-tracking-bool+ "forceFadeOnBadTracking" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-default-mirror-view-int32+ "defaultMirrorView" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-show-mirror-view-bool+ "showMirrorView" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-mirror-view-geometry-string+ "mirrorViewGeometry" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-start-monitor-from-app-launch+ "startMonitorFromAppLaunch" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-start-compositor-from-app-launch-bool+ "startCompositorFromAppLaunch" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-start-dashboard-from-app-launch-bool+ "startDashboardFromAppLaunch" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-start-overlay-apps-from-dashboard-bool+ "startOverlayAppsFromDashboard" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-enable-home-app+ "enableHomeApp" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-cycle-background-image-time-sec-int32+ "CycleBackgroundImageTimeSec" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-retail-demo-bool+ "retailDemo" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-ipd-offset-float+ "ipdOffset" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-allow-supersample-filtering-bool+ "allowSupersampleFiltering" :test 'string=) ;; const char *const
(alexandria:define-constant +steam-vr-enable-linux-vulkan-async-bool+ "enableLinuxVulkanAsync" :test 'string=) ;; const char *const
(alexandria:define-constant +lighthouse-section+ "driver_lighthouse" :test 'string=) ;; const char *const
(alexandria:define-constant +lighthouse-disable-imu-bool+ "disableimu" :test 'string=) ;; const char *const
(alexandria:define-constant +lighthouse-use-disambiguation-string+ "usedisambiguation" :test 'string=) ;; const char *const
(alexandria:define-constant +lighthouse-disambiguation-debug-int32+ "disambiguationdebug" :test 'string=) ;; const char *const
(alexandria:define-constant +lighthouse-primary-basestation-int32+ "primarybasestation" :test 'string=) ;; const char *const
(alexandria:define-constant +lighthouse-dbhistory-bool+ "dbhistory" :test 'string=) ;; const char *const
(alexandria:define-constant +null-section+ "driver_null" :test 'string=) ;; const char *const
(alexandria:define-constant +null-serial-number-string+ "serialNumber" :test 'string=) ;; const char *const
(alexandria:define-constant +null-model-number-string+ "modelNumber" :test 'string=) ;; const char *const
(alexandria:define-constant +null-window-x-int32+ "windowX" :test 'string=) ;; const char *const
(alexandria:define-constant +null-window-y-int32+ "windowY" :test 'string=) ;; const char *const
(alexandria:define-constant +null-window-width-int32+ "windowWidth" :test 'string=) ;; const char *const
(alexandria:define-constant +null-window-height-int32+ "windowHeight" :test 'string=) ;; const char *const
(alexandria:define-constant +null-render-width-int32+ "renderWidth" :test 'string=) ;; const char *const
(alexandria:define-constant +null-render-height-int32+ "renderHeight" :test 'string=) ;; const char *const
(alexandria:define-constant +null-seconds-from-vsync-to-photons-float+ "secondsFromVsyncToPhotons" :test 'string=) ;; const char *const
(alexandria:define-constant +null-display-frequency-float+ "displayFrequency" :test 'string=) ;; const char *const
(alexandria:define-constant +user-interface-section+ "userinterface" :test 'string=) ;; const char *const
(alexandria:define-constant +user-interface-status-always-on-top-bool+ "StatusAlwaysOnTop" :test 'string=) ;; const char *const
(alexandria:define-constant +user-interface-minimize-to-tray-bool+ "MinimizeToTray" :test 'string=) ;; const char *const
(alexandria:define-constant +user-interface-screenshots-bool+ "screenshots" :test 'string=) ;; const char *const
(alexandria:define-constant +user-interface-screenshot-type-int+ "screenshotType" :test 'string=) ;; const char *const
(alexandria:define-constant +notifications-section+ "notifications" :test 'string=) ;; const char *const
(alexandria:define-constant +notifications-do-not-disturb-bool+ "DoNotDisturb" :test 'string=) ;; const char *const
(alexandria:define-constant +keyboard-section+ "keyboard" :test 'string=) ;; const char *const
(alexandria:define-constant +keyboard-tutorial-completions+ "TutorialCompletions" :test 'string=) ;; const char *const
(alexandria:define-constant +keyboard-scale-x+ "ScaleX" :test 'string=) ;; const char *const
(alexandria:define-constant +keyboard-scale-y+ "ScaleY" :test 'string=) ;; const char *const
(alexandria:define-constant +keyboard-offset-left-x+ "OffsetLeftX" :test 'string=) ;; const char *const
(alexandria:define-constant +keyboard-offset-right-x+ "OffsetRightX" :test 'string=) ;; const char *const
(alexandria:define-constant +keyboard-offset-y+ "OffsetY" :test 'string=) ;; const char *const
(alexandria:define-constant +keyboard-smoothing+ "Smoothing" :test 'string=) ;; const char *const
(alexandria:define-constant +perf-section+ "perfcheck" :test 'string=) ;; const char *const
(alexandria:define-constant +perf-heuristic-active-bool+ "heuristicActive" :test 'string=) ;; const char *const
(alexandria:define-constant +perf-notify-in-hmd-bool+ "warnInHMD" :test 'string=) ;; const char *const
(alexandria:define-constant +perf-notify-only-once-bool+ "warnOnlyOnce" :test 'string=) ;; const char *const
(alexandria:define-constant +perf-allow-timing-store-bool+ "allowTimingStore" :test 'string=) ;; const char *const
(alexandria:define-constant +perf-save-timings-on-exit-bool+ "saveTimingsOnExit" :test 'string=) ;; const char *const
(alexandria:define-constant +perf-test-data-float+ "perfTestData" :test 'string=) ;; const char *const
(alexandria:define-constant +perf-linux-gpuprofiling-bool+ "linuxGPUProfiling" :test 'string=) ;; const char *const
(alexandria:define-constant +collision-bounds-section+ "collisionBounds" :test 'string=) ;; const char *const
(alexandria:define-constant +collision-bounds-style-int32+ "CollisionBoundsStyle" :test 'string=) ;; const char *const
(alexandria:define-constant +collision-bounds-ground-perimeter-on-bool+ "CollisionBoundsGroundPerimeterOn" :test 'string=) ;; const char *const
(alexandria:define-constant +collision-bounds-center-marker-on-bool+ "CollisionBoundsCenterMarkerOn" :test 'string=) ;; const char *const
(alexandria:define-constant +collision-bounds-play-space-on-bool+ "CollisionBoundsPlaySpaceOn" :test 'string=) ;; const char *const
(alexandria:define-constant +collision-bounds-fade-distance-float+ "CollisionBoundsFadeDistance" :test 'string=) ;; const char *const
(alexandria:define-constant +collision-bounds-color-gamma-r-int32+ "CollisionBoundsColorGammaR" :test 'string=) ;; const char *const
(alexandria:define-constant +collision-bounds-color-gamma-g-int32+ "CollisionBoundsColorGammaG" :test 'string=) ;; const char *const
(alexandria:define-constant +collision-bounds-color-gamma-b-int32+ "CollisionBoundsColorGammaB" :test 'string=) ;; const char *const
(alexandria:define-constant +collision-bounds-color-gamma-a-int32+ "CollisionBoundsColorGammaA" :test 'string=) ;; const char *const
(alexandria:define-constant +camera-section+ "camera" :test 'string=) ;; const char *const
(alexandria:define-constant +camera-enable-camera-bool+ "enableCamera" :test 'string=) ;; const char *const
(alexandria:define-constant +camera-enable-camera-in-dashboard-bool+ "enableCameraInDashboard" :test 'string=) ;; const char *const
(alexandria:define-constant +camera-enable-camera-for-collision-bounds-bool+ "enableCameraForCollisionBounds" :test 'string=) ;; const char *const
(alexandria:define-constant +camera-enable-camera-for-room-view-bool+ "enableCameraForRoomView" :test 'string=) ;; const char *const
(alexandria:define-constant +camera-bounds-color-gamma-r-int32+ "cameraBoundsColorGammaR" :test 'string=) ;; const char *const
(alexandria:define-constant +camera-bounds-color-gamma-g-int32+ "cameraBoundsColorGammaG" :test 'string=) ;; const char *const
(alexandria:define-constant +camera-bounds-color-gamma-b-int32+ "cameraBoundsColorGammaB" :test 'string=) ;; const char *const
(alexandria:define-constant +camera-bounds-color-gamma-a-int32+ "cameraBoundsColorGammaA" :test 'string=) ;; const char *const
(alexandria:define-constant +camera-bounds-strength-int32+ "cameraBoundsStrength" :test 'string=) ;; const char *const
(alexandria:define-constant +audio-section+ "audio" :test 'string=) ;; const char *const
(alexandria:define-constant +audio-on-playback-device-string+ "onPlaybackDevice" :test 'string=) ;; const char *const
(alexandria:define-constant +audio-on-record-device-string+ "onRecordDevice" :test 'string=) ;; const char *const
(alexandria:define-constant +audio-on-playback-mirror-device-string+ "onPlaybackMirrorDevice" :test 'string=) ;; const char *const
(alexandria:define-constant +audio-off-playback-device-string+ "offPlaybackDevice" :test 'string=) ;; const char *const
(alexandria:define-constant +audio-off-record-device-string+ "offRecordDevice" :test 'string=) ;; const char *const
(alexandria:define-constant +audio-vivehdmigain+ "viveHDMIGain" :test 'string=) ;; const char *const
(alexandria:define-constant +power-section+ "power" :test 'string=) ;; const char *const
(alexandria:define-constant +power-power-off-on-exit-bool+ "powerOffOnExit" :test 'string=) ;; const char *const
(alexandria:define-constant +power-turn-off-screens-timeout-float+ "turnOffScreensTimeout" :test 'string=) ;; const char *const
(alexandria:define-constant +power-turn-off-controllers-timeout-float+ "turnOffControllersTimeout" :test 'string=) ;; const char *const
(alexandria:define-constant +power-return-to-watchdog-timeout-float+ "returnToWatchdogTimeout" :test 'string=) ;; const char *const
(alexandria:define-constant +power-auto-launch-steam-vr-on-button-press+ "autoLaunchSteamVROnButtonPress" :test 'string=) ;; const char *const
(alexandria:define-constant +power-pause-compositor-on-standby-bool+ "pauseCompositorOnStandby" :test 'string=) ;; const char *const
(alexandria:define-constant +dashboard-section+ "dashboard" :test 'string=) ;; const char *const
(alexandria:define-constant +dashboard-enable-dashboard-bool+ "enableDashboard" :test 'string=) ;; const char *const
(alexandria:define-constant +dashboard-arcade-mode-bool+ "arcadeMode" :test 'string=) ;; const char *const
(alexandria:define-constant +modelskin-section+ "modelskins" :test 'string=) ;; const char *const
(alexandria:define-constant +driver-enable-bool+ "enable" :test 'string=) ;; const char *const
(alexandria:define-constant +vr-screenshots-version+ "IVRScreenshots_001" :test 'string=) ;; const char *const
(alexandria:define-constant +vr-resources-version+ "IVRResources_001" :test 'string=) ;; const char *const
(alexandria:define-constant +vr-driver-manager-version+ "IVRDriverManager_001" :test 'string=) ;; const char *const


(defcenum vr-eye
  (:left 0)
  (:right 1))

(defcenum texture-type
  (:direct-x 0)
  (:open-gl 1)
  (:vulkan 2)
  (:osurface 3)
  (:direct-x-12 4))

(defcenum color-space
  (:auto 0)
  (:gamma 1)
  (:linear 2))

(defcenum tracking-result
  (:uninitialized 1)
  (:calibrating-in-progress 100)
  (:calibrating-out-of-range 101)
  (:running-ok 200)
  (:running-out-of-range 201))

(defcenum tracked-device-class
  (:invalid 0)
  (:hmd 1)
  (:controller 2)
  (:generic-tracker 3)
  (:tracking-reference 4)
  (:display-redirect 5))

(defcenum tracked-controller-role
  (:invalid 0)
  (:left-hand 1)
  (:right-hand 2))

(defcenum tracking-universe-origin
  (:seated 0)
  (:standing 1)
  (:raw-and-uncalibrated 2))

(defcenum tracked-device-property
  (:invalid 0)
  (:tracking-system-name-string 1000)
  (:model-number-string 1001)
  (:serial-number-string 1002)
  (:render-model-name-string 1003)
  (:will-drift-in-yaw-bool 1004)
  (:manufacturer-name-string 1005)
  (:tracking-firmware-version-string 1006)
  (:hardware-revision-string 1007)
  (:all-wireless-dongle-descriptions-string 1008)
  (:connected-wireless-dongle-string 1009)
  (:device-is-wireless-bool 1010)
  (:device-is-charging-bool 1011)
  (:device-battery-percentage-float 1012)
  (:status-display-transform-matrix-34 1013)
  (:firmware-update-available-bool 1014)
  (:firmware-manual-update-bool 1015)
  (:firmware-manual-update-url-string 1016)
  (:hardware-revision-uint64 1017)
  (:firmware-version-uint64 1018)
  (:fpgaversion-uint64 1019)
  (:vr-cversion-uint64 1020)
  (:radio-version-uint64 1021)
  (:dongle-version-uint64 1022)
  (:block-server-shutdown-bool 1023)
  (:can-unify-coordinate-system-with-hmd-bool 1024)
  (:contains-proximity-sensor-bool 1025)
  (:device-provides-battery-status-bool 1026)
  (:device-can-power-off-bool 1027)
  (:firmware-programming-target-string 1028)
  (:device-class-int32 1029)
  (:has-camera-bool 1030)
  (:driver-version-string 1031)
  (:firmware-force-update-required-bool 1032)
  (:vive-system-button-fix-required-bool 1033)
  (:parent-driver-uint64 1034)
  (:resource-root-string 1035)
  (:reports-time-since-vsync-bool 2000)
  (:seconds-from-vsync-to-photons-float 2001)
  (:display-frequency-float 2002)
  (:user-ipd-meters-float 2003)
  (:current-universe-id-uint64 2004)
  (:previous-universe-id-uint64 2005)
  (:display-firmware-version-uint64 2006)
  (:is-on-desktop-bool 2007)
  (:display-mctype-int32 2008)
  (:display-mcoffset-float 2009)
  (:display-mcscale-float 2010)
  (:edid-vendor-id-int32 2011)
  (:display-mcimage-left-string 2012)
  (:display-mcimage-right-string 2013)
  (:display-gcblack-clamp-float 2014)
  (:edid-product-id-int32 2015)
  (:camera-to-head-transform-matrix-34 2016)
  (:display-gctype-int32 2017)
  (:display-gcoffset-float 2018)
  (:display-gcscale-float 2019)
  (:display-gcprescale-float 2020)
  (:display-gcimage-string 2021)
  (:lens-center-left-u-float 2022)
  (:lens-center-left-v-float 2023)
  (:lens-center-right-u-float 2024)
  (:lens-center-right-v-float 2025)
  (:user-head-to-eye-depth-meters-float 2026)
  (:camera-firmware-version-uint64 2027)
  (:camera-firmware-description-string 2028)
  (:display-fpgaversion-uint64 2029)
  (:display-bootloader-version-uint64 2030)
  (:display-hardware-version-uint64 2031)
  (:audio-firmware-version-uint64 2032)
  (:camera-compatibility-mode-int32 2033)
  (:screenshot-horizontal-field-of-view-degrees-float 2034)
  (:screenshot-vertical-field-of-view-degrees-float 2035)
  (:display-suppressed-bool 2036)
  (:display-allow-night-mode-bool 2037)
  (:display-mcimage-width-int32 2038)
  (:display-mcimage-height-int32 2039)
  (:display-mcimage-num-channels-int32 2040)
  (:display-mcimage-data-binary 2041)
  (:seconds-from-photons-to-vblank-float 2042)
  (:driver-direct-mode-sends-vsync-events-bool 2043)
  (:display-debug-mode-bool 2044)
  (:graphics-adapter-luid-uint64 2045)
  (:driver-provided-chaperone-path-string 2048)
  (:attached-device-id-string 3000)
  (:supported-buttons-uint64 3001)
  (:axis-0-type-int32 3002)
  (:axis-1-type-int32 3003)
  (:axis-2-type-int32 3004)
  (:axis-3-type-int32 3005)
  (:axis-4-type-int32 3006)
  (:controller-role-hint-int32 3007)
  (:field-of-view-left-degrees-float 4000)
  (:field-of-view-right-degrees-float 4001)
  (:field-of-view-top-degrees-float 4002)
  (:field-of-view-bottom-degrees-float 4003)
  (:tracking-range-minimum-meters-float 4004)
  (:tracking-range-maximum-meters-float 4005)
  (:mode-label-string 4006)
  (:icon-path-name-string 5000)
  (:named-icon-path-device-off-string 5001)
  (:named-icon-path-device-searching-string 5002)
  (:named-icon-path-device-searching-alert-string 5003)
  (:named-icon-path-device-ready-string 5004)
  (:named-icon-path-device-ready-alert-string 5005)
  (:named-icon-path-device-not-ready-string 5006)
  (:named-icon-path-device-standby-string 5007)
  (:named-icon-path-device-alert-low-string 5008)
  (:display-hidden-area-binary-start 5100)
  (:display-hidden-area-binary-end 5150)
  (:user-config-path-string 6000)
  (:install-path-string 6001)
  (:has-display-component-bool 6002)
  (:has-controller-component-bool 6003)
  (:has-camera-component-bool 6004)
  (:has-driver-direct-mode-component-bool 6005)
  (:has-virtual-display-component-bool 6006)
  (:vendor-specific-reserved-start 10000)
  (:vendor-specific-reserved-end 10999))

(defcenum tracked-property-error
  (:success 0)
  (:wrong-data-type 1)
  (:wrong-device-class 2)
  (:buffer-too-small 3)
  (:unknown-property 4)
  (:invalid-device 5)
  (:could-not-contact-server 6)
  (:value-not-provided-by-device 7)
  (:string-exceeds-maximum-length 8)
  (:not-yet-available 9)
  (:permission-denied 10)
  (:invalid-operation 11))

(defbitfield vr-submit-flags
  (:default 0)
  (:lens-distortion-already-applied 1)
  (:gl-render-buffer 2)
  (:reserved 4)
  (:texture-with-pose 8))

(defcenum vr-state
  (:undefined -1)
  (:off 0)
  (:searching 1)
  (:searching-alert 2)
  (:ready 3)
  (:ready-alert 4)
  (:not-ready 5)
  (:standby 6)
  (:ready-alert-low 7))

(defcenum vr-event-type
  (:none 0)
  (:tracked-device-activated 100)
  (:tracked-device-deactivated 101)
  (:tracked-device-updated 102)
  (:tracked-device-user-interaction-started 103)
  (:tracked-device-user-interaction-ended 104)
  (:ipd-changed 105)
  (:enter-standby-mode 106)
  (:leave-standby-mode 107)
  (:tracked-device-role-changed 108)
  (:watchdog-wake-up-requested 109)
  (:lens-distortion-changed 110)
  (:property-changed 111)
  (:wireless-disconnect 112)
  (:wireless-reconnect 113)
  (:button-press 200)
  (:button-unpress 201)
  (:button-touch 202)
  (:button-untouch 203)
  (:mouse-move 300)
  (:mouse-button-down 301)
  (:mouse-button-up 302)
  (:focus-enter 303)
  (:focus-leave 304)
  (:scroll 305)
  (:touch-pad-move 306)
  (:overlay-focus-changed 307)
  (:input-focus-captured 400)
  (:input-focus-released 401)
  (:scene-focus-lost 402)
  (:scene-focus-gained 403)
  (:scene-application-changed 404)
  (:scene-focus-changed 405)
  (:input-focus-changed 406)
  (:scene-application-secondary-rendering-started 407)
  (:hide-render-models 410)
  (:show-render-models 411)
  (:overlay-shown 500)
  (:overlay-hidden 501)
  (:dashboard-activated 502)
  (:dashboard-deactivated 503)
  (:dashboard-thumb-selected 504)
  (:dashboard-requested 505)
  (:reset-dashboard 506)
  (:render-toast 507)
  (:image-loaded 508)
  (:show-keyboard 509)
  (:hide-keyboard 510)
  (:overlay-gamepad-focus-gained 511)
  (:overlay-gamepad-focus-lost 512)
  (:overlay-shared-texture-changed 513)
  (:dashboard-guide-button-down 514)
  (:dashboard-guide-button-up 515)
  (:screenshot-triggered 516)
  (:image-failed 517)
  (:dashboard-overlay-created 518)
  (:request-screenshot 520)
  (:screenshot-taken 521)
  (:screenshot-failed 522)
  (:submit-screenshot-to-dashboard 523)
  (:screenshot-progress-to-dashboard 524)
  (:primary-dashboard-device-changed 525)
  (:notification-shown 600)
  (:notification-hidden 601)
  (:notification-begin-interaction 602)
  (:notification-destroyed 603)
  (:quit 700)
  (:process-quit 701)
  (:quit-aborted-user-prompt 702)
  (:quit-acknowledged 703)
  (:driver-requested-quit 704)
  (:chaperone-data-has-changed 800)
  (:chaperone-universe-has-changed 801)
  (:chaperone-temp-data-has-changed 802)
  (:chaperone-settings-have-changed 803)
  (:seated-zero-pose-reset 804)
  (:audio-settings-have-changed 820)
  (:background-setting-has-changed 850)
  (:camera-settings-have-changed 851)
  (:reprojection-setting-has-changed 852)
  (:model-skin-settings-have-changed 853)
  (:environment-settings-have-changed 854)
  (:power-settings-have-changed 855)
  (:enable-home-app-settings-have-changed 856)
  (:status-update 900)
  (:mcimage-updated 1000)
  (:firmware-update-started 1100)
  (:firmware-update-finished 1101)
  (:keyboard-closed 1200)
  (:keyboard-char-input 1201)
  (:keyboard-done 1202)
  (:application-transition-started 1300)
  (:application-transition-aborted 1301)
  (:application-transition-new-app-started 1302)
  (:application-list-updated 1303)
  (:application-mime-type-load 1304)
  (:application-transition-new-app-launch-complete 1305)
  (:process-connected 1306)
  (:process-disconnected 1307)
  (:compositor-mirror-window-shown 1400)
  (:compositor-mirror-window-hidden 1401)
  (:compositor-chaperone-bounds-shown 1410)
  (:compositor-chaperone-bounds-hidden 1411)
  (:tracked-camera-start-video-stream 1500)
  (:tracked-camera-stop-video-stream 1501)
  (:tracked-camera-pause-video-stream 1502)
  (:tracked-camera-resume-video-stream 1503)
  (:tracked-camera-editing-surface 1550)
  (:performance-test-enable-capture 1600)
  (:performance-test-disable-capture 1601)
  (:performance-test-fidelity-level 1602)
  (:message-overlay-closed 1650)
  (:message-overlay-close-requested 1651)
  (:vendor-specific-reserved-start 10000)
  (:vendor-specific-reserved-end 19999))

(defcenum device-activity-level
  (:unknown -1)
  (:idle 0)
  (:user-interaction 1)
  (:user-interaction-timeout 2)
  (:standby 3))

(defcenum vr-button-id
  (:system 0)
  (:application-menu 1)
  (:grip 2)
  (:dpad-left 3)
  (:dpad-up 4)
  (:dpad-right 5)
  (:dpad-down 6)
  (:a 7)
  (:proximity-sensor 31)
  (:axis-0 32)
  (:axis-1 33)
  (:axis-2 34)
  (:axis-3 35)
  (:axis-4 36)
  (:steam-vr-touchpad 32)
  (:steam-vr-trigger 33)
  (:dashboard-back 2)
  (:max 64))

(defcenum vr-mouse-button
  (:left 1)
  (:right 2)
  (:middle 4))

(defcenum hidden-area-mesh-type
  (:standard 0)
  (:inverse 1)
  (:line-loop 2)
  (:max 3))

(defcenum vr-controller-axis-type
  (:none 0)
  (:track-pad 1)
  (:joystick 2)
  (:trigger 3))

(defcenum vr-controller-event-output-type
  (:os-events 0)
  (:vr-events 1))

(defcenum collision-bounds-style
  (:beginner 0)
  (:ntermediate 1)
  (:squares 2)
  (:advanced 3)
  (:none 4)
  (:count 5))

(defcenum vr-overlay-error
  (:none 0)
  (:unknown-overlay 10)
  (:invalid-handle 11)
  (:permission-denied 12)
  (:overlay-limit-exceeded 13)
  (:wrong-visibility-type 14)
  (:key-too-long 15)
  (:name-too-long 16)
  (:key-in-use 17)
  (:wrong-transform-type 18)
  (:invalid-tracked-device 19)
  (:invalid-parameter 20)
  (:thumbnail-cant-be-destroyed 21)
  (:array-too-small 22)
  (:request-failed 23)
  (:invalid-texture 24)
  (:unable-to-load-file 25)
  (:keyboard-already-in-use 26)
  (:no-neighbor 27)
  (:too-many-mask-primitives 29)
  (:bad-mask-primitive 30))

(defcenum vr-application-type
  (:other 0)
  (:scene 1)
  (:overlay 2)
  (:background 3)
  (:utility 4)
  (:vr-monitor 5)
  (:steam-watchdog 6)
  (:bootstrapper 7)
  (:max 8))

(defcenum vr-firmware-error
  (:none 0)
  (:success 1)
  (:fail 2))

(defcenum vr-notification-error
  (:ok 0)
  (:invalid-notification-id 100)
  (:notification-queue-full 101)
  (:invalid-overlay-handle 102)
  (:system-with-user-value-already-exists 103))

(defcenum vr-init-error
  (:none 0)
  (:unknown 1)
  (:init-installation-not-found 100)
  (:init-installation-corrupt 101)
  (:init-vr-client-dllnot-found 102)
  (:init-file-not-found 103)
  (:init-factory-not-found 104)
  (:init-interface-not-found 105)
  (:init-invalid-interface 106)
  (:init-user-config-directory-invalid 107)
  (:init-hmd-not-found 108)
  (:init-not-initialized 109)
  (:init-path-registry-not-found 110)
  (:init-no-config-path 111)
  (:init-no-log-path 112)
  (:init-path-registry-not-writable 113)
  (:init-app-info-init-failed 114)
  (:init-retry 115)
  (:init-init-canceled-by-user 116)
  (:init-another-app-launching 117)
  (:init-settings-init-failed 118)
  (:init-shutting-down 119)
  (:init-too-many-objects 120)
  (:init-no-server-for-background-app 121)
  (:init-not-supported-with-compositor 122)
  (:init-not-available-to-utility-apps 123)
  (:init-internal 124)
  (:init-hmd-driver-id-is-none 125)
  (:init-hmd-not-found-presence-failed 126)
  (:init-vr-monitor-not-found 127)
  (:init-vr-monitor-startup-failed 128)
  (:init-low-power-watchdog-not-supported 129)
  (:init-invalid-application-type 130)
  (:init-not-available-to-watchdog-apps 131)
  (:init-watchdog-disabled-in-settings 132)
  (:init-vr-dashboard-not-found 133)
  (:init-vr-dashboard-startup-failed 134)
  (:init-vr-home-not-found 135)
  (:init-vr-home-startup-failed 136)
  (:init-rebooting-busy 137)
  (:init-firmware-update-busy 138)
  (:init-firmware-recovery-busy 139)
  (:driver-failed 200)
  (:driver-unknown 201)
  (:driver-hmd-unknown 202)
  (:driver-not-loaded 203)
  (:driver-runtime-out-of-date 204)
  (:driver-hmd-in-use 205)
  (:driver-not-calibrated 206)
  (:driver-calibration-invalid 207)
  (:driver-hmd-display-not-found 208)
  (:driver-tracked-device-interface-unknown 209)
  (:driver-hmd-driver-id-out-of-bounds 211)
  (:driver-hmd-display-mirrored 212)
  (:pc-server-init-failed 300)
  (:pc-connect-failed 301)
  (:pc-shared-state-init-failed 302)
  (:pc-compositor-init-failed 303)
  (:pc-mutex-init-failed 304)
  (:pc-failed 305)
  (:pc-compositor-connect-failed 306)
  (:pc-compositor-invalid-connect-response 307)
  (:pc-connect-failed-after-multiple-attempts 308)
  (:compositor-failed 400)
  (:compositor-d3d11-hardware-required 401)
  (:compositor-firmware-requires-update 402)
  (:compositor-overlay-init-failed 403)
  (:compositor-screenshots-init-failed 404)
  (:compositor-unable-to-create-device 405)
  (:vendor-specific-unable-to-connect-to-oculus-runtime 1000)
  (:vendor-specific-hmd-found-cant-open-device 1101)
  (:vendor-specific-hmd-found-unable-to-request-config-start 1102)
  (:vendor-specific-hmd-found-no-stored-config 1103)
  (:vendor-specific-hmd-found-config-too-big 1104)
  (:vendor-specific-hmd-found-config-too-small 1105)
  (:vendor-specific-hmd-found-unable-to-init-zlib 1106)
  (:vendor-specific-hmd-found-cant-read-firmware-version 1107)
  (:vendor-specific-hmd-found-unable-to-send-user-data-start 1108)
  (:vendor-specific-hmd-found-unable-to-get-user-data-start 1109)
  (:vendor-specific-hmd-found-unable-to-get-user-data-next 1110)
  (:vendor-specific-hmd-found-user-data-address-range 1111)
  (:vendor-specific-hmd-found-user-data-error 1112)
  (:vendor-specific-hmd-found-config-failed-sanity-check 1113)
  (:steam-steam-installation-not-found 2000))

(defcenum vr-screenshot-type
  (:none 0)
  (:mono 1)
  (:stereo 2)
  (:cubemap 3)
  (:mono-panorama 4)
  (:stereo-panorama 5))

(defcenum vr-screenshot-property-filenames
  (:preview 0)
  (:vr 1))

(defcenum vr-tracked-camera-error
  (:none 0)
  (:operation-failed 100)
  (:invalid-handle 101)
  (:invalid-frame-header-version 102)
  (:out-of-handles 103)
  (:pcfailure 104)
  (:not-supported-for-this-device 105)
  (:shared-memory-failure 106)
  (:frame-buffering-failure 107)
  (:stream-setup-failure 108)
  (:invalid-gltexture-id 109)
  (:invalid-shared-texture-handle 110)
  (:failed-to-get-gltexture-id 111)
  (:shared-texture-failure 112)
  (:no-frame-available 113)
  (:invalid-argument 114)
  (:invalid-frame-buffer-size 115))

(defcenum vr-tracked-camera-frame-type
  (:vr-tracked-camera-frame-type-distorted 0)
  (:vr-tracked-camera-frame-type-undistorted 1)
  (:vr-tracked-camera-frame-type-maximum-undistorted 2)
  (:max-camera-frame-types 3))

(defcenum vr-application-error
  (:none 0)
  (:app-key-already-exists 100)
  (:no-manifest 101)
  (:no-application 102)
  (:invalid-index 103)
  (:unknown-application 104)
  (:pcfailed 105)
  (:application-already-running 106)
  (:invalid-manifest 107)
  (:invalid-application 108)
  (:launch-failed 109)
  (:application-already-starting 110)
  (:launch-in-progress 111)
  (:old-application-quitting 112)
  (:transition-aborted 113)
  (:is-template 114)
  (:steam-vr-is-exiting 115)
  (:buffer-too-small 200)
  (:property-not-set 201)
  (:unknown-property 202)
  (:invalid-parameter 203))

(defcenum vr-application-property
  (:name-string 0)
  (:launch-type-string 11)
  (:working-directory-string 12)
  (:binary-path-string 13)
  (:arguments-string 14)
  (:url-string 15)
  (:description-string 50)
  (:news-url-string 51)
  (:image-path-string 52)
  (:source-string 53)
  (:is-dashboard-overlay-bool 60)
  (:is-template-bool 61)
  (:is-instanced-bool 62)
  (:is-internal-bool 63)
  (:wants-compositor-pause-in-standby-bool 64)
  (:last-launch-time-uint64 70))

(defcenum vr-application-transition-state
  (:none 0)
  (:old-app-quit-sent 10)
  (:waiting-for-external-launch 11)
  (:new-app-launched 20))

(defcenum chaperone-calibration-state
  (:ok 1)
  (:warning 100)
  (:warning-base-station-may-have-moved 101)
  (:warning-base-station-removed 102)
  (:warning-seated-bounds-invalid 103)
  (:error 200)
  (:error-base-station-uninitialized 201)
  (:error-base-station-conflict 202)
  (:error-play-area-invalid 203)
  (:error-collision-bounds-invalid 204))

(defcenum chaperone-config-file
  (:live 1)
  (:temp 2))

(defcenum chaperone-import-flags
  (:chaperone-import-bounds-only 1))

(defcenum vr-compositor-error
  (:none 0)
  (:request-failed 1)
  (:incompatible-version 100)
  (:do-not-have-focus 101)
  (:invalid-texture 102)
  (:is-not-scene-application 103)
  (:texture-is-on-wrong-device 104)
  (:texture-uses-unsupported-format 105)
  (:shared-textures-not-supported 106)
  (:index-out-of-range 107)
  (:already-submitted 108)
  (:invalid-bounds 109))

(defcenum vr-overlay-input-method
  (:none 0)
  (:mouse 1))

(defcenum vr-overlay-transform-type
  (:absolute 0)
  (:tracked-device-relative 1)
  (:system-overlay 2)
  (:tracked-component 3))

(defcenum vr-overlay-flags
  (:none 0)
  (:curved 1)
  (:rgss-4-x 2)
  (:no-dashboard-tab 3)
  (:accepts-gamepad-events 4)
  (:show-gamepad-focus 5)
  (:send-vr-scroll-events 6)
  (:send-vr-touchpad-events 7)
  (:show-touch-pad-scroll-wheel 8)
  (:transfer-ownership-to-internal-process 9)
  (:side-by-side-parallel 10)
  (:side-by-side-crossed 11)
  (:panorama 12)
  (:stereo-panorama 13)
  (:sort-with-non-scene-overlays 14)
  (:visible-in-dashboard 15))

(defcenum vr-message-overlay-response
  (:button-press-0 0)
  (:button-press-1 1)
  (:button-press-2 2)
  (:button-press-3 3)
  (:couldnt-find-system-overlay 4)
  (:couldnt-find-or-create-client-overlay 5)
  (:application-quit 6))

(defcenum gamepad-text-input-mode
  (:normal 0)
  (:password 1)
  (:submit 2))

(defcenum gamepad-text-input-line-mode
  (:single-line 0)
  (:multiple-lines 1))

(defcenum overlay-direction
  (:up 0)
  (:down 1)
  (:left 2)
  (:right 3)
  (:count 4))

(defcenum vr-overlay-intersection-mask-primitive-type
  (:rectangle 0)
  (:circle 1))

(defcenum vr-render-model-error
  (:none 0)
  (:loading 100)
  (:not-supported 200)
  (:invalid-arg 300)
  (:invalid-model 301)
  (:no-shapes 302)
  (:multiple-shapes 303)
  (:too-many-vertices 304)
  (:multiple-textures 305)
  (:buffer-too-small 306)
  (:not-enough-normals 307)
  (:not-enough-tex-coords 308)
  (:invalid-texture 400))

(defcenum vr-component-property
  (:static 1)
  (:visible 2)
  (:touched 4)
  (:pressed 8)
  (:scrolled 16))

(defcenum vr-notification-type
  (:transient 0)
  (:persistent 1)
  (:transient-system-with-user-value 2))

(defcenum vr-notification-style
  (:none 0)
  (:application 100)
  (:contact-disabled 200)
  (:contact-enabled 201)
  (:contact-active 202))

(defcenum vr-settings-error
  (:none 0)
  (:pcfailed 1)
  (:write-failed 2)
  (:read-failed 3)
  (:json-parse-failed 4)
  (:unset-setting-has-no-default 5))

(defcenum vr-screenshot-error
  (:none 0)
  (:request-failed 1)
  (:incompatible-version 100)
  (:not-found 101)
  (:buffer-too-small 102)
  (:screenshot-already-in-progress 108))



(defctype gl-shared-texture-handle-t (:pointer :void))
(defctype gl-int-t :int32)
(defctype gl-uint-t :uint32)
(defctype shared-texture-handle-t :uint64)
(defctype driver-id-t :uint32)
(defctype tracked-device-index-t :uint32)
(defctype property-container-handle-t :uint64)
(defctype property-type-tag-t :uint32)
(defctype vr-overlay-handle-t :uint64)
(defctype tracked-camera-handle-t :uint64)
(defctype screenshot-handle-t :uint32)
(defctype vr-component-properties :uint32)
(defctype texture-id-t :int32)
(defctype vr-notification-id :uint32)
(defctype hmd-error vr-init-error)
(defctype hmd-eye vr-eye)
(defctype hmd-tracking-result tracking-result)
(defctype vr-submit-flags-t vr-submit-flags)
(defctype vr-state-t vr-state)
(defctype collision-bounds-style-t collision-bounds-style)
(defctype vr-screenshots-error vr-screenshot-error)


(defcstruct hmd-matrix-34-t
  (m :float :count #.(* 3 4))) ;; float [3][4]

(defcstruct hmd-matrix-44-t
  (m :float :count #.(* 4 4))) ;; float [4][4]

(defcstruct hmd-vector-3-t
  (v :float :count 3)) ;; float [3]

(defcstruct hmd-vector-4-t
  (v :float :count 4)) ;; float [4]

(defcstruct hmd-vector-3-d-t
  (v :double :count 3)) ;; double [3]

(defcstruct hmd-vector-2-t
  (v :float :count 2)) ;; float [2]

(defcstruct hmd-quaternion-t
  (w :double) ;; double
  (x :double) ;; double
  (y :double) ;; double
  (z :double)) ;; double

(defcstruct hmd-color-t
  (r :float) ;; float
  (g :float) ;; float
  (b :float) ;; float
  (a :float)) ;; float

(defcstruct hmd-quad-t
  (corners (:struct hmd-vector-3-t) :count 4)) ;; struct vr::HmdVector3_t [4]

(defcstruct hmd-rect-2-t
  (top-left (:struct hmd-vector-2-t)) ;; struct vr::HmdVector2_t
  (bottom-right (:struct hmd-vector-2-t))) ;; struct vr::HmdVector2_t

(defcstruct distortion-coordinates-t
  (red :float :count 2) ;; float [2]
  (green :float :count 2) ;; float [2]
  (blue :float :count 2)) ;; float [2]

(defcstruct texture-t
  (handle (:pointer :void)) ;; void *
  (type texture-type) ;; enum vr::ETextureType
  (color-space color-space)) ;; enum vr::EColorSpace

(defcstruct tracked-device-pose-t
  (device-to-absolute-tracking (:struct hmd-matrix-34-t)) ;; struct vr::HmdMatrix34_t
  (velocity (:struct hmd-vector-3-t)) ;; struct vr::HmdVector3_t
  (angular-velocity (:struct hmd-vector-3-t)) ;; struct vr::HmdVector3_t
  (tracking-result tracking-result) ;; enum vr::ETrackingResult
  (pose-is-valid :bool) ;; _Bool
  (device-is-connected :bool)) ;; _Bool

(defcstruct vr-texture-bounds-t
  (u-min :float) ;; float
  (v-min :float) ;; float
  (u-max :float) ;; float
  (v-max :float)) ;; float

(defcstruct vr-texture-with-pose-t
  (device-to-absolute-tracking (:struct hmd-matrix-34-t))) ;; struct vr::HmdMatrix34_t

(defcstruct vr-vulkan-texture-data-t
  (image :uint64) ;; uint64_t
  (device (:pointer (:struct vk-device-t))) ;; struct VkDevice_T *
  (physical-device (:pointer (:struct vk-physical-device-t))) ;; struct VkPhysicalDevice_T *
  (instance (:pointer (:struct vk-instance-t))) ;; struct VkInstance_T *
  (queue (:pointer (:struct vk-queue-t))) ;; struct VkQueue_T *
  (queue-family-index :uint32) ;; uint32_t
  (width :uint32) ;; uint32_t
  (height :uint32) ;; uint32_t
  (format :uint32) ;; uint32_t
  (sample-count :uint32)) ;; uint32_t

(defcstruct d3d12-texture-data-t
  (resource (:pointer (:struct d3d12-resource))) ;; struct ID3D12Resource *
  (command-queue (:pointer (:struct d3d12-command-queue))) ;; struct ID3D12CommandQueue *
  (node-mask :uint32)) ;; uint32_t

(defcstruct vr-event-controller-t
  (button :uint32)) ;; uint32_t

(defcstruct vr-event-mouse-t
  (x :float) ;; float
  (y :float) ;; float
  (button :uint32)) ;; uint32_t

(defcstruct vr-event-scroll-t
  (xdelta :float) ;; float
  (ydelta :float) ;; float
  (repeat-count :uint32)) ;; uint32_t

(defcstruct vr-event-touch-pad-move-t
  (finger-down :bool) ;; _Bool
  (seconds-finger-down :float) ;; float
  (value-xfirst :float) ;; float
  (value-yfirst :float) ;; float
  (value-xraw :float) ;; float
  (value-yraw :float)) ;; float

(defcstruct vr-event-notification-t
  (user-value :uint64) ;; uint64_t
  (notification-id :uint32)) ;; uint32_t

(defcstruct vr-event-process-t
  (pid :uint32) ;; uint32_t
  (old-pid :uint32) ;; uint32_t
  (forced :bool)) ;; _Bool

(defcstruct vr-event-overlay-t
  (overlay-handle :uint64)) ;; uint64_t

(defcstruct vr-event-status-t
  (status-state :uint32)) ;; uint32_t

(defcstruct vr-event-keyboard-t
  (new-input :char :count 8) ;; char [8]
  (user-value :uint64)) ;; uint64_t

(defcstruct vr-event-ipd-t
  (ipd-meters :float)) ;; float

(defcstruct vr-event-chaperone-t
  (previous-universe :uint64) ;; uint64_t
  (current-universe :uint64)) ;; uint64_t

(defcstruct vr-event-reserved-t
  (reserved-0 :uint64) ;; uint64_t
  (reserved-1 :uint64)) ;; uint64_t

(defcstruct vr-event-performance-test-t
  (fidelity-level :uint32)) ;; uint32_t

(defcstruct vr-event-seated-zero-pose-reset-t
  (reset-by-system-menu :bool)) ;; _Bool

(defcstruct vr-event-screenshot-t
  (handle :uint32) ;; uint32_t
  (type :uint32)) ;; uint32_t

(defcstruct vr-event-screenshot-progress-t
  (progress :float)) ;; float

(defcstruct vr-event-application-launch-t
  (pid :uint32) ;; uint32_t
  (args-handle :uint32)) ;; uint32_t

(defcstruct vr-event-editing-camera-surface-t
  (overlay-handle :uint64) ;; uint64_t
  (visual-mode :uint32)) ;; uint32_t

(defcstruct vr-event-message-overlay-t
  (vr-message-overlay-response :uint32)) ;; uint32_t

(defcstruct vr-event-property-t
  (container property-container-handle-t) ;; PropertyContainerHandle_t
  (prop tracked-device-property)) ;; enum vr::ETrackedDeviceProperty

(defcunion vr-event-data-t
  (reserved (:struct vr-event-reserved-t)) ;; struct vr::VREvent_Reserved_t
  (controller (:struct vr-event-controller-t)) ;; struct vr::VREvent_Controller_t
  (mouse (:struct vr-event-mouse-t)) ;; struct vr::VREvent_Mouse_t
  (scroll (:struct vr-event-scroll-t)) ;; struct vr::VREvent_Scroll_t
  (process (:struct vr-event-process-t)) ;; struct vr::VREvent_Process_t
  (notification (:struct vr-event-notification-t)) ;; struct vr::VREvent_Notification_t
  (overlay (:struct vr-event-overlay-t)) ;; struct vr::VREvent_Overlay_t
  (status (:struct vr-event-status-t)) ;; struct vr::VREvent_Status_t
  (keyboard (:struct vr-event-keyboard-t)) ;; struct vr::VREvent_Keyboard_t
  (ipd (:struct vr-event-ipd-t)) ;; struct vr::VREvent_Ipd_t
  (chaperone (:struct vr-event-chaperone-t)) ;; struct vr::VREvent_Chaperone_t
  (performance-test (:struct vr-event-performance-test-t)) ;; struct vr::VREvent_PerformanceTest_t
  (touch-pad-move (:struct vr-event-touch-pad-move-t)) ;; struct vr::VREvent_TouchPadMove_t
  (seated-zero-pose-reset (:struct vr-event-seated-zero-pose-reset-t)) ;; struct vr::VREvent_SeatedZeroPoseReset_t
  (screenshot (:struct vr-event-screenshot-t)) ;; struct vr::VREvent_Screenshot_t
  (screenshot-progress (:struct vr-event-screenshot-progress-t)) ;; struct vr::VREvent_ScreenshotProgress_t
  (application-launch (:struct vr-event-application-launch-t)) ;; struct vr::VREvent_ApplicationLaunch_t
  (camera-surface (:struct vr-event-editing-camera-surface-t)) ;; struct vr::VREvent_EditingCameraSurface_t
  (message-overlay (:struct vr-event-message-overlay-t)) ;; struct vr::VREvent_MessageOverlay_t
  (property (:struct vr-event-property-t))) ;; struct vr::VREvent_Property_t

(defcstruct vr-event-t
  (event-type :uint32) ;; uint32_t
  (tracked-device-index tracked-device-index-t) ;; TrackedDeviceIndex_t
  (event-age-seconds :float) ;; float
  (data (:union vr-event-data-t))) ;; VREvent_Data_t

(defcstruct hidden-area-mesh-t
  (vertex-data (:pointer (:struct hmd-vector-2-t))) ;; const struct vr::HmdVector2_t *
  (triangle-count :uint32)) ;; uint32_t

(defcstruct vr-controller-axis-t
  (x :float) ;; float
  (y :float)) ;; float

(defcstruct vr-controller-state-001-t
  (packet-num :uint32) ;; uint32_t
  (button-pressed :uint64) ;; uint64_t
  (button-touched :uint64) ;; uint64_t
  (axis (:struct vr-controller-axis-t) :count 5)) ;; struct vr::VRControllerAxis_t [5]

(defcstruct compositor-overlay-settings
  (size :uint32) ;; uint32_t
  (curved :bool) ;; _Bool
  (antialias :bool) ;; _Bool
  (scale :float) ;; float
  (distance :float) ;; float
  (alpha :float) ;; float
  (u-offset :float) ;; float
  (v-offset :float) ;; float
  (u-scale :float) ;; float
  (v-scale :float) ;; float
  (grid-divs :float) ;; float
  (grid-width :float) ;; float
  (grid-scale :float) ;; float
  (transform (:struct hmd-matrix-44-t))) ;; struct vr::HmdMatrix44_t

(defcstruct camera-video-stream-frame-header-t
  (frame-type vr-tracked-camera-frame-type) ;; enum vr::EVRTrackedCameraFrameType
  (width :uint32) ;; uint32_t
  (height :uint32) ;; uint32_t
  (bytes-per-pixel :uint32) ;; uint32_t
  (frame-sequence :uint32) ;; uint32_t
  (standing-tracked-device-pose (:struct tracked-device-pose-t))) ;; struct vr::TrackedDevicePose_t

(defcstruct app-override-keys-t
  (key :string) ;; const char *
  (value :string)) ;; const char *

(defcstruct compositor-frame-timing
  (size :uint32) ;; uint32_t
  (frame-index :uint32) ;; uint32_t
  (num-frame-presents :uint32) ;; uint32_t
  (num-mis-presented :uint32) ;; uint32_t
  (num-dropped-frames :uint32) ;; uint32_t
  (reprojection-flags :uint32) ;; uint32_t
  (system-time-in-seconds :double) ;; double
  (pre-submit-gpu-ms :float) ;; float
  (post-submit-gpu-ms :float) ;; float
  (total-render-gpu-ms :float) ;; float
  (compositor-render-gpu-ms :float) ;; float
  (compositor-render-cpu-ms :float) ;; float
  (compositor-idle-cpu-ms :float) ;; float
  (client-frame-interval-ms :float) ;; float
  (present-call-cpu-ms :float) ;; float
  (wait-for-present-cpu-ms :float) ;; float
  (submit-frame-ms :float) ;; float
  (wait-get-poses-called-ms :float) ;; float
  (new-poses-ready-ms :float) ;; float
  (new-frame-ready-ms :float) ;; float
  (compositor-update-start-ms :float) ;; float
  (compositor-update-end-ms :float) ;; float
  (compositor-render-start-ms :float) ;; float
  (hmd-pose (:struct tracked-device-pose-t))) ;; vr::TrackedDevicePose_t

(defcstruct compositor-cumulative-stats
  (pid :uint32) ;; uint32_t
  (num-frame-presents :uint32) ;; uint32_t
  (num-dropped-frames :uint32) ;; uint32_t
  (num-reprojected-frames :uint32) ;; uint32_t
  (num-frame-presents-on-startup :uint32) ;; uint32_t
  (num-dropped-frames-on-startup :uint32) ;; uint32_t
  (num-reprojected-frames-on-startup :uint32) ;; uint32_t
  (num-loading :uint32) ;; uint32_t
  (num-frame-presents-loading :uint32) ;; uint32_t
  (num-dropped-frames-loading :uint32) ;; uint32_t
  (num-reprojected-frames-loading :uint32) ;; uint32_t
  (num-timed-out :uint32) ;; uint32_t
  (num-frame-presents-timed-out :uint32) ;; uint32_t
  (num-dropped-frames-timed-out :uint32) ;; uint32_t
  (num-reprojected-frames-timed-out :uint32)) ;; uint32_t

(defcstruct vr-overlay-intersection-params-t
  (source (:struct hmd-vector-3-t)) ;; struct vr::HmdVector3_t
  (direction (:struct hmd-vector-3-t)) ;; struct vr::HmdVector3_t
  (origin tracking-universe-origin)) ;; enum vr::ETrackingUniverseOrigin

(defcstruct vr-overlay-intersection-results-t
  (point (:struct hmd-vector-3-t)) ;; struct vr::HmdVector3_t
  (normal (:struct hmd-vector-3-t)) ;; struct vr::HmdVector3_t
  (uvs (:struct hmd-vector-2-t)) ;; struct vr::HmdVector2_t
  (distance :float)) ;; float

(defcstruct intersection-mask-rectangle-t
  (top-left-x :float) ;; float
  (top-left-y :float) ;; float
  (width :float) ;; float
  (height :float)) ;; float

(defcstruct intersection-mask-circle-t
  (center-x :float) ;; float
  (center-y :float) ;; float
  (radius :float)) ;; float

(defcunion vr-overlay-intersection-mask-primitive-data-t
  (rectangle (:struct intersection-mask-rectangle-t)) ;; struct vr::IntersectionMaskRectangle_t
  (circle (:struct intersection-mask-circle-t))) ;; struct vr::IntersectionMaskCircle_t

(defcstruct vr-overlay-intersection-mask-primitive-t
  (primitive-type vr-overlay-intersection-mask-primitive-type) ;; enum vr::EVROverlayIntersectionMaskPrimitiveType
  (primitive (:union vr-overlay-intersection-mask-primitive-data-t))) ;; VROverlayIntersectionMaskPrimitive_Data_t

(defcstruct render-model-component-state-t
  (tracking-to-component-render-model (:struct hmd-matrix-34-t)) ;; struct vr::HmdMatrix34_t
  (tracking-to-component-local (:struct hmd-matrix-34-t)) ;; struct vr::HmdMatrix34_t
  (properties vr-component-properties)) ;; VRComponentProperties

(defcstruct render-model-vertex-t
  (position (:struct hmd-vector-3-t)) ;; struct vr::HmdVector3_t
  (normal (:struct hmd-vector-3-t)) ;; struct vr::HmdVector3_t
  (texture-coord :float :count 2)) ;; float [2]

(defcstruct render-model-texture-map-t
  (width :uint16) ;; uint16_t
  (height :uint16) ;; uint16_t
  (texture-map-data (:pointer :uint8))) ;; const uint8_t *

(defcstruct render-model-t
  (vertex-data (:pointer (:struct render-model-vertex-t))) ;; const struct vr::RenderModel_Vertex_t *
  (vertex-count :uint32) ;; uint32_t
  (index-data (:pointer :uint16)) ;; const uint16_t *
  (triangle-count :uint32) ;; uint32_t
  (diffuse-texture-id texture-id-t)) ;; TextureID_t

(defcstruct render-model-controller-mode-state-t
  (scroll-wheel-visible :bool)) ;; _Bool

(defcstruct notification-bitmap-t
  (image-data (:pointer :void)) ;; void *
  (width :int32) ;; int32_t
  (height :int32) ;; int32_t
  (bytes-per-pixel :int32)) ;; int32_t

(defcstruct copen-vr-context
  (vr-system :pointer) ;; class vr::IVRSystem *
  (vr-chaperone :pointer) ;; class vr::IVRChaperone *
  (vr-chaperone-setup :pointer) ;; class vr::IVRChaperoneSetup *
  (vr-compositor :pointer) ;; class vr::IVRCompositor *
  (vr-overlay :pointer) ;; class vr::IVROverlay *
  (vr-resources :pointer) ;; class vr::IVRResources *
  (vr-render-models :pointer) ;; class vr::IVRRenderModels *
  (vr-extended-display :pointer) ;; class vr::IVRExtendedDisplay *
  (vr-settings :pointer) ;; class vr::IVRSettings *
  (vr-applications :pointer) ;; class vr::IVRApplications *
  (vr-tracked-camera :pointer) ;; class vr::IVRTrackedCamera *
  (vr-screenshots :pointer) ;; class vr::IVRScreenshots *
  (vr-driver-manager :pointer)) ;; class vr::IVRDriverManager *



 (defclass vr-system ()
   ((table :reader table)))
(defmethod initialize-instance :after ((o vr-system) &key)
  (let ((p (vr-get-generic-interface +vr-system-version+)))
    (setf (slot-value o 'table) (make-array 45))
    (loop for i below 45
          do (setf (aref (table o) i) (cffi:mem-aref p :pointer i)))
    (format t "loaded function table for ~s = ~s~%" 'vr-system (table o))))
(defun %get-recommended-render-target-size (table pnWidth pnHeight)
  (foreign-funcall-pointer (aref table 0) nil (:pointer :uint32) pnwidth
                           (:pointer :uint32) pnheight :void))

(defun %get-projection-matrix (table eEye fNearZ fFarZ)
  (foreign-funcall-pointer (aref table 1) nil vr-eye eeye :float fnearz :float
                           ffarz (:struct hmd-matrix-44-t)))

(defun %get-projection-raw (table eEye pfLeft pfRight pfTop pfBottom)
  (foreign-funcall-pointer (aref table 2) nil vr-eye eeye (:pointer :float)
                           pfleft (:pointer :float) pfright (:pointer :float)
                           pftop (:pointer :float) pfbottom :void))

(defun %compute-distortion (table eEye fU fV pDistortionCoordinates)
  (foreign-funcall-pointer (aref table 3) nil vr-eye eeye :float fu :float fv
                           (:pointer (:struct distortion-coordinates-t))
                           pdistortioncoordinates :bool))

(defun %get-eye-to-head-transform (table eEye)
  (foreign-funcall-pointer (aref table 4) nil vr-eye eeye
                           (:struct hmd-matrix-34-t)))

(defun %get-time-since-last-vsync (table pfSecondsSinceLastVsync pulFrameCounter)
  (foreign-funcall-pointer (aref table 5) nil (:pointer :float)
                           pfsecondssincelastvsync (:pointer :uint64)
                           pulframecounter :bool))

(defun %get-d3d9-adapter-index (table)
  (foreign-funcall-pointer (aref table 6) nil :int32))

(defun %get-dxgi-output-info/vr-system (table pnAdapterIndex)
  (foreign-funcall-pointer (aref table 7) nil (:pointer :int32) pnadapterindex
                           :void))

(defun %get-output-device (table pnDevice textureType pInstance)
  (foreign-funcall-pointer (aref table 8) nil (:pointer :uint64) pndevice
                           texture-type texturetype
                           (:pointer (:struct vk-instance-t)) pinstance :void))

(defun %is-display-on-desktop (table)
  (foreign-funcall-pointer (aref table 9) nil :bool))

(defun %set-display-visibility (table bIsVisibleOnDesktop)
  (foreign-funcall-pointer (aref table 10) nil :bool bisvisibleondesktop :bool))

(defun %get-device-to-absolute-tracking-pose (table eOrigin fPredictedSecondsToPhotonsFromNow pTrackedDevicePoseArray unTrackedDevicePoseArrayCount)
  (foreign-funcall-pointer (aref table 11) nil tracking-universe-origin eorigin
                           :float fpredictedsecondstophotonsfromnow
                           (:pointer (:struct tracked-device-pose-t))
                           ptrackeddeviceposearray :uint32
                           untrackeddeviceposearraycount :void))

(defun %reset-seated-zero-pose (table)
  (foreign-funcall-pointer (aref table 12) nil :void))

(defun %get-seated-zero-pose-to-standing-absolute-tracking-pose (table)
  (foreign-funcall-pointer (aref table 13) nil (:struct hmd-matrix-34-t)))

(defun %get-raw-zero-pose-to-standing-absolute-tracking-pose (table)
  (foreign-funcall-pointer (aref table 14) nil (:struct hmd-matrix-34-t)))

(defun %get-sorted-tracked-device-indices-of-class (table eTrackedDeviceClass punTrackedDeviceIndexArray unTrackedDeviceIndexArrayCount unRelativeToTrackedDeviceIndex)
  (foreign-funcall-pointer (aref table 15) nil tracked-device-class
                           etrackeddeviceclass
                           (:pointer tracked-device-index-t)
                           puntrackeddeviceindexarray :uint32
                           untrackeddeviceindexarraycount
                           tracked-device-index-t
                           unrelativetotrackeddeviceindex :uint32))

(defun %get-tracked-device-activity-level (table unDeviceId)
  (foreign-funcall-pointer (aref table 16) nil tracked-device-index-t
                           undeviceid device-activity-level))

(defun %apply-transform (table pOutputPose pTrackedDevicePose pTransform)
  (foreign-funcall-pointer (aref table 17) nil
                           (:pointer (:struct tracked-device-pose-t))
                           poutputpose
                           (:pointer (:struct tracked-device-pose-t))
                           ptrackeddevicepose
                           (:pointer (:struct hmd-matrix-34-t)) ptransform
                           :void))

(defun %get-tracked-device-index-for-controller-role (table unDeviceType)
  (foreign-funcall-pointer (aref table 18) nil tracked-controller-role
                           undevicetype tracked-device-index-t))

(defun %get-controller-role-for-tracked-device-index (table unDeviceIndex)
  (foreign-funcall-pointer (aref table 19) nil tracked-device-index-t
                           undeviceindex tracked-controller-role))

(defun %get-tracked-device-class (table unDeviceIndex)
  (foreign-funcall-pointer (aref table 20) nil tracked-device-index-t
                           undeviceindex tracked-device-class))

(defun %is-tracked-device-connected (table unDeviceIndex)
  (foreign-funcall-pointer (aref table 21) nil tracked-device-index-t
                           undeviceindex :bool))

(defun %get-bool-tracked-device-property (table unDeviceIndex prop pError)
  (foreign-funcall-pointer (aref table 22) nil tracked-device-index-t
                           undeviceindex tracked-device-property prop
                           (:pointer tracked-property-error) perror :bool))

(defun %get-float-tracked-device-property (table unDeviceIndex prop pError)
  (foreign-funcall-pointer (aref table 23) nil tracked-device-index-t
                           undeviceindex tracked-device-property prop
                           (:pointer tracked-property-error) perror :float))

(defun %get-int32-tracked-device-property (table unDeviceIndex prop pError)
  (foreign-funcall-pointer (aref table 24) nil tracked-device-index-t
                           undeviceindex tracked-device-property prop
                           (:pointer tracked-property-error) perror :int32))

(defun %get-uint64-tracked-device-property (table unDeviceIndex prop pError)
  (foreign-funcall-pointer (aref table 25) nil tracked-device-index-t
                           undeviceindex tracked-device-property prop
                           (:pointer tracked-property-error) perror :uint64))

(defun %get-matrix-34-tracked-device-property (table unDeviceIndex prop pError)
  (foreign-funcall-pointer (aref table 26) nil tracked-device-index-t
                           undeviceindex tracked-device-property prop
                           (:pointer tracked-property-error) perror
                           (:struct hmd-matrix-34-t)))

(defun %get-string-tracked-device-property (table unDeviceIndex prop pchValue unBufferSize pError)
  (foreign-funcall-pointer (aref table 27) nil tracked-device-index-t
                           undeviceindex tracked-device-property prop :string
                           pchvalue :uint32 unbuffersize
                           (:pointer tracked-property-error) perror :uint32))

(defun %get-prop-error-name-from-enum (table error)
  (foreign-funcall-pointer (aref table 28) nil tracked-property-error error
                           :string))

(defun %poll-next-event (table pEvent uncbVREvent)
  (foreign-funcall-pointer (aref table 29) nil (:pointer (:struct vr-event-t))
                           pevent :uint32 uncbvrevent :bool))

(defun %poll-next-event-with-pose (table eOrigin pEvent uncbVREvent pTrackedDevicePose)
  (foreign-funcall-pointer (aref table 30) nil tracking-universe-origin eorigin
                           (:pointer (:struct vr-event-t)) pevent :uint32
                           uncbvrevent
                           (:pointer (:struct tracked-device-pose-t))
                           ptrackeddevicepose :bool))

(defun %get-event-type-name-from-enum (table eType)
  (foreign-funcall-pointer (aref table 31) nil vr-event-type etype :string))

(defun %get-hidden-area-mesh (table eEye type)
  (foreign-funcall-pointer (aref table 32) nil vr-eye eeye
                           hidden-area-mesh-type type
                           (:struct hidden-area-mesh-t)))

(defun %get-controller-state (table unControllerDeviceIndex pControllerState unControllerStateSize)
  (foreign-funcall-pointer (aref table 33) nil tracked-device-index-t
                           uncontrollerdeviceindex
                           (:pointer (:struct vr-controller-state-001-t))
                           pcontrollerstate :uint32 uncontrollerstatesize :bool))

(defun %get-controller-state-with-pose (table eOrigin unControllerDeviceIndex pControllerState unControllerStateSize pTrackedDevicePose)
  (foreign-funcall-pointer (aref table 34) nil tracking-universe-origin eorigin
                           tracked-device-index-t uncontrollerdeviceindex
                           (:pointer (:struct vr-controller-state-001-t))
                           pcontrollerstate :uint32 uncontrollerstatesize
                           (:pointer (:struct tracked-device-pose-t))
                           ptrackeddevicepose :bool))

(defun %trigger-haptic-pulse (table unControllerDeviceIndex unAxisId usDurationMicroSec)
  (foreign-funcall-pointer (aref table 35) nil tracked-device-index-t
                           uncontrollerdeviceindex :uint32 unaxisid :uint16
                           usdurationmicrosec :void))

(defun %get-button-id-name-from-enum (table eButtonId)
  (foreign-funcall-pointer (aref table 36) nil vr-button-id ebuttonid :string))

(defun %get-controller-axis-type-name-from-enum (table eAxisType)
  (foreign-funcall-pointer (aref table 37) nil vr-controller-axis-type
                           eaxistype :string))

(defun %capture-input-focus (table)
  (foreign-funcall-pointer (aref table 38) nil :bool))

(defun %release-input-focus (table)
  (foreign-funcall-pointer (aref table 39) nil :void))

(defun %is-input-focus-captured-by-another-process (table)
  (foreign-funcall-pointer (aref table 40) nil :bool))

(defun %driver-debug-request (table unDeviceIndex pchRequest pchResponseBuffer unResponseBufferSize)
  (foreign-funcall-pointer (aref table 41) nil tracked-device-index-t
                           undeviceindex :string pchrequest :string
                           pchresponsebuffer :uint32 unresponsebuffersize
                           :uint32))

(defun %perform-firmware-update (table unDeviceIndex)
  (foreign-funcall-pointer (aref table 42) nil tracked-device-index-t
                           undeviceindex vr-firmware-error))

(defun %acknowledge-quit-exiting (table)
  (foreign-funcall-pointer (aref table 43) nil :void))

(defun %acknowledge-quit-user-prompt (table)
  (foreign-funcall-pointer (aref table 44) nil :void))

 (defclass vr-extended-display ()
   ((table :reader table)))
(defmethod initialize-instance :after ((o vr-extended-display) &key)
  (let ((p (vr-get-generic-interface +vr-extended-display-version+)))
    (setf (slot-value o 'table) (make-array 3))
    (loop for i below 3
          do (setf (aref (table o) i) (cffi:mem-aref p :pointer i)))
    (format t "loaded function table for ~s = ~s~%" 'vr-extended-display
            (table o))))
(defun %get-window-bounds (table pnX pnY pnWidth pnHeight)
  (foreign-funcall-pointer (aref table 0) nil (:pointer :int32) pnx
                           (:pointer :int32) pny (:pointer :uint32) pnwidth
                           (:pointer :uint32) pnheight :void))

(defun %get-eye-output-viewport (table eEye pnX pnY pnWidth pnHeight)
  (foreign-funcall-pointer (aref table 1) nil vr-eye eeye (:pointer :uint32)
                           pnx (:pointer :uint32) pny (:pointer :uint32)
                           pnwidth (:pointer :uint32) pnheight :void))

(defun %get-dxgi-output-info/vr-extended-display (table pnAdapterIndex pnAdapterOutputIndex)
  (foreign-funcall-pointer (aref table 2) nil (:pointer :int32) pnadapterindex
                           (:pointer :int32) pnadapteroutputindex :void))

 (defclass vr-tracked-camera ()
   ((table :reader table)))
(defmethod initialize-instance :after ((o vr-tracked-camera) &key)
  (let ((p (vr-get-generic-interface +vr-tracked-camera-version+)))
    (setf (slot-value o 'table) (make-array 12))
    (loop for i below 12
          do (setf (aref (table o) i) (cffi:mem-aref p :pointer i)))
    (format t "loaded function table for ~s = ~s~%" 'vr-tracked-camera
            (table o))))
(defun %get-camera-error-name-from-enum (table eCameraError)
  (foreign-funcall-pointer (aref table 0) nil vr-tracked-camera-error
                           ecameraerror :string))

(defun %has-camera (table nDeviceIndex pHasCamera)
  (foreign-funcall-pointer (aref table 1) nil tracked-device-index-t
                           ndeviceindex (:pointer :bool) phascamera
                           vr-tracked-camera-error))

(defun %get-camera-frame-size (table nDeviceIndex eFrameType pnWidth pnHeight pnFrameBufferSize)
  (foreign-funcall-pointer (aref table 2) nil tracked-device-index-t
                           ndeviceindex vr-tracked-camera-frame-type eframetype
                           (:pointer :uint32) pnwidth (:pointer :uint32)
                           pnheight (:pointer :uint32) pnframebuffersize
                           vr-tracked-camera-error))

(defun %get-camera-intrinsics (table nDeviceIndex eFrameType pFocalLength pCenter)
  (foreign-funcall-pointer (aref table 3) nil tracked-device-index-t
                           ndeviceindex vr-tracked-camera-frame-type eframetype
                           (:pointer (:struct hmd-vector-2-t)) pfocallength
                           (:pointer (:struct hmd-vector-2-t)) pcenter
                           vr-tracked-camera-error))

(defun %get-camera-projection (table nDeviceIndex eFrameType flZNear flZFar pProjection)
  (foreign-funcall-pointer (aref table 4) nil tracked-device-index-t
                           ndeviceindex vr-tracked-camera-frame-type eframetype
                           :float flznear :float flzfar
                           (:pointer (:struct hmd-matrix-44-t)) pprojection
                           vr-tracked-camera-error))

(defun %acquire-video-streaming-service (table nDeviceIndex pHandle)
  (foreign-funcall-pointer (aref table 5) nil tracked-device-index-t
                           ndeviceindex (:pointer tracked-camera-handle-t)
                           phandle vr-tracked-camera-error))

(defun %release-video-streaming-service (table hTrackedCamera)
  (foreign-funcall-pointer (aref table 6) nil tracked-camera-handle-t
                           htrackedcamera vr-tracked-camera-error))

(defun %get-video-stream-frame-buffer (table hTrackedCamera eFrameType pFrameBuffer nFrameBufferSize pFrameHeader nFrameHeaderSize)
  (foreign-funcall-pointer (aref table 7) nil tracked-camera-handle-t
                           htrackedcamera vr-tracked-camera-frame-type
                           eframetype (:pointer :void) pframebuffer :uint32
                           nframebuffersize
                           (:pointer (:struct camera-video-stream-frame-header-t))
                           pframeheader :uint32 nframeheadersize
                           vr-tracked-camera-error))

(defun %get-video-stream-texture-size (table nDeviceIndex eFrameType pTextureBounds pnWidth pnHeight)
  (foreign-funcall-pointer (aref table 8) nil tracked-device-index-t
                           ndeviceindex vr-tracked-camera-frame-type eframetype
                           (:pointer (:struct vr-texture-bounds-t))
                           ptexturebounds (:pointer :uint32) pnwidth
                           (:pointer :uint32) pnheight vr-tracked-camera-error))

(defun %get-video-stream-texture-d3d11 (table hTrackedCamera eFrameType pD3D11DeviceOrResource ppD3D11ShaderResourceView pFrameHeader nFrameHeaderSize)
  (foreign-funcall-pointer (aref table 9) nil tracked-camera-handle-t
                           htrackedcamera vr-tracked-camera-frame-type
                           eframetype (:pointer :void) pd3d11deviceorresource
                           (:pointer :void) ppd3d11shaderresourceview
                           (:pointer (:struct camera-video-stream-frame-header-t))
                           pframeheader :uint32 nframeheadersize
                           vr-tracked-camera-error))

(defun %get-video-stream-texture-gl (table hTrackedCamera eFrameType pglTextureId pFrameHeader nFrameHeaderSize)
  (foreign-funcall-pointer (aref table 10) nil tracked-camera-handle-t
                           htrackedcamera vr-tracked-camera-frame-type
                           eframetype (:pointer gl-uint-t) pgltextureid
                           (:pointer (:struct camera-video-stream-frame-header-t))
                           pframeheader :uint32 nframeheadersize
                           vr-tracked-camera-error))

(defun %release-video-stream-texture-gl (table hTrackedCamera glTextureId)
  (foreign-funcall-pointer (aref table 11) nil tracked-camera-handle-t
                           htrackedcamera gl-uint-t gltextureid
                           vr-tracked-camera-error))

 (defclass vr-applications ()
   ((table :reader table)))
(defmethod initialize-instance :after ((o vr-applications) &key)
  (let ((p (vr-get-generic-interface +vr-applications-version+)))
    (setf (slot-value o 'table) (make-array 31))
    (loop for i below 31
          do (setf (aref (table o) i) (cffi:mem-aref p :pointer i)))
    (format t "loaded function table for ~s = ~s~%" 'vr-applications
            (table o))))
(defun %add-application-manifest (table pchApplicationManifestFullPath bTemporary)
  (foreign-funcall-pointer (aref table 0) nil :string
                           pchapplicationmanifestfullpath :bool btemporary
                           vr-application-error))

(defun %remove-application-manifest (table pchApplicationManifestFullPath)
  (foreign-funcall-pointer (aref table 1) nil :string
                           pchapplicationmanifestfullpath vr-application-error))

(defun %is-application-installed (table pchAppKey)
  (foreign-funcall-pointer (aref table 2) nil :string pchappkey :bool))

(defun %get-application-count (table)
  (foreign-funcall-pointer (aref table 3) nil :uint32))

(defun %get-application-key-by-index (table unApplicationIndex pchAppKeyBuffer unAppKeyBufferLen)
  (foreign-funcall-pointer (aref table 4) nil :uint32 unapplicationindex
                           :string pchappkeybuffer :uint32 unappkeybufferlen
                           vr-application-error))

(defun %get-application-key-by-process-id (table unProcessId pchAppKeyBuffer unAppKeyBufferLen)
  (foreign-funcall-pointer (aref table 5) nil :uint32 unprocessid :string
                           pchappkeybuffer :uint32 unappkeybufferlen
                           vr-application-error))

(defun %launch-application (table pchAppKey)
  (foreign-funcall-pointer (aref table 6) nil :string pchappkey
                           vr-application-error))

(defun %launch-template-application (table pchTemplateAppKey pchNewAppKey pKeys unKeys)
  (foreign-funcall-pointer (aref table 7) nil :string pchtemplateappkey :string
                           pchnewappkey
                           (:pointer (:struct app-override-keys-t)) pkeys
                           :uint32 unkeys vr-application-error))

(defun %launch-application-from-mime-type (table pchMimeType pchArgs)
  (foreign-funcall-pointer (aref table 8) nil :string pchmimetype :string
                           pchargs vr-application-error))

(defun %launch-dashboard-overlay (table pchAppKey)
  (foreign-funcall-pointer (aref table 9) nil :string pchappkey
                           vr-application-error))

(defun %cancel-application-launch (table pchAppKey)
  (foreign-funcall-pointer (aref table 10) nil :string pchappkey :bool))

(defun %identify-application (table unProcessId pchAppKey)
  (foreign-funcall-pointer (aref table 11) nil :uint32 unprocessid :string
                           pchappkey vr-application-error))

(defun %get-application-process-id (table pchAppKey)
  (foreign-funcall-pointer (aref table 12) nil :string pchappkey :uint32))

(defun %get-applications-error-name-from-enum (table error)
  (foreign-funcall-pointer (aref table 13) nil vr-application-error error
                           :string))

(defun %get-application-property-string (table pchAppKey eProperty pchPropertyValueBuffer unPropertyValueBufferLen peError)
  (foreign-funcall-pointer (aref table 14) nil :string pchappkey
                           vr-application-property eproperty :string
                           pchpropertyvaluebuffer :uint32
                           unpropertyvaluebufferlen
                           (:pointer vr-application-error) peerror :uint32))

(defun %get-application-property-bool (table pchAppKey eProperty peError)
  (foreign-funcall-pointer (aref table 15) nil :string pchappkey
                           vr-application-property eproperty
                           (:pointer vr-application-error) peerror :bool))

(defun %get-application-property-uint64 (table pchAppKey eProperty peError)
  (foreign-funcall-pointer (aref table 16) nil :string pchappkey
                           vr-application-property eproperty
                           (:pointer vr-application-error) peerror :uint64))

(defun %set-application-auto-launch (table pchAppKey bAutoLaunch)
  (foreign-funcall-pointer (aref table 17) nil :string pchappkey :bool
                           bautolaunch vr-application-error))

(defun %get-application-auto-launch (table pchAppKey)
  (foreign-funcall-pointer (aref table 18) nil :string pchappkey :bool))

(defun %set-default-application-for-mime-type (table pchAppKey pchMimeType)
  (foreign-funcall-pointer (aref table 19) nil :string pchappkey :string
                           pchmimetype vr-application-error))

(defun %get-default-application-for-mime-type (table pchMimeType pchAppKeyBuffer unAppKeyBufferLen)
  (foreign-funcall-pointer (aref table 20) nil :string pchmimetype :string
                           pchappkeybuffer :uint32 unappkeybufferlen :bool))

(defun %get-application-supported-mime-types (table pchAppKey pchMimeTypesBuffer unMimeTypesBuffer)
  (foreign-funcall-pointer (aref table 21) nil :string pchappkey :string
                           pchmimetypesbuffer :uint32 unmimetypesbuffer :bool))

(defun %get-applications-that-support-mime-type (table pchMimeType pchAppKeysThatSupportBuffer unAppKeysThatSupportBuffer)
  (foreign-funcall-pointer (aref table 22) nil :string pchmimetype :string
                           pchappkeysthatsupportbuffer :uint32
                           unappkeysthatsupportbuffer :uint32))

(defun %get-application-launch-arguments (table unHandle pchArgs unArgs)
  (foreign-funcall-pointer (aref table 23) nil :uint32 unhandle :string pchargs
                           :uint32 unargs :uint32))

(defun %get-starting-application (table pchAppKeyBuffer unAppKeyBufferLen)
  (foreign-funcall-pointer (aref table 24) nil :string pchappkeybuffer :uint32
                           unappkeybufferlen vr-application-error))

(defun %get-transition-state (table)
  (foreign-funcall-pointer (aref table 25) nil vr-application-transition-state))

(defun %perform-application-prelaunch-check (table pchAppKey)
  (foreign-funcall-pointer (aref table 26) nil :string pchappkey
                           vr-application-error))

(defun %get-applications-transition-state-name-from-enum (table state)
  (foreign-funcall-pointer (aref table 27) nil vr-application-transition-state
                           state :string))

(defun %is-quit-user-prompt-requested (table)
  (foreign-funcall-pointer (aref table 28) nil :bool))

(defun %launch-internal-process (table pchBinaryPath pchArguments pchWorkingDirectory)
  (foreign-funcall-pointer (aref table 29) nil :string pchbinarypath :string
                           pcharguments :string pchworkingdirectory
                           vr-application-error))

(defun %get-current-scene-process-id (table)
  (foreign-funcall-pointer (aref table 30) nil :uint32))

 (defclass vr-chaperone ()
   ((table :reader table)))
(defmethod initialize-instance :after ((o vr-chaperone) &key)
  (let ((p (vr-get-generic-interface +vr-chaperone-version+)))
    (setf (slot-value o 'table) (make-array 8))
    (loop for i below 8
          do (setf (aref (table o) i) (cffi:mem-aref p :pointer i)))
    (format t "loaded function table for ~s = ~s~%" 'vr-chaperone (table o))))
(defun %get-calibration-state (table)
  (foreign-funcall-pointer (aref table 0) nil chaperone-calibration-state))

(defun %get-play-area-size (table pSizeX pSizeZ)
  (foreign-funcall-pointer (aref table 1) nil (:pointer :float) psizex
                           (:pointer :float) psizez :bool))

(defun %get-play-area-rect (table rect)
  (foreign-funcall-pointer (aref table 2) nil (:pointer (:struct hmd-quad-t))
                           rect :bool))

(defun %reload-info (table)
  (foreign-funcall-pointer (aref table 3) nil :void))

(defun %set-scene-color (table color)
  (foreign-funcall-pointer (aref table 4) nil (:struct hmd-color-t) color :void))

(defun %get-bounds-color (table pOutputColorArray nNumOutputColors flCollisionBoundsFadeDistance pOutputCameraColor)
  (foreign-funcall-pointer (aref table 5) nil (:pointer (:struct hmd-color-t))
                           poutputcolorarray :int nnumoutputcolors :float
                           flcollisionboundsfadedistance
                           (:pointer (:struct hmd-color-t)) poutputcameracolor
                           :void))

(defun %are-bounds-visible (table)
  (foreign-funcall-pointer (aref table 6) nil :bool))

(defun %force-bounds-visible (table bForce)
  (foreign-funcall-pointer (aref table 7) nil :bool bforce :void))

 (defclass vr-chaperone-setup ()
   ((table :reader table)))
(defmethod initialize-instance :after ((o vr-chaperone-setup) &key)
  (let ((p (vr-get-generic-interface +vr-chaperone-setup-version+)))
    (setf (slot-value o 'table) (make-array 20))
    (loop for i below 20
          do (setf (aref (table o) i) (cffi:mem-aref p :pointer i)))
    (format t "loaded function table for ~s = ~s~%" 'vr-chaperone-setup
            (table o))))
(defun %commit-working-copy (table configFile)
  (foreign-funcall-pointer (aref table 0) nil chaperone-config-file configfile
                           :bool))

(defun %revert-working-copy (table)
  (foreign-funcall-pointer (aref table 1) nil :void))

(defun %get-working-play-area-size (table pSizeX pSizeZ)
  (foreign-funcall-pointer (aref table 2) nil (:pointer :float) psizex
                           (:pointer :float) psizez :bool))

(defun %get-working-play-area-rect (table rect)
  (foreign-funcall-pointer (aref table 3) nil (:pointer (:struct hmd-quad-t))
                           rect :bool))

(defun %get-working-collision-bounds-info (table pQuadsBuffer punQuadsCount)
  (foreign-funcall-pointer (aref table 4) nil (:pointer (:struct hmd-quad-t))
                           pquadsbuffer (:pointer :uint32) punquadscount :bool))

(defun %get-live-collision-bounds-info (table pQuadsBuffer punQuadsCount)
  (foreign-funcall-pointer (aref table 5) nil (:pointer (:struct hmd-quad-t))
                           pquadsbuffer (:pointer :uint32) punquadscount :bool))

(defun %get-working-seated-zero-pose-to-raw-tracking-pose (table pmatSeatedZeroPoseToRawTrackingPose)
  (foreign-funcall-pointer (aref table 6) nil
                           (:pointer (:struct hmd-matrix-34-t))
                           pmatseatedzeroposetorawtrackingpose :bool))

(defun %get-working-standing-zero-pose-to-raw-tracking-pose (table pmatStandingZeroPoseToRawTrackingPose)
  (foreign-funcall-pointer (aref table 7) nil
                           (:pointer (:struct hmd-matrix-34-t))
                           pmatstandingzeroposetorawtrackingpose :bool))

(defun %set-working-play-area-size (table sizeX sizeZ)
  (foreign-funcall-pointer (aref table 8) nil :float sizex :float sizez :void))

(defun %set-working-collision-bounds-info (table pQuadsBuffer unQuadsCount)
  (foreign-funcall-pointer (aref table 9) nil (:pointer (:struct hmd-quad-t))
                           pquadsbuffer :uint32 unquadscount :void))

(defun %set-working-seated-zero-pose-to-raw-tracking-pose (table pMatSeatedZeroPoseToRawTrackingPose)
  (foreign-funcall-pointer (aref table 10) nil
                           (:pointer (:struct hmd-matrix-34-t))
                           pmatseatedzeroposetorawtrackingpose :void))

(defun %set-working-standing-zero-pose-to-raw-tracking-pose (table pMatStandingZeroPoseToRawTrackingPose)
  (foreign-funcall-pointer (aref table 11) nil
                           (:pointer (:struct hmd-matrix-34-t))
                           pmatstandingzeroposetorawtrackingpose :void))

(defun %reload-from-disk (table configFile)
  (foreign-funcall-pointer (aref table 12) nil chaperone-config-file configfile
                           :void))

(defun %get-live-seated-zero-pose-to-raw-tracking-pose (table pmatSeatedZeroPoseToRawTrackingPose)
  (foreign-funcall-pointer (aref table 13) nil
                           (:pointer (:struct hmd-matrix-34-t))
                           pmatseatedzeroposetorawtrackingpose :bool))

(defun %set-working-collision-bounds-tags-info (table pTagsBuffer unTagCount)
  (foreign-funcall-pointer (aref table 14) nil (:pointer :uint8) ptagsbuffer
                           :uint32 untagcount :void))

(defun %get-live-collision-bounds-tags-info (table pTagsBuffer punTagCount)
  (foreign-funcall-pointer (aref table 15) nil (:pointer :uint8) ptagsbuffer
                           (:pointer :uint32) puntagcount :bool))

(defun %set-working-physical-bounds-info (table pQuadsBuffer unQuadsCount)
  (foreign-funcall-pointer (aref table 16) nil (:pointer (:struct hmd-quad-t))
                           pquadsbuffer :uint32 unquadscount :bool))

(defun %get-live-physical-bounds-info (table pQuadsBuffer punQuadsCount)
  (foreign-funcall-pointer (aref table 17) nil (:pointer (:struct hmd-quad-t))
                           pquadsbuffer (:pointer :uint32) punquadscount :bool))

(defun %export-live-to-buffer (table pBuffer pnBufferLength)
  (foreign-funcall-pointer (aref table 18) nil :string pbuffer
                           (:pointer :uint32) pnbufferlength :bool))

(defun %import-from-buffer-to-working (table pBuffer nImportFlags)
  (foreign-funcall-pointer (aref table 19) nil :string pbuffer :uint32
                           nimportflags :bool))

 (defclass vr-compositor ()
   ((table :reader table)))
(defmethod initialize-instance :after ((o vr-compositor) &key)
  (let ((p (vr-get-generic-interface +vr-compositor-version+)))
    (setf (slot-value o 'table) (make-array 43))
    (loop for i below 43
          do (setf (aref (table o) i) (cffi:mem-aref p :pointer i)))
    (format t "loaded function table for ~s = ~s~%" 'vr-compositor (table o))))
(defun %set-tracking-space (table eOrigin)
  (foreign-funcall-pointer (aref table 0) nil tracking-universe-origin eorigin
                           :void))

(defun %get-tracking-space (table)
  (foreign-funcall-pointer (aref table 1) nil tracking-universe-origin))

(defun %wait-get-poses (table pRenderPoseArray unRenderPoseArrayCount pGamePoseArray unGamePoseArrayCount)
  (foreign-funcall-pointer (aref table 2) nil
                           (:pointer (:struct tracked-device-pose-t))
                           prenderposearray :uint32 unrenderposearraycount
                           (:pointer (:struct tracked-device-pose-t))
                           pgameposearray :uint32 ungameposearraycount
                           vr-compositor-error))

(defun %get-last-poses (table pRenderPoseArray unRenderPoseArrayCount pGamePoseArray unGamePoseArrayCount)
  (foreign-funcall-pointer (aref table 3) nil
                           (:pointer (:struct tracked-device-pose-t))
                           prenderposearray :uint32 unrenderposearraycount
                           (:pointer (:struct tracked-device-pose-t))
                           pgameposearray :uint32 ungameposearraycount
                           vr-compositor-error))

(defun %get-last-pose-for-tracked-device-index (table unDeviceIndex pOutputPose pOutputGamePose)
  (foreign-funcall-pointer (aref table 4) nil tracked-device-index-t
                           undeviceindex
                           (:pointer (:struct tracked-device-pose-t))
                           poutputpose
                           (:pointer (:struct tracked-device-pose-t))
                           poutputgamepose vr-compositor-error))

(defun %submit (table eEye pTexture pBounds nSubmitFlags)
  (foreign-funcall-pointer (aref table 5) nil vr-eye eeye
                           (:pointer (:struct texture-t)) ptexture
                           (:pointer (:struct vr-texture-bounds-t)) pbounds
                           vr-submit-flags nsubmitflags vr-compositor-error))

(defun %clear-last-submitted-frame (table)
  (foreign-funcall-pointer (aref table 6) nil :void))

(defun %post-present-handoff (table)
  (foreign-funcall-pointer (aref table 7) nil :void))

(defun %get-frame-timing (table pTiming unFramesAgo)
  (foreign-funcall-pointer (aref table 8) nil
                           (:pointer (:struct compositor-frame-timing)) ptiming
                           :uint32 unframesago :bool))

(defun %get-frame-timings (table pTiming nFrames)
  (foreign-funcall-pointer (aref table 9) nil
                           (:pointer (:struct compositor-frame-timing)) ptiming
                           :uint32 nframes :uint32))

(defun %get-frame-time-remaining (table)
  (foreign-funcall-pointer (aref table 10) nil :float))

(defun %get-cumulative-stats (table pStats nStatsSizeInBytes)
  (foreign-funcall-pointer (aref table 11) nil
                           (:pointer (:struct compositor-cumulative-stats))
                           pstats :uint32 nstatssizeinbytes :void))

(defun %fade-to-color (table fSeconds fRed fGreen fBlue fAlpha bBackground)
  (foreign-funcall-pointer (aref table 12) nil :float fseconds :float fred
                           :float fgreen :float fblue :float falpha :bool
                           bbackground :void))

(defun %get-current-fade-color (table bBackground)
  (foreign-funcall-pointer (aref table 13) nil :bool bbackground
                           (:struct hmd-color-t)))

(defun %fade-grid (table fSeconds bFadeIn)
  (foreign-funcall-pointer (aref table 14) nil :float fseconds :bool bfadein
                           :void))

(defun %get-current-grid-alpha (table)
  (foreign-funcall-pointer (aref table 15) nil :float))

(defun %set-skybox-override (table pTextures unTextureCount)
  (foreign-funcall-pointer (aref table 16) nil (:pointer (:struct texture-t))
                           ptextures :uint32 untexturecount vr-compositor-error))

(defun %clear-skybox-override (table)
  (foreign-funcall-pointer (aref table 17) nil :void))

(defun %compositor-bring-to-front (table)
  (foreign-funcall-pointer (aref table 18) nil :void))

(defun %compositor-go-to-back (table)
  (foreign-funcall-pointer (aref table 19) nil :void))

(defun %compositor-quit (table)
  (foreign-funcall-pointer (aref table 20) nil :void))

(defun %is-fullscreen (table)
  (foreign-funcall-pointer (aref table 21) nil :bool))

(defun %get-current-scene-focus-process (table)
  (foreign-funcall-pointer (aref table 22) nil :uint32))

(defun %get-last-frame-renderer (table)
  (foreign-funcall-pointer (aref table 23) nil :uint32))

(defun %can-render-scene (table)
  (foreign-funcall-pointer (aref table 24) nil :bool))

(defun %show-mirror-window (table)
  (foreign-funcall-pointer (aref table 25) nil :void))

(defun %hide-mirror-window (table)
  (foreign-funcall-pointer (aref table 26) nil :void))

(defun %is-mirror-window-visible (table)
  (foreign-funcall-pointer (aref table 27) nil :bool))

(defun %compositor-dump-images (table)
  (foreign-funcall-pointer (aref table 28) nil :void))

(defun %should-app-render-with-low-resources (table)
  (foreign-funcall-pointer (aref table 29) nil :bool))

(defun %force-interleaved-reprojection-on (table bOverride)
  (foreign-funcall-pointer (aref table 30) nil :bool boverride :void))

(defun %force-reconnect-process (table)
  (foreign-funcall-pointer (aref table 31) nil :void))

(defun %suspend-rendering (table bSuspend)
  (foreign-funcall-pointer (aref table 32) nil :bool bsuspend :void))

(defun %get-mirror-texture-d3d11 (table eEye pD3D11DeviceOrResource ppD3D11ShaderResourceView)
  (foreign-funcall-pointer (aref table 33) nil vr-eye eeye (:pointer :void)
                           pd3d11deviceorresource (:pointer :void)
                           ppd3d11shaderresourceview vr-compositor-error))

(defun %release-mirror-texture-d3d11 (table pD3D11ShaderResourceView)
  (foreign-funcall-pointer (aref table 34) nil (:pointer :void)
                           pd3d11shaderresourceview :void))

(defun %get-mirror-texture-gl (table eEye pglTextureId pglSharedTextureHandle)
  (foreign-funcall-pointer (aref table 35) nil vr-eye eeye (:pointer gl-uint-t)
                           pgltextureid (:pointer gl-shared-texture-handle-t)
                           pglsharedtexturehandle vr-compositor-error))

(defun %release-shared-gltexture (table glTextureId glSharedTextureHandle)
  (foreign-funcall-pointer (aref table 36) nil gl-uint-t gltextureid
                           gl-shared-texture-handle-t glsharedtexturehandle
                           :bool))

(defun %lock-glshared-texture-for-access (table glSharedTextureHandle)
  (foreign-funcall-pointer (aref table 37) nil gl-shared-texture-handle-t
                           glsharedtexturehandle :void))

(defun %unlock-glshared-texture-for-access (table glSharedTextureHandle)
  (foreign-funcall-pointer (aref table 38) nil gl-shared-texture-handle-t
                           glsharedtexturehandle :void))

(defun %get-vulkan-instance-extensions-required (table pchValue unBufferSize)
  (foreign-funcall-pointer (aref table 39) nil :string pchvalue :uint32
                           unbuffersize :uint32))

(defun %get-vulkan-device-extensions-required (table pPhysicalDevice pchValue unBufferSize)
  (foreign-funcall-pointer (aref table 40) nil
                           (:pointer (:struct vk-physical-device-t))
                           pphysicaldevice :string pchvalue :uint32
                           unbuffersize :uint32))

(defun %set-explicit-timing-mode (table bExplicitTimingMode)
  (foreign-funcall-pointer (aref table 41) nil :bool bexplicittimingmode :void))

(defun %submit-explicit-timing-data (table)
  (foreign-funcall-pointer (aref table 42) nil vr-compositor-error))

 (defclass vr-overlay ()
   ((table :reader table)))
(defmethod initialize-instance :after ((o vr-overlay) &key)
  (let ((p (vr-get-generic-interface +vr-overlay-version+)))
    (setf (slot-value o 'table) (make-array 81))
    (loop for i below 81
          do (setf (aref (table o) i) (cffi:mem-aref p :pointer i)))
    (format t "loaded function table for ~s = ~s~%" 'vr-overlay (table o))))
(defun %find-overlay (table pchOverlayKey pOverlayHandle)
  (foreign-funcall-pointer (aref table 0) nil :string pchoverlaykey
                           (:pointer vr-overlay-handle-t) poverlayhandle
                           vr-overlay-error))

(defun %create-overlay (table pchOverlayKey pchOverlayName pOverlayHandle)
  (foreign-funcall-pointer (aref table 1) nil :string pchoverlaykey :string
                           pchoverlayname (:pointer vr-overlay-handle-t)
                           poverlayhandle vr-overlay-error))

(defun %destroy-overlay (table ulOverlayHandle)
  (foreign-funcall-pointer (aref table 2) nil vr-overlay-handle-t
                           uloverlayhandle vr-overlay-error))

(defun %set-high-quality-overlay (table ulOverlayHandle)
  (foreign-funcall-pointer (aref table 3) nil vr-overlay-handle-t
                           uloverlayhandle vr-overlay-error))

(defun %get-high-quality-overlay (table)
  (foreign-funcall-pointer (aref table 4) nil vr-overlay-handle-t))

(defun %get-overlay-key (table ulOverlayHandle pchValue unBufferSize pError)
  (foreign-funcall-pointer (aref table 5) nil vr-overlay-handle-t
                           uloverlayhandle :string pchvalue :uint32
                           unbuffersize (:pointer vr-overlay-error) perror
                           :uint32))

(defun %get-overlay-name (table ulOverlayHandle pchValue unBufferSize pError)
  (foreign-funcall-pointer (aref table 6) nil vr-overlay-handle-t
                           uloverlayhandle :string pchvalue :uint32
                           unbuffersize (:pointer vr-overlay-error) perror
                           :uint32))

(defun %set-overlay-name (table ulOverlayHandle pchName)
  (foreign-funcall-pointer (aref table 7) nil vr-overlay-handle-t
                           uloverlayhandle :string pchname vr-overlay-error))

(defun %get-overlay-image-data (table ulOverlayHandle pvBuffer unBufferSize punWidth punHeight)
  (foreign-funcall-pointer (aref table 8) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer :void) pvbuffer :uint32
                           unbuffersize (:pointer :uint32) punwidth
                           (:pointer :uint32) punheight vr-overlay-error))

(defun %get-overlay-error-name-from-enum (table error)
  (foreign-funcall-pointer (aref table 9) nil vr-overlay-error error :string))

(defun %set-overlay-rendering-pid (table ulOverlayHandle unPID)
  (foreign-funcall-pointer (aref table 10) nil vr-overlay-handle-t
                           uloverlayhandle :uint32 unpid vr-overlay-error))

(defun %get-overlay-rendering-pid (table ulOverlayHandle)
  (foreign-funcall-pointer (aref table 11) nil vr-overlay-handle-t
                           uloverlayhandle :uint32))

(defun %set-overlay-flag (table ulOverlayHandle eOverlayFlag bEnabled)
  (foreign-funcall-pointer (aref table 12) nil vr-overlay-handle-t
                           uloverlayhandle vr-overlay-flags eoverlayflag :bool
                           benabled vr-overlay-error))

(defun %get-overlay-flag (table ulOverlayHandle eOverlayFlag pbEnabled)
  (foreign-funcall-pointer (aref table 13) nil vr-overlay-handle-t
                           uloverlayhandle vr-overlay-flags eoverlayflag
                           (:pointer :bool) pbenabled vr-overlay-error))

(defun %set-overlay-color (table ulOverlayHandle fRed fGreen fBlue)
  (foreign-funcall-pointer (aref table 14) nil vr-overlay-handle-t
                           uloverlayhandle :float fred :float fgreen :float
                           fblue vr-overlay-error))

(defun %get-overlay-color (table ulOverlayHandle pfRed pfGreen pfBlue)
  (foreign-funcall-pointer (aref table 15) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer :float) pfred
                           (:pointer :float) pfgreen (:pointer :float) pfblue
                           vr-overlay-error))

(defun %set-overlay-alpha (table ulOverlayHandle fAlpha)
  (foreign-funcall-pointer (aref table 16) nil vr-overlay-handle-t
                           uloverlayhandle :float falpha vr-overlay-error))

(defun %get-overlay-alpha (table ulOverlayHandle pfAlpha)
  (foreign-funcall-pointer (aref table 17) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer :float) pfalpha
                           vr-overlay-error))

(defun %set-overlay-texel-aspect (table ulOverlayHandle fTexelAspect)
  (foreign-funcall-pointer (aref table 18) nil vr-overlay-handle-t
                           uloverlayhandle :float ftexelaspect vr-overlay-error))

(defun %get-overlay-texel-aspect (table ulOverlayHandle pfTexelAspect)
  (foreign-funcall-pointer (aref table 19) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer :float) pftexelaspect
                           vr-overlay-error))

(defun %set-overlay-sort-order (table ulOverlayHandle unSortOrder)
  (foreign-funcall-pointer (aref table 20) nil vr-overlay-handle-t
                           uloverlayhandle :uint32 unsortorder vr-overlay-error))

(defun %get-overlay-sort-order (table ulOverlayHandle punSortOrder)
  (foreign-funcall-pointer (aref table 21) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer :uint32) punsortorder
                           vr-overlay-error))

(defun %set-overlay-width-in-meters (table ulOverlayHandle fWidthInMeters)
  (foreign-funcall-pointer (aref table 22) nil vr-overlay-handle-t
                           uloverlayhandle :float fwidthinmeters
                           vr-overlay-error))

(defun %get-overlay-width-in-meters (table ulOverlayHandle pfWidthInMeters)
  (foreign-funcall-pointer (aref table 23) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer :float) pfwidthinmeters
                           vr-overlay-error))

(defun %set-overlay-auto-curve-distance-range-in-meters (table ulOverlayHandle fMinDistanceInMeters fMaxDistanceInMeters)
  (foreign-funcall-pointer (aref table 24) nil vr-overlay-handle-t
                           uloverlayhandle :float fmindistanceinmeters :float
                           fmaxdistanceinmeters vr-overlay-error))

(defun %get-overlay-auto-curve-distance-range-in-meters (table ulOverlayHandle pfMinDistanceInMeters pfMaxDistanceInMeters)
  (foreign-funcall-pointer (aref table 25) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer :float)
                           pfmindistanceinmeters (:pointer :float)
                           pfmaxdistanceinmeters vr-overlay-error))

(defun %set-overlay-texture-color-space (table ulOverlayHandle eTextureColorSpace)
  (foreign-funcall-pointer (aref table 26) nil vr-overlay-handle-t
                           uloverlayhandle color-space etexturecolorspace
                           vr-overlay-error))

(defun %get-overlay-texture-color-space (table ulOverlayHandle peTextureColorSpace)
  (foreign-funcall-pointer (aref table 27) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer color-space)
                           petexturecolorspace vr-overlay-error))

(defun %set-overlay-texture-bounds (table ulOverlayHandle pOverlayTextureBounds)
  (foreign-funcall-pointer (aref table 28) nil vr-overlay-handle-t
                           uloverlayhandle
                           (:pointer (:struct vr-texture-bounds-t))
                           poverlaytexturebounds vr-overlay-error))

(defun %get-overlay-texture-bounds (table ulOverlayHandle pOverlayTextureBounds)
  (foreign-funcall-pointer (aref table 29) nil vr-overlay-handle-t
                           uloverlayhandle
                           (:pointer (:struct vr-texture-bounds-t))
                           poverlaytexturebounds vr-overlay-error))

(defun %get-overlay-render-model (table ulOverlayHandle pchValue unBufferSize pColor pError)
  (foreign-funcall-pointer (aref table 30) nil vr-overlay-handle-t
                           uloverlayhandle :string pchvalue :uint32
                           unbuffersize (:pointer (:struct hmd-color-t)) pcolor
                           (:pointer vr-overlay-error) perror :uint32))

(defun %set-overlay-render-model (table ulOverlayHandle pchRenderModel pColor)
  (foreign-funcall-pointer (aref table 31) nil vr-overlay-handle-t
                           uloverlayhandle :string pchrendermodel
                           (:pointer (:struct hmd-color-t)) pcolor
                           vr-overlay-error))

(defun %get-overlay-transform-type (table ulOverlayHandle peTransformType)
  (foreign-funcall-pointer (aref table 32) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer vr-overlay-transform-type)
                           petransformtype vr-overlay-error))

(defun %set-overlay-transform-absolute (table ulOverlayHandle eTrackingOrigin pmatTrackingOriginToOverlayTransform)
  (foreign-funcall-pointer (aref table 33) nil vr-overlay-handle-t
                           uloverlayhandle tracking-universe-origin
                           etrackingorigin (:pointer (:struct hmd-matrix-34-t))
                           pmattrackingorigintooverlaytransform
                           vr-overlay-error))

(defun %get-overlay-transform-absolute (table ulOverlayHandle peTrackingOrigin pmatTrackingOriginToOverlayTransform)
  (foreign-funcall-pointer (aref table 34) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer tracking-universe-origin)
                           petrackingorigin
                           (:pointer (:struct hmd-matrix-34-t))
                           pmattrackingorigintooverlaytransform
                           vr-overlay-error))

(defun %set-overlay-transform-tracked-device-relative (table ulOverlayHandle unTrackedDevice pmatTrackedDeviceToOverlayTransform)
  (foreign-funcall-pointer (aref table 35) nil vr-overlay-handle-t
                           uloverlayhandle tracked-device-index-t
                           untrackeddevice (:pointer (:struct hmd-matrix-34-t))
                           pmattrackeddevicetooverlaytransform vr-overlay-error))

(defun %get-overlay-transform-tracked-device-relative (table ulOverlayHandle punTrackedDevice pmatTrackedDeviceToOverlayTransform)
  (foreign-funcall-pointer (aref table 36) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer tracked-device-index-t)
                           puntrackeddevice
                           (:pointer (:struct hmd-matrix-34-t))
                           pmattrackeddevicetooverlaytransform vr-overlay-error))

(defun %set-overlay-transform-tracked-device-component (table ulOverlayHandle unDeviceIndex pchComponentName)
  (foreign-funcall-pointer (aref table 37) nil vr-overlay-handle-t
                           uloverlayhandle tracked-device-index-t undeviceindex
                           :string pchcomponentname vr-overlay-error))

(defun %get-overlay-transform-tracked-device-component (table ulOverlayHandle punDeviceIndex pchComponentName unComponentNameSize)
  (foreign-funcall-pointer (aref table 38) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer tracked-device-index-t)
                           pundeviceindex :string pchcomponentname :uint32
                           uncomponentnamesize vr-overlay-error))

(defun %get-overlay-transform-overlay-relative (table ulOverlayHandle ulOverlayHandleParent pmatParentOverlayToOverlayTransform)
  (foreign-funcall-pointer (aref table 39) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer vr-overlay-handle-t)
                           uloverlayhandleparent
                           (:pointer (:struct hmd-matrix-34-t))
                           pmatparentoverlaytooverlaytransform vr-overlay-error))

(defun %set-overlay-transform-overlay-relative (table ulOverlayHandle ulOverlayHandleParent pmatParentOverlayToOverlayTransform)
  (foreign-funcall-pointer (aref table 40) nil vr-overlay-handle-t
                           uloverlayhandle vr-overlay-handle-t
                           uloverlayhandleparent
                           (:pointer (:struct hmd-matrix-34-t))
                           pmatparentoverlaytooverlaytransform vr-overlay-error))

(defun %show-overlay (table ulOverlayHandle)
  (foreign-funcall-pointer (aref table 41) nil vr-overlay-handle-t
                           uloverlayhandle vr-overlay-error))

(defun %hide-overlay (table ulOverlayHandle)
  (foreign-funcall-pointer (aref table 42) nil vr-overlay-handle-t
                           uloverlayhandle vr-overlay-error))

(defun %is-overlay-visible (table ulOverlayHandle)
  (foreign-funcall-pointer (aref table 43) nil vr-overlay-handle-t
                           uloverlayhandle :bool))

(defun %get-transform-for-overlay-coordinates (table ulOverlayHandle eTrackingOrigin coordinatesInOverlay pmatTransform)
  (foreign-funcall-pointer (aref table 44) nil vr-overlay-handle-t
                           uloverlayhandle tracking-universe-origin
                           etrackingorigin (:struct hmd-vector-2-t)
                           coordinatesinoverlay
                           (:pointer (:struct hmd-matrix-34-t)) pmattransform
                           vr-overlay-error))

(defun %poll-next-overlay-event (table ulOverlayHandle pEvent uncbVREvent)
  (foreign-funcall-pointer (aref table 45) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer (:struct vr-event-t))
                           pevent :uint32 uncbvrevent :bool))

(defun %get-overlay-input-method (table ulOverlayHandle peInputMethod)
  (foreign-funcall-pointer (aref table 46) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer vr-overlay-input-method)
                           peinputmethod vr-overlay-error))

(defun %set-overlay-input-method (table ulOverlayHandle eInputMethod)
  (foreign-funcall-pointer (aref table 47) nil vr-overlay-handle-t
                           uloverlayhandle vr-overlay-input-method einputmethod
                           vr-overlay-error))

(defun %get-overlay-mouse-scale (table ulOverlayHandle pvecMouseScale)
  (foreign-funcall-pointer (aref table 48) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer (:struct hmd-vector-2-t))
                           pvecmousescale vr-overlay-error))

(defun %set-overlay-mouse-scale (table ulOverlayHandle pvecMouseScale)
  (foreign-funcall-pointer (aref table 49) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer (:struct hmd-vector-2-t))
                           pvecmousescale vr-overlay-error))

(defun %compute-overlay-intersection (table ulOverlayHandle pParams pResults)
  (foreign-funcall-pointer (aref table 50) nil vr-overlay-handle-t
                           uloverlayhandle
                           (:pointer (:struct vr-overlay-intersection-params-t))
                           pparams
                           (:pointer (:struct vr-overlay-intersection-results-t))
                           presults :bool))

(defun %handle-controller-overlay-interaction-as-mouse (table ulOverlayHandle unControllerDeviceIndex)
  (foreign-funcall-pointer (aref table 51) nil vr-overlay-handle-t
                           uloverlayhandle tracked-device-index-t
                           uncontrollerdeviceindex :bool))

(defun %is-hover-target-overlay (table ulOverlayHandle)
  (foreign-funcall-pointer (aref table 52) nil vr-overlay-handle-t
                           uloverlayhandle :bool))

(defun %get-gamepad-focus-overlay (table)
  (foreign-funcall-pointer (aref table 53) nil vr-overlay-handle-t))

(defun %set-gamepad-focus-overlay (table ulNewFocusOverlay)
  (foreign-funcall-pointer (aref table 54) nil vr-overlay-handle-t
                           ulnewfocusoverlay vr-overlay-error))

(defun %set-overlay-neighbor (table eDirection ulFrom ulTo)
  (foreign-funcall-pointer (aref table 55) nil overlay-direction edirection
                           vr-overlay-handle-t ulfrom vr-overlay-handle-t ulto
                           vr-overlay-error))

(defun %move-gamepad-focus-to-neighbor (table eDirection ulFrom)
  (foreign-funcall-pointer (aref table 56) nil overlay-direction edirection
                           vr-overlay-handle-t ulfrom vr-overlay-error))

(defun %set-overlay-texture (table ulOverlayHandle pTexture)
  (foreign-funcall-pointer (aref table 57) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer (:struct texture-t))
                           ptexture vr-overlay-error))

(defun %clear-overlay-texture (table ulOverlayHandle)
  (foreign-funcall-pointer (aref table 58) nil vr-overlay-handle-t
                           uloverlayhandle vr-overlay-error))

(defun %set-overlay-raw (table ulOverlayHandle pvBuffer unWidth unHeight unDepth)
  (foreign-funcall-pointer (aref table 59) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer :void) pvbuffer :uint32
                           unwidth :uint32 unheight :uint32 undepth
                           vr-overlay-error))

(defun %set-overlay-from-file (table ulOverlayHandle pchFilePath)
  (foreign-funcall-pointer (aref table 60) nil vr-overlay-handle-t
                           uloverlayhandle :string pchfilepath vr-overlay-error))

(defun %get-overlay-texture (table ulOverlayHandle pNativeTextureHandle pNativeTextureRef pWidth pHeight pNativeFormat pAPIType pColorSpace pTextureBounds)
  (foreign-funcall-pointer (aref table 61) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer :void)
                           pnativetexturehandle (:pointer :void)
                           pnativetextureref (:pointer :uint32) pwidth
                           (:pointer :uint32) pheight (:pointer :uint32)
                           pnativeformat (:pointer texture-type) papitype
                           (:pointer color-space) pcolorspace
                           (:pointer (:struct vr-texture-bounds-t))
                           ptexturebounds vr-overlay-error))

(defun %release-native-overlay-handle (table ulOverlayHandle pNativeTextureHandle)
  (foreign-funcall-pointer (aref table 62) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer :void)
                           pnativetexturehandle vr-overlay-error))

(defun %get-overlay-texture-size (table ulOverlayHandle pWidth pHeight)
  (foreign-funcall-pointer (aref table 63) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer :uint32) pwidth
                           (:pointer :uint32) pheight vr-overlay-error))

(defun %create-dashboard-overlay (table pchOverlayKey pchOverlayFriendlyName pMainHandle pThumbnailHandle)
  (foreign-funcall-pointer (aref table 64) nil :string pchoverlaykey :string
                           pchoverlayfriendlyname
                           (:pointer vr-overlay-handle-t) pmainhandle
                           (:pointer vr-overlay-handle-t) pthumbnailhandle
                           vr-overlay-error))

(defun %is-dashboard-visible (table)
  (foreign-funcall-pointer (aref table 65) nil :bool))

(defun %is-active-dashboard-overlay (table ulOverlayHandle)
  (foreign-funcall-pointer (aref table 66) nil vr-overlay-handle-t
                           uloverlayhandle :bool))

(defun %set-dashboard-overlay-scene-process (table ulOverlayHandle unProcessId)
  (foreign-funcall-pointer (aref table 67) nil vr-overlay-handle-t
                           uloverlayhandle :uint32 unprocessid vr-overlay-error))

(defun %get-dashboard-overlay-scene-process (table ulOverlayHandle punProcessId)
  (foreign-funcall-pointer (aref table 68) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer :uint32) punprocessid
                           vr-overlay-error))

(defun %show-dashboard (table pchOverlayToShow)
  (foreign-funcall-pointer (aref table 69) nil :string pchoverlaytoshow :void))

(defun %get-primary-dashboard-device (table)
  (foreign-funcall-pointer (aref table 70) nil tracked-device-index-t))

(defun %show-keyboard (table eInputMode eLineInputMode pchDescription unCharMax pchExistingText bUseMinimalMode uUserValue)
  (foreign-funcall-pointer (aref table 71) nil gamepad-text-input-mode
                           einputmode gamepad-text-input-line-mode
                           elineinputmode :string pchdescription :uint32
                           uncharmax :string pchexistingtext :bool
                           buseminimalmode :uint64 uuservalue vr-overlay-error))

(defun %show-keyboard-for-overlay (table ulOverlayHandle eInputMode eLineInputMode pchDescription unCharMax pchExistingText bUseMinimalMode uUserValue)
  (foreign-funcall-pointer (aref table 72) nil vr-overlay-handle-t
                           uloverlayhandle gamepad-text-input-mode einputmode
                           gamepad-text-input-line-mode elineinputmode :string
                           pchdescription :uint32 uncharmax :string
                           pchexistingtext :bool buseminimalmode :uint64
                           uuservalue vr-overlay-error))

(defun %get-keyboard-text (table pchText cchText)
  (foreign-funcall-pointer (aref table 73) nil :string pchtext :uint32 cchtext
                           :uint32))

(defun %hide-keyboard (table)
  (foreign-funcall-pointer (aref table 74) nil :void))

(defun %set-keyboard-transform-absolute (table eTrackingOrigin pmatTrackingOriginToKeyboardTransform)
  (foreign-funcall-pointer (aref table 75) nil tracking-universe-origin
                           etrackingorigin (:pointer (:struct hmd-matrix-34-t))
                           pmattrackingorigintokeyboardtransform :void))

(defun %set-keyboard-position-for-overlay (table ulOverlayHandle avoidRect)
  (foreign-funcall-pointer (aref table 76) nil vr-overlay-handle-t
                           uloverlayhandle (:struct hmd-rect-2-t) avoidrect
                           :void))

(defun %set-overlay-intersection-mask (table ulOverlayHandle pMaskPrimitives unNumMaskPrimitives unPrimitiveSize)
  (foreign-funcall-pointer (aref table 77) nil vr-overlay-handle-t
                           uloverlayhandle
                           (:pointer (:struct vr-overlay-intersection-mask-primitive-t))
                           pmaskprimitives :uint32 unnummaskprimitives :uint32
                           unprimitivesize vr-overlay-error))

(defun %get-overlay-flags (table ulOverlayHandle pFlags)
  (foreign-funcall-pointer (aref table 78) nil vr-overlay-handle-t
                           uloverlayhandle (:pointer :uint32) pflags
                           vr-overlay-error))

(defun %show-message-overlay (table pchText pchCaption pchButton0Text pchButton1Text pchButton2Text pchButton3Text)
  (foreign-funcall-pointer (aref table 79) nil :string pchtext :string
                           pchcaption :string pchbutton0text :string
                           pchbutton1text :string pchbutton2text :string
                           pchbutton3text vr-message-overlay-response))

(defun %close-message-overlay (table)
  (foreign-funcall-pointer (aref table 80) nil :void))

 (defclass vr-render-models ()
   ((table :reader table)))
(defmethod initialize-instance :after ((o vr-render-models) &key)
  (let ((p (vr-get-generic-interface +vr-render-models-version+)))
    (setf (slot-value o 'table) (make-array 18))
    (loop for i below 18
          do (setf (aref (table o) i) (cffi:mem-aref p :pointer i)))
    (format t "loaded function table for ~s = ~s~%" 'vr-render-models
            (table o))))
(defun %load-render-model-async (table pchRenderModelName ppRenderModel)
  (foreign-funcall-pointer (aref table 0) nil :string pchrendermodelname
                           (:pointer (:struct render-model-t)) pprendermodel
                           vr-render-model-error))

(defun %free-render-model (table pRenderModel)
  (foreign-funcall-pointer (aref table 1) nil
                           (:pointer (:struct render-model-t)) prendermodel
                           :void))

(defun %load-texture-async (table textureId ppTexture)
  (foreign-funcall-pointer (aref table 2) nil texture-id-t textureid
                           (:pointer (:struct render-model-texture-map-t))
                           pptexture vr-render-model-error))

(defun %free-texture (table pTexture)
  (foreign-funcall-pointer (aref table 3) nil
                           (:pointer (:struct render-model-texture-map-t))
                           ptexture :void))

(defun %load-texture-d3d11-async (table textureId pD3D11Device ppD3D11Texture2D)
  (foreign-funcall-pointer (aref table 4) nil texture-id-t textureid
                           (:pointer :void) pd3d11device (:pointer :void)
                           ppd3d11texture2d vr-render-model-error))

(defun %load-into-texture-d3d11-async (table textureId pDstTexture)
  (foreign-funcall-pointer (aref table 5) nil texture-id-t textureid
                           (:pointer :void) pdsttexture vr-render-model-error))

(defun %free-texture-d3d11 (table pD3D11Texture2D)
  (foreign-funcall-pointer (aref table 6) nil (:pointer :void) pd3d11texture2d
                           :void))

(defun %get-render-model-name (table unRenderModelIndex pchRenderModelName unRenderModelNameLen)
  (foreign-funcall-pointer (aref table 7) nil :uint32 unrendermodelindex
                           :string pchrendermodelname :uint32
                           unrendermodelnamelen :uint32))

(defun %get-render-model-count (table)
  (foreign-funcall-pointer (aref table 8) nil :uint32))

(defun %get-component-count (table pchRenderModelName)
  (foreign-funcall-pointer (aref table 9) nil :string pchrendermodelname
                           :uint32))

(defun %get-component-name (table pchRenderModelName unComponentIndex pchComponentName unComponentNameLen)
  (foreign-funcall-pointer (aref table 10) nil :string pchrendermodelname
                           :uint32 uncomponentindex :string pchcomponentname
                           :uint32 uncomponentnamelen :uint32))

(defun %get-component-button-mask (table pchRenderModelName pchComponentName)
  (foreign-funcall-pointer (aref table 11) nil :string pchrendermodelname
                           :string pchcomponentname :uint64))

(defun %get-component-render-model-name (table pchRenderModelName pchComponentName pchComponentRenderModelName unComponentRenderModelNameLen)
  (foreign-funcall-pointer (aref table 12) nil :string pchrendermodelname
                           :string pchcomponentname :string
                           pchcomponentrendermodelname :uint32
                           uncomponentrendermodelnamelen :uint32))

(defun %get-component-state (table pchRenderModelName pchComponentName pControllerState pState pComponentState)
  (foreign-funcall-pointer (aref table 13) nil :string pchrendermodelname
                           :string pchcomponentname
                           (:pointer (:struct vr-controller-state-001-t))
                           pcontrollerstate
                           (:pointer (:struct render-model-controller-mode-state-t))
                           pstate
                           (:pointer (:struct render-model-component-state-t))
                           pcomponentstate :bool))

(defun %render-model-has-component (table pchRenderModelName pchComponentName)
  (foreign-funcall-pointer (aref table 14) nil :string pchrendermodelname
                           :string pchcomponentname :bool))

(defun %get-render-model-thumbnail-url (table pchRenderModelName pchThumbnailURL unThumbnailURLLen peError)
  (foreign-funcall-pointer (aref table 15) nil :string pchrendermodelname
                           :string pchthumbnailurl :uint32 unthumbnailurllen
                           (:pointer vr-render-model-error) peerror :uint32))

(defun %get-render-model-original-path (table pchRenderModelName pchOriginalPath unOriginalPathLen peError)
  (foreign-funcall-pointer (aref table 16) nil :string pchrendermodelname
                           :string pchoriginalpath :uint32 unoriginalpathlen
                           (:pointer vr-render-model-error) peerror :uint32))

(defun %get-render-model-error-name-from-enum (table error)
  (foreign-funcall-pointer (aref table 17) nil vr-render-model-error error
                           :string))

 (defclass vr-notifications ()
   ((table :reader table)))
(defmethod initialize-instance :after ((o vr-notifications) &key)
  (let ((p (vr-get-generic-interface +vr-notifications-version+)))
    (setf (slot-value o 'table) (make-array 2))
    (loop for i below 2
          do (setf (aref (table o) i) (cffi:mem-aref p :pointer i)))
    (format t "loaded function table for ~s = ~s~%" 'vr-notifications
            (table o))))
(defun %create-notification (table ulOverlayHandle ulUserValue type pchText style pImage pNotificationId)
  (foreign-funcall-pointer (aref table 0) nil vr-overlay-handle-t
                           uloverlayhandle :uint64 uluservalue
                           vr-notification-type type :string pchtext
                           vr-notification-style style
                           (:pointer (:struct notification-bitmap-t)) pimage
                           (:pointer vr-notification-id) pnotificationid
                           vr-notification-error))

(defun %remove-notification (table notificationId)
  (foreign-funcall-pointer (aref table 1) nil vr-notification-id notificationid
                           vr-notification-error))

 (defclass vr-settings ()
   ((table :reader table)))
(defmethod initialize-instance :after ((o vr-settings) &key)
  (let ((p (vr-get-generic-interface +vr-settings-version+)))
    (setf (slot-value o 'table) (make-array 12))
    (loop for i below 12
          do (setf (aref (table o) i) (cffi:mem-aref p :pointer i)))
    (format t "loaded function table for ~s = ~s~%" 'vr-settings (table o))))
(defun %get-settings-error-name-from-enum (table eError)
  (foreign-funcall-pointer (aref table 0) nil vr-settings-error eerror :string))

(defun %sync (table bForce peError)
  (foreign-funcall-pointer (aref table 1) nil :bool bforce
                           (:pointer vr-settings-error) peerror :bool))

(defun %set-bool (table pchSection pchSettingsKey bValue peError)
  (foreign-funcall-pointer (aref table 2) nil :string pchsection :string
                           pchsettingskey :bool bvalue
                           (:pointer vr-settings-error) peerror :void))

(defun %set-int32 (table pchSection pchSettingsKey nValue peError)
  (foreign-funcall-pointer (aref table 3) nil :string pchsection :string
                           pchsettingskey :int32 nvalue
                           (:pointer vr-settings-error) peerror :void))

(defun %set-float (table pchSection pchSettingsKey flValue peError)
  (foreign-funcall-pointer (aref table 4) nil :string pchsection :string
                           pchsettingskey :float flvalue
                           (:pointer vr-settings-error) peerror :void))

(defun %set-string (table pchSection pchSettingsKey pchValue peError)
  (foreign-funcall-pointer (aref table 5) nil :string pchsection :string
                           pchsettingskey :string pchvalue
                           (:pointer vr-settings-error) peerror :void))

(defun %get-bool (table pchSection pchSettingsKey peError)
  (foreign-funcall-pointer (aref table 6) nil :string pchsection :string
                           pchsettingskey (:pointer vr-settings-error) peerror
                           :bool))

(defun %get-int32 (table pchSection pchSettingsKey peError)
  (foreign-funcall-pointer (aref table 7) nil :string pchsection :string
                           pchsettingskey (:pointer vr-settings-error) peerror
                           :int32))

(defun %get-float (table pchSection pchSettingsKey peError)
  (foreign-funcall-pointer (aref table 8) nil :string pchsection :string
                           pchsettingskey (:pointer vr-settings-error) peerror
                           :float))

(defun %get-string (table pchSection pchSettingsKey pchValue unValueLen peError)
  (foreign-funcall-pointer (aref table 9) nil :string pchsection :string
                           pchsettingskey :string pchvalue :uint32 unvaluelen
                           (:pointer vr-settings-error) peerror :void))

(defun %remove-section (table pchSection peError)
  (foreign-funcall-pointer (aref table 10) nil :string pchsection
                           (:pointer vr-settings-error) peerror :void))

(defun %remove-key-in-section (table pchSection pchSettingsKey peError)
  (foreign-funcall-pointer (aref table 11) nil :string pchsection :string
                           pchsettingskey (:pointer vr-settings-error) peerror
                           :void))

 (defclass vr-screenshots ()
   ((table :reader table)))
(defmethod initialize-instance :after ((o vr-screenshots) &key)
  (let ((p (vr-get-generic-interface +vr-screenshots-version+)))
    (setf (slot-value o 'table) (make-array 7))
    (loop for i below 7
          do (setf (aref (table o) i) (cffi:mem-aref p :pointer i)))
    (format t "loaded function table for ~s = ~s~%" 'vr-screenshots (table o))))
(defun %request-screenshot (table pOutScreenshotHandle type pchPreviewFilename pchVRFilename)
  (foreign-funcall-pointer (aref table 0) nil (:pointer screenshot-handle-t)
                           poutscreenshothandle vr-screenshot-type type :string
                           pchpreviewfilename :string pchvrfilename
                           vr-screenshot-error))

(defun %hook-screenshot (table pSupportedTypes numTypes)
  (foreign-funcall-pointer (aref table 1) nil (:pointer vr-screenshot-type)
                           psupportedtypes :int numtypes vr-screenshot-error))

(defun %get-screenshot-property-type (table screenshotHandle pError)
  (foreign-funcall-pointer (aref table 2) nil screenshot-handle-t
                           screenshothandle (:pointer vr-screenshot-error)
                           perror vr-screenshot-type))

(defun %get-screenshot-property-filename (table screenshotHandle filenameType pchFilename cchFilename pError)
  (foreign-funcall-pointer (aref table 3) nil screenshot-handle-t
                           screenshothandle vr-screenshot-property-filenames
                           filenametype :string pchfilename :uint32 cchfilename
                           (:pointer vr-screenshot-error) perror :uint32))

(defun %update-screenshot-progress (table screenshotHandle flProgress)
  (foreign-funcall-pointer (aref table 4) nil screenshot-handle-t
                           screenshothandle :float flprogress
                           vr-screenshot-error))

(defun %take-stereo-screenshot (table pOutScreenshotHandle pchPreviewFilename pchVRFilename)
  (foreign-funcall-pointer (aref table 5) nil (:pointer screenshot-handle-t)
                           poutscreenshothandle :string pchpreviewfilename
                           :string pchvrfilename vr-screenshot-error))

(defun %submit-screenshot (table screenshotHandle type pchSourcePreviewFilename pchSourceVRFilename)
  (foreign-funcall-pointer (aref table 6) nil screenshot-handle-t
                           screenshothandle vr-screenshot-type type :string
                           pchsourcepreviewfilename :string pchsourcevrfilename
                           vr-screenshot-error))

 (defclass vr-resources ()
   ((table :reader table)))
(defmethod initialize-instance :after ((o vr-resources) &key)
  (let ((p (vr-get-generic-interface +vr-resources-version+)))
    (setf (slot-value o 'table) (make-array 2))
    (loop for i below 2
          do (setf (aref (table o) i) (cffi:mem-aref p :pointer i)))
    (format t "loaded function table for ~s = ~s~%" 'vr-resources (table o))))
(defun %load-shared-resource (table pchResourceName pchBuffer unBufferLen)
  (foreign-funcall-pointer (aref table 0) nil :string pchresourcename :string
                           pchbuffer :uint32 unbufferlen :uint32))

(defun %get-resource-full-path (table pchResourceName pchResourceTypeDirectory pchPathBuffer unBufferLen)
  (foreign-funcall-pointer (aref table 1) nil :string pchresourcename :string
                           pchresourcetypedirectory :string pchpathbuffer
                           :uint32 unbufferlen :uint32))

 (defclass vr-driver-manager ()
   ((table :reader table)))
(defmethod initialize-instance :after ((o vr-driver-manager) &key)
  (let ((p (vr-get-generic-interface +vr-driver-manager-version+)))
    (setf (slot-value o 'table) (make-array 2))
    (loop for i below 2
          do (setf (aref (table o) i) (cffi:mem-aref p :pointer i)))
    (format t "loaded function table for ~s = ~s~%" 'vr-driver-manager
            (table o))))
(defun %get-driver-count (table)
  (foreign-funcall-pointer (aref table 0) nil :uint32))

(defun %get-driver-name (table nDriver pchValue unBufferSize)
  (foreign-funcall-pointer (aref table 1) nil driver-id-t ndriver :string
                           pchvalue :uint32 unbuffersize :uint32))

