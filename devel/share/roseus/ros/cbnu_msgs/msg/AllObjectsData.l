;; Auto-generated. Do not edit!


(when (boundp 'cbnu_msgs::AllObjectsData)
  (if (not (find-package "CBNU_MSGS"))
    (make-package "CBNU_MSGS"))
  (shadow 'AllObjectsData (find-package "CBNU_MSGS")))
(unless (find-package "CBNU_MSGS::ALLOBJECTSDATA")
  (make-package "CBNU_MSGS::ALLOBJECTSDATA"))

(in-package "ROS")
;;//! \htmlinclude AllObjectsData.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass cbnu_msgs::AllObjectsData
  :super ros::object
  :slots (_header _object_data_array _num_car _num_person ))

(defmethod cbnu_msgs::AllObjectsData
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:object_data_array __object_data_array) (let (r) (dotimes (i 0) (push (instance cbnu_msgs::AnObjectData :init) r)) r))
    ((:num_car __num_car) 0)
    ((:num_person __num_person) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _object_data_array __object_data_array)
   (setq _num_car (round __num_car))
   (setq _num_person (round __num_person))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:object_data_array
   (&rest __object_data_array)
   (if (keywordp (car __object_data_array))
       (send* _object_data_array __object_data_array)
     (progn
       (if __object_data_array (setq _object_data_array (car __object_data_array)))
       _object_data_array)))
  (:num_car
   (&optional __num_car)
   (if __num_car (setq _num_car __num_car)) _num_car)
  (:num_person
   (&optional __num_person)
   (if __num_person (setq _num_person __num_person)) _num_person)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; cbnu_msgs/AnObjectData[] _object_data_array
    (apply #'+ (send-all _object_data_array :serialization-length)) 4
    ;; int8 _num_car
    1
    ;; int8 _num_person
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; cbnu_msgs/AnObjectData[] _object_data_array
     (write-long (length _object_data_array) s)
     (dolist (elem _object_data_array)
       (send elem :serialize s)
       )
     ;; int8 _num_car
       (write-byte _num_car s)
     ;; int8 _num_person
       (write-byte _num_person s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; cbnu_msgs/AnObjectData[] _object_data_array
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _object_data_array (let (r) (dotimes (i n) (push (instance cbnu_msgs::AnObjectData :init) r)) r))
     (dolist (elem- _object_data_array)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int8 _num_car
     (setq _num_car (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _num_car 127) (setq _num_car (- _num_car 256)))
   ;; int8 _num_person
     (setq _num_person (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _num_person 127) (setq _num_person (- _num_person 256)))
   ;;
   self)
  )

(setf (get cbnu_msgs::AllObjectsData :md5sum-) "ab8058e85871d4149538347822e71fe4")
(setf (get cbnu_msgs::AllObjectsData :datatype-) "cbnu_msgs/AllObjectsData")
(setf (get cbnu_msgs::AllObjectsData :definition-)
      "Header header
AnObjectData[] object_data_array
int8 num_car
int8 num_person

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: cbnu_msgs/AnObjectData
string object_type
float32 rel_pos_x
float32 rel_pos_y
float32 global_pos_lat
float32 global_pos_lon

")



(provide :cbnu_msgs/AllObjectsData "ab8058e85871d4149538347822e71fe4")


