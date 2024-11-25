;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::EgoVehicleVelocity)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'EgoVehicleVelocity (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::EGOVEHICLEVELOCITY")
  (make-package "MORAI_MSGS::EGOVEHICLEVELOCITY"))

(in-package "ROS")
;;//! \htmlinclude EgoVehicleVelocity.msg.html


(defclass morai_msgs::EgoVehicleVelocity
  :super ros::object
  :slots (_velocity ))

(defmethod morai_msgs::EgoVehicleVelocity
  (:init
   (&key
    ((:velocity __velocity) 0.0)
    )
   (send-super :init)
   (setq _velocity (float __velocity))
   self)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:serialization-length
   ()
   (+
    ;; float64 _velocity
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get morai_msgs::EgoVehicleVelocity :md5sum-) "6d3b2ef8452c2fe21adb709618d2518f")
(setf (get morai_msgs::EgoVehicleVelocity :datatype-) "morai_msgs/EgoVehicleVelocity")
(setf (get morai_msgs::EgoVehicleVelocity :definition-)
      "float64 velocity

")



(provide :morai_msgs/EgoVehicleVelocity "6d3b2ef8452c2fe21adb709618d2518f")


