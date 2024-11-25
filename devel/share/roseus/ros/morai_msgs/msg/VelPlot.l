;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::VelPlot)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'VelPlot (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::VELPLOT")
  (make-package "MORAI_MSGS::VELPLOT"))

(in-package "ROS")
;;//! \htmlinclude VelPlot.msg.html


(defclass morai_msgs::VelPlot
  :super ros::object
  :slots (_target_vel _current_vel ))

(defmethod morai_msgs::VelPlot
  (:init
   (&key
    ((:target_vel __target_vel) 0.0)
    ((:current_vel __current_vel) 0.0)
    )
   (send-super :init)
   (setq _target_vel (float __target_vel))
   (setq _current_vel (float __current_vel))
   self)
  (:target_vel
   (&optional __target_vel)
   (if __target_vel (setq _target_vel __target_vel)) _target_vel)
  (:current_vel
   (&optional __current_vel)
   (if __current_vel (setq _current_vel __current_vel)) _current_vel)
  (:serialization-length
   ()
   (+
    ;; float64 _target_vel
    8
    ;; float64 _current_vel
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _target_vel
       (sys::poke _target_vel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _current_vel
       (sys::poke _current_vel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _target_vel
     (setq _target_vel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _current_vel
     (setq _current_vel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get morai_msgs::VelPlot :md5sum-) "f5a3e50e6c7d121a90051a8b33f0ba8d")
(setf (get morai_msgs::VelPlot :datatype-) "morai_msgs/VelPlot")
(setf (get morai_msgs::VelPlot :definition-)
      "float64 target_vel
float64 current_vel

")



(provide :morai_msgs/VelPlot "f5a3e50e6c7d121a90051a8b33f0ba8d")


