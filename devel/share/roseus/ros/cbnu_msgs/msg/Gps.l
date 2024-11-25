;; Auto-generated. Do not edit!


(when (boundp 'cbnu_msgs::Gps)
  (if (not (find-package "CBNU_MSGS"))
    (make-package "CBNU_MSGS"))
  (shadow 'Gps (find-package "CBNU_MSGS")))
(unless (find-package "CBNU_MSGS::GPS")
  (make-package "CBNU_MSGS::GPS"))

(in-package "ROS")
;;//! \htmlinclude Gps.msg.html


(defclass cbnu_msgs::Gps
  :super ros::object
  :slots (_pos_lat _pos_long _heading _time ))

(defmethod cbnu_msgs::Gps
  (:init
   (&key
    ((:pos_lat __pos_lat) 0.0)
    ((:pos_long __pos_long) 0.0)
    ((:heading __heading) 0.0)
    ((:time __time) (instance ros::time :init))
    )
   (send-super :init)
   (setq _pos_lat (float __pos_lat))
   (setq _pos_long (float __pos_long))
   (setq _heading (float __heading))
   (setq _time __time)
   self)
  (:pos_lat
   (&optional __pos_lat)
   (if __pos_lat (setq _pos_lat __pos_lat)) _pos_lat)
  (:pos_long
   (&optional __pos_long)
   (if __pos_long (setq _pos_long __pos_long)) _pos_long)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:serialization-length
   ()
   (+
    ;; float32 _pos_lat
    4
    ;; float32 _pos_long
    4
    ;; float32 _heading
    4
    ;; time _time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _pos_lat
       (sys::poke _pos_lat (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pos_long
       (sys::poke _pos_long (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; time _time
       (write-long (send _time :sec) s) (write-long (send _time :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _pos_lat
     (setq _pos_lat (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pos_long
     (setq _pos_long (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _heading
     (setq _heading (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; time _time
     (send _time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get cbnu_msgs::Gps :md5sum-) "f291b40ae5c9f111db04d93e1694b68b")
(setf (get cbnu_msgs::Gps :datatype-) "cbnu_msgs/Gps")
(setf (get cbnu_msgs::Gps :definition-)
      "float32 pos_lat
float32 pos_long
float32 heading
time time


")



(provide :cbnu_msgs/Gps "f291b40ae5c9f111db04d93e1694b68b")


