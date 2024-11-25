;; Auto-generated. Do not edit!


(when (boundp 'cbnu_msgs::VehicleCmd)
  (if (not (find-package "CBNU_MSGS"))
    (make-package "CBNU_MSGS"))
  (shadow 'VehicleCmd (find-package "CBNU_MSGS")))
(unless (find-package "CBNU_MSGS::VEHICLECMD")
  (make-package "CBNU_MSGS::VEHICLECMD"))

(in-package "ROS")
;;//! \htmlinclude VehicleCmd.msg.html


(defclass cbnu_msgs::VehicleCmd
  :super ros::object
  :slots (_longlCmdType _accel _brake _steering _velocity _acceleration _gear_cmd ))

(defmethod cbnu_msgs::VehicleCmd
  (:init
   (&key
    ((:longlCmdType __longlCmdType) 0)
    ((:accel __accel) 0.0)
    ((:brake __brake) 0.0)
    ((:steering __steering) 0.0)
    ((:velocity __velocity) 0.0)
    ((:acceleration __acceleration) 0.0)
    ((:gear_cmd __gear_cmd) 0)
    )
   (send-super :init)
   (setq _longlCmdType (round __longlCmdType))
   (setq _accel (float __accel))
   (setq _brake (float __brake))
   (setq _steering (float __steering))
   (setq _velocity (float __velocity))
   (setq _acceleration (float __acceleration))
   (setq _gear_cmd (round __gear_cmd))
   self)
  (:longlCmdType
   (&optional __longlCmdType)
   (if __longlCmdType (setq _longlCmdType __longlCmdType)) _longlCmdType)
  (:accel
   (&optional __accel)
   (if __accel (setq _accel __accel)) _accel)
  (:brake
   (&optional __brake)
   (if __brake (setq _brake __brake)) _brake)
  (:steering
   (&optional __steering)
   (if __steering (setq _steering __steering)) _steering)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:acceleration
   (&optional __acceleration)
   (if __acceleration (setq _acceleration __acceleration)) _acceleration)
  (:gear_cmd
   (&optional __gear_cmd)
   (if __gear_cmd (setq _gear_cmd __gear_cmd)) _gear_cmd)
  (:serialization-length
   ()
   (+
    ;; int32 _longlCmdType
    4
    ;; float64 _accel
    8
    ;; float64 _brake
    8
    ;; float64 _steering
    8
    ;; float64 _velocity
    8
    ;; float64 _acceleration
    8
    ;; int32 _gear_cmd
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _longlCmdType
       (write-long _longlCmdType s)
     ;; float64 _accel
       (sys::poke _accel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _brake
       (sys::poke _brake (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _steering
       (sys::poke _steering (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _acceleration
       (sys::poke _acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _gear_cmd
       (write-long _gear_cmd s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _longlCmdType
     (setq _longlCmdType (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _accel
     (setq _accel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _brake
     (setq _brake (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _steering
     (setq _steering (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _acceleration
     (setq _acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _gear_cmd
     (setq _gear_cmd (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get cbnu_msgs::VehicleCmd :md5sum-) "bc5dabc414df130ec3a9ba0a4c5344ce")
(setf (get cbnu_msgs::VehicleCmd :datatype-) "cbnu_msgs/VehicleCmd")
(setf (get cbnu_msgs::VehicleCmd :definition-)
      "int32 longlCmdType
float64 accel
float64 brake
float64 steering
float64 velocity
float64 acceleration
int32 gear_cmd




")



(provide :cbnu_msgs/VehicleCmd "bc5dabc414df130ec3a9ba0a4c5344ce")


