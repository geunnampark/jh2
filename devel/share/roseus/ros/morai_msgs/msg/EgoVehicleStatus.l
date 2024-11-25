;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::EgoVehicleStatus)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'EgoVehicleStatus (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::EGOVEHICLESTATUS")
  (make-package "MORAI_MSGS::EGOVEHICLESTATUS"))

(in-package "ROS")
;;//! \htmlinclude EgoVehicleStatus.msg.html


(defclass morai_msgs::EgoVehicleStatus
  :super ros::object
  :slots (_pose_x _pose_y _pose_z _heading _velocity ))

(defmethod morai_msgs::EgoVehicleStatus
  (:init
   (&key
    ((:pose_x __pose_x) 0.0)
    ((:pose_y __pose_y) 0.0)
    ((:pose_z __pose_z) 0.0)
    ((:heading __heading) 0.0)
    ((:velocity __velocity) 0.0)
    )
   (send-super :init)
   (setq _pose_x (float __pose_x))
   (setq _pose_y (float __pose_y))
   (setq _pose_z (float __pose_z))
   (setq _heading (float __heading))
   (setq _velocity (float __velocity))
   self)
  (:pose_x
   (&optional __pose_x)
   (if __pose_x (setq _pose_x __pose_x)) _pose_x)
  (:pose_y
   (&optional __pose_y)
   (if __pose_y (setq _pose_y __pose_y)) _pose_y)
  (:pose_z
   (&optional __pose_z)
   (if __pose_z (setq _pose_z __pose_z)) _pose_z)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:serialization-length
   ()
   (+
    ;; float64 _pose_x
    8
    ;; float64 _pose_y
    8
    ;; float64 _pose_z
    8
    ;; float64 _heading
    8
    ;; float64 _velocity
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _pose_x
       (sys::poke _pose_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pose_y
       (sys::poke _pose_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pose_z
       (sys::poke _pose_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _pose_x
     (setq _pose_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pose_y
     (setq _pose_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pose_z
     (setq _pose_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _heading
     (setq _heading (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get morai_msgs::EgoVehicleStatus :md5sum-) "6c83b1d1a60dcab36fb22e0cc1f8f2aa")
(setf (get morai_msgs::EgoVehicleStatus :datatype-) "morai_msgs/EgoVehicleStatus")
(setf (get morai_msgs::EgoVehicleStatus :definition-)
      "float64 pose_x
float64 pose_y
float64 pose_z
float64 heading
float64 velocity


")



(provide :morai_msgs/EgoVehicleStatus "6c83b1d1a60dcab36fb22e0cc1f8f2aa")


