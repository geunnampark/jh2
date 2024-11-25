;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::SVehicleStatus)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'SVehicleStatus (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::SVEHICLESTATUS")
  (make-package "MORAI_MSGS::SVEHICLESTATUS"))

(in-package "ROS")
;;//! \htmlinclude SVehicleStatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass morai_msgs::SVehicleStatus
  :super ros::object
  :slots (_header _vehicle_num _pose_x _pose_y _pose_z _heading _velocity ))

(defmethod morai_msgs::SVehicleStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:vehicle_num __vehicle_num) 0)
    ((:pose_x __pose_x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pose_y __pose_y) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pose_z __pose_z) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:heading __heading) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:velocity __velocity) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _vehicle_num (round __vehicle_num))
   (setq _pose_x __pose_x)
   (setq _pose_y __pose_y)
   (setq _pose_z __pose_z)
   (setq _heading __heading)
   (setq _velocity __velocity)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:vehicle_num
   (&optional __vehicle_num)
   (if __vehicle_num (setq _vehicle_num __vehicle_num)) _vehicle_num)
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
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int16 _vehicle_num
    2
    ;; float64[] _pose_x
    (* 8    (length _pose_x)) 4
    ;; float64[] _pose_y
    (* 8    (length _pose_y)) 4
    ;; float64[] _pose_z
    (* 8    (length _pose_z)) 4
    ;; float64[] _heading
    (* 8    (length _heading)) 4
    ;; float64[] _velocity
    (* 8    (length _velocity)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int16 _vehicle_num
       (write-word _vehicle_num s)
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
   ;; int16 _vehicle_num
     (setq _vehicle_num (sys::peek buf ptr- :short)) (incf ptr- 2)
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

(setf (get morai_msgs::SVehicleStatus :md5sum-) "c5761b53523289f5262479d10b4bbf7c")
(setf (get morai_msgs::SVehicleStatus :datatype-) "morai_msgs/SVehicleStatus")
(setf (get morai_msgs::SVehicleStatus :definition-)
      "Header header
int16 vehicle_num
float64[] pose_x
float64[] pose_y
float64[] pose_z
float64[] heading
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



(provide :morai_msgs/SVehicleStatus "c5761b53523289f5262479d10b4bbf7c")


