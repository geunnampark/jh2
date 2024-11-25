
(cl:in-package :asdf)

(defsystem "cbnu_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "AllObjectsData" :depends-on ("_package_AllObjectsData"))
    (:file "_package_AllObjectsData" :depends-on ("_package"))
    (:file "AnObjectData" :depends-on ("_package_AnObjectData"))
    (:file "_package_AnObjectData" :depends-on ("_package"))
    (:file "Gps" :depends-on ("_package_Gps"))
    (:file "_package_Gps" :depends-on ("_package"))
    (:file "MultiScenarioLoad" :depends-on ("_package_MultiScenarioLoad"))
    (:file "_package_MultiScenarioLoad" :depends-on ("_package"))
    (:file "VehicleCmd" :depends-on ("_package_VehicleCmd"))
    (:file "_package_VehicleCmd" :depends-on ("_package"))
    (:file "VehicleTlm" :depends-on ("_package_VehicleTlm"))
    (:file "_package_VehicleTlm" :depends-on ("_package"))
  ))