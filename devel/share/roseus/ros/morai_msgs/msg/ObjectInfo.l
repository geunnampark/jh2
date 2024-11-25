;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::ObjectInfo)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'ObjectInfo (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::OBJECTINFO")
  (make-package "MORAI_MSGS::OBJECTINFO"))

(in-package "ROS")
;;//! \htmlinclude ObjectInfo.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass morai_msgs::ObjectInfo
  :super ros::object
  :slots (_header _num_of_objects _object_type _pose_x _pose_y _pose_z _heading _size_x _size_y _size_z _velocity ))

(defmethod morai_msgs::ObjectInfo
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:num_of_objects __num_of_objects) 0)
    ((:object_type __object_type) (make-array 0 :initial-element 0 :element-type :integer))
    ((:pose_x __pose_x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pose_y __pose_y) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pose_z __pose_z) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:heading __heading) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:size_x __size_x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:size_y __size_y) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:size_z __size_z) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:velocity __velocity) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _num_of_objects (round __num_of_objects))
   (setq _object_type __object_type)
   (setq _pose_x __pose_x)
   (setq _pose_y __pose_y)
   (setq _pose_z __pose_z)
   (setq _heading __heading)
   (setq _size_x __size_x)
   (setq _size_y __size_y)
   (setq _size_z __size_z)
   (setq _velocity __velocity)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:num_of_objects
   (&optional __num_of_objects)
   (if __num_of_objects (setq _num_of_objects __num_of_objects)) _num_of_objects)
  (:object_type
   (&optional __object_type)
   (if __object_type (setq _object_type __object_type)) _object_type)
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
  (:size_x
   (&optional __size_x)
   (if __size_x (setq _size_x __size_x)) _size_x)
  (:size_y
   (&optional __size_y)
   (if __size_y (setq _size_y __size_y)) _size_y)
  (:size_z
   (&optional __size_z)
   (if __size_z (setq _size_z __size_z)) _size_z)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _num_of_objects
    4
    ;; int16[] _object_type
    (* 2    (length _object_type)) 4
    ;; float64[] _pose_x
    (* 8    (length _pose_x)) 4
    ;; float64[] _pose_y
    (* 8    (length _pose_y)) 4
    ;; float64[] _pose_z
    (* 8    (length _pose_z)) 4
    ;; float64[] _heading
    (* 8    (length _heading)) 4
    ;; float64[] _size_x
    (* 8    (length _size_x)) 4
    ;; float64[] _size_y
    (* 8    (length _size_y)) 4
    ;; float64[] _size_z
    (* 8    (length _size_z)) 4
    ;; float64[] _velocity
    (* 8    (length _velocity)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _num_of_objects
       (write-long _num_of_objects s)
     ;; int16[] _object_type
     (write-long (length _object_type) s)
     (dotimes (i (length _object_type))
       (write-word (elt _object_type i) s)
       )
     ;; float64[] _pose_x
     (write-long (length _pose_x) s)
     (dotimes (i (length _pose_x))
       (sys::poke (elt _pose_x i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _pose_y
     (write-long (length _pose_y) s)
     (dotimes (i (length _pose_y))
       (sys::poke (elt _pose_y i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _pose_z
     (write-long (length _pose_z) s)
     (dotimes (i (length _pose_z))
       (sys::poke (elt _pose_z i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _heading
     (write-long (length _heading) s)
     (dotimes (i (length _heading))
       (sys::poke (elt _heading i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _size_x
     (write-long (length _size_x) s)
     (dotimes (i (length _size_x))
       (sys::poke (elt _size_x i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _size_y
     (write-long (length _size_y) s)
     (dotimes (i (length _size_y))
       (sys::poke (elt _size_y i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _size_z
     (write-long (length _size_z) s)
     (dotimes (i (length _size_z))
       (sys::poke (elt _size_z i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _velocity
     (write-long (length _velocity) s)
     (dotimes (i (length _velocity))
       (sys::poke (elt _velocity i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _num_of_objects
     (setq _num_of_objects (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int16[] _object_type
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _object_type (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _object_type i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; float64[] _pose_x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pose_x (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pose_x i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _pose_y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pose_y (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pose_y i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _pose_z
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pose_z (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pose_z i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _heading
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _heading (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _heading i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _size_x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _size_x (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _size_x i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _size_y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _size_y (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _size_y i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _size_z
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _size_z (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _size_z i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _velocity
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _velocity (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _velocity i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get morai_msgs::ObjectInfo :md5sum-) "544b34f9a8049dbcfd23f36a6d3ad887")
(setf (get morai_msgs::ObjectInfo :datatype-) "morai_msgs/ObjectInfo")
(setf (get morai_msgs::ObjectInfo :definition-)
      "Header header
int32 num_of_objects
int16[] object_type

float64[] pose_x
float64[] pose_y
float64[] pose_z

float64[] heading

float64[] size_x
float64[] size_y
float64[] size_z

float64[] velocity

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

")



(provide :morai_msgs/ObjectInfo "544b34f9a8049dbcfd23f36a6d3ad887")


