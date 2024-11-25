;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::VehicleCommand)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'VehicleCommand (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::VEHICLECOMMAND")
  (make-package "MORAI_MSGS::VEHICLECOMMAND"))

(in-package "ROS")
;;//! \htmlinclude VehicleCommand.msg.html


(defclass morai_msgs::VehicleCommand
  :super ros::object
  :slots (_mode _accel _brake _acceleration _steering_angle ))

(defmethod morai_msgs::VehicleCommand
  (:init
   (&key
    ((:mode __mode) 0)
    ((:accel __accel) 0.0)
    ((:brake __brake) 0.0)
    ((:acceleration __acceleration) 0.0)
    ((:steering_angle __steering_angle) 0.0)
    )
   (send-super :init)
   (setq _mode (round __mode))
   (setq _accel (float __accel))
   (setq _brake (float __brake))
   (setq _acceleration (float __acceleration))
   (setq _steering_angle (float __steering_angle))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:accel
   (&optional __accel)
   (if __accel (setq _accel __accel)) _accel)
  (:brake
   (&optional __brake)
   (if __brake (setq _brake __brake)) _brake)
  (:acceleration
   (&optional __acceleration)
   (if __acceleration (setq _acceleration __acceleration)) _acceleration)
  (:steering_angle
   (&optional __steering_angle)
   (if __steering_angle (setq _steering_angle __steering_angle)) _steering_angle)
  (:serialization-length
   ()
   (+
    ;; int32 _mode
    4
    ;; float64 _accel
    8
    ;; float64 _brake
    8
    ;; float64 _acceleration
    8
    ;; float64 _steering_angle
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _mode
       (write-long _mode s)
     ;; float64 _accel
       (sys::poke _accel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _brake
       (sys::poke _brake (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _acceleration
       (sys::poke _acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _steering_angle
       (sys::poke _steering_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _mode
     (setq _mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _accel
     (setq _accel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _brake
     (setq _brake (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _acceleration
     (setq _acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _steering_angle
     (setq _steering_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get morai_msgs::VehicleCommand :md5sum-) "a1965816c5fabf849455061a99d17c29")
(setf (get morai_msgs::VehicleCommand :datatype-) "morai_msgs/VehicleCommand")
(setf (get morai_msgs::VehicleCommand :definition-)
      "int32 mode
float64 accel
float64 brake
float64 acceleration
float64 steering_angle

")



(provide :morai_msgs/VehicleCommand "a1965816c5fabf849455061a99d17c29")


