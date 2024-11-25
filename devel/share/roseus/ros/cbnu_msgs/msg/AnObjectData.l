;; Auto-generated. Do not edit!


(when (boundp 'cbnu_msgs::AnObjectData)
  (if (not (find-package "CBNU_MSGS"))
    (make-package "CBNU_MSGS"))
  (shadow 'AnObjectData (find-package "CBNU_MSGS")))
(unless (find-package "CBNU_MSGS::ANOBJECTDATA")
  (make-package "CBNU_MSGS::ANOBJECTDATA"))

(in-package "ROS")
;;//! \htmlinclude AnObjectData.msg.html


(defclass cbnu_msgs::AnObjectData
  :super ros::object
  :slots (_object_type _rel_pos_x _rel_pos_y _global_pos_lat _global_pos_lon ))

(defmethod cbnu_msgs::AnObjectData
  (:init
   (&key
    ((:object_type __object_type) "")
    ((:rel_pos_x __rel_pos_x) 0.0)
    ((:rel_pos_y __rel_pos_y) 0.0)
    ((:global_pos_lat __global_pos_lat) 0.0)
    ((:global_pos_lon __global_pos_lon) 0.0)
    )
   (send-super :init)
   (setq _object_type (string __object_type))
   (setq _rel_pos_x (float __rel_pos_x))
   (setq _rel_pos_y (float __rel_pos_y))
   (setq _global_pos_lat (float __global_pos_lat))
   (setq _global_pos_lon (float __global_pos_lon))
   self)
  (:object_type
   (&optional __object_type)
   (if __object_type (setq _object_type __object_type)) _object_type)
  (:rel_pos_x
   (&optional __rel_pos_x)
   (if __rel_pos_x (setq _rel_pos_x __rel_pos_x)) _rel_pos_x)
  (:rel_pos_y
   (&optional __rel_pos_y)
   (if __rel_pos_y (setq _rel_pos_y __rel_pos_y)) _rel_pos_y)
  (:global_pos_lat
   (&optional __global_pos_lat)
   (if __global_pos_lat (setq _global_pos_lat __global_pos_lat)) _global_pos_lat)
  (:global_pos_lon
   (&optional __global_pos_lon)
   (if __global_pos_lon (setq _global_pos_lon __global_pos_lon)) _global_pos_lon)
  (:serialization-length
   ()
   (+
    ;; string _object_type
    4 (length _object_type)
    ;; float32 _rel_pos_x
    4
    ;; float32 _rel_pos_y
    4
    ;; float32 _global_pos_lat
    4
    ;; float32 _global_pos_lon
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _object_type
       (write-long (length _object_type) s) (princ _object_type s)
     ;; float32 _rel_pos_x
       (sys::poke _rel_pos_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rel_pos_y
       (sys::poke _rel_pos_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _global_pos_lat
       (sys::poke _global_pos_lat (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _global_pos_lon
       (sys::poke _global_pos_lon (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _object_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _object_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _rel_pos_x
     (setq _rel_pos_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rel_pos_y
     (setq _rel_pos_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _global_pos_lat
     (setq _global_pos_lat (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _global_pos_lon
     (setq _global_pos_lon (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get cbnu_msgs::AnObjectData :md5sum-) "f64d9f4ae123fec27fe26952d0c80dfc")
(setf (get cbnu_msgs::AnObjectData :datatype-) "cbnu_msgs/AnObjectData")
(setf (get cbnu_msgs::AnObjectData :definition-)
      "string object_type
float32 rel_pos_x
float32 rel_pos_y
float32 global_pos_lat
float32 global_pos_lon

")



(provide :cbnu_msgs/AnObjectData "f64d9f4ae123fec27fe26952d0c80dfc")


