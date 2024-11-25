; Auto-generated. Do not edit!


(cl:in-package cbnu_msgs-msg)


;//! \htmlinclude AllObjectsData.msg.html

(cl:defclass <AllObjectsData> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (object_data_array
    :reader object_data_array
    :initarg :object_data_array
    :type (cl:vector cbnu_msgs-msg:AnObjectData)
   :initform (cl:make-array 0 :element-type 'cbnu_msgs-msg:AnObjectData :initial-element (cl:make-instance 'cbnu_msgs-msg:AnObjectData)))
   (num_car
    :reader num_car
    :initarg :num_car
    :type cl:fixnum
    :initform 0)
   (num_person
    :reader num_person
    :initarg :num_person
    :type cl:fixnum
    :initform 0))
)

(cl:defclass AllObjectsData (<AllObjectsData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AllObjectsData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AllObjectsData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cbnu_msgs-msg:<AllObjectsData> is deprecated: use cbnu_msgs-msg:AllObjectsData instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AllObjectsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cbnu_msgs-msg:header-val is deprecated.  Use cbnu_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'object_data_array-val :lambda-list '(m))
(cl:defmethod object_data_array-val ((m <AllObjectsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cbnu_msgs-msg:object_data_array-val is deprecated.  Use cbnu_msgs-msg:object_data_array instead.")
  (object_data_array m))

(cl:ensure-generic-function 'num_car-val :lambda-list '(m))
(cl:defmethod num_car-val ((m <AllObjectsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cbnu_msgs-msg:num_car-val is deprecated.  Use cbnu_msgs-msg:num_car instead.")
  (num_car m))

(cl:ensure-generic-function 'num_person-val :lambda-list '(m))
(cl:defmethod num_person-val ((m <AllObjectsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cbnu_msgs-msg:num_person-val is deprecated.  Use cbnu_msgs-msg:num_person instead.")
  (num_person m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AllObjectsData>) ostream)
  "Serializes a message object of type '<AllObjectsData>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'object_data_array))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'object_data_array))
  (cl:let* ((signed (cl:slot-value msg 'num_car)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'num_person)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AllObjectsData>) istream)
  "Deserializes a message object of type '<AllObjectsData>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'object_data_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'object_data_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cbnu_msgs-msg:AnObjectData))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_car) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_person) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AllObjectsData>)))
  "Returns string type for a message object of type '<AllObjectsData>"
  "cbnu_msgs/AllObjectsData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AllObjectsData)))
  "Returns string type for a message object of type 'AllObjectsData"
  "cbnu_msgs/AllObjectsData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AllObjectsData>)))
  "Returns md5sum for a message object of type '<AllObjectsData>"
  "ab8058e85871d4149538347822e71fe4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AllObjectsData)))
  "Returns md5sum for a message object of type 'AllObjectsData"
  "ab8058e85871d4149538347822e71fe4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AllObjectsData>)))
  "Returns full string definition for message of type '<AllObjectsData>"
  (cl:format cl:nil "Header header~%AnObjectData[] object_data_array~%int8 num_car~%int8 num_person~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: cbnu_msgs/AnObjectData~%string object_type~%float32 rel_pos_x~%float32 rel_pos_y~%float32 global_pos_lat~%float32 global_pos_lon~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AllObjectsData)))
  "Returns full string definition for message of type 'AllObjectsData"
  (cl:format cl:nil "Header header~%AnObjectData[] object_data_array~%int8 num_car~%int8 num_person~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: cbnu_msgs/AnObjectData~%string object_type~%float32 rel_pos_x~%float32 rel_pos_y~%float32 global_pos_lat~%float32 global_pos_lon~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AllObjectsData>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'object_data_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AllObjectsData>))
  "Converts a ROS message object to a list"
  (cl:list 'AllObjectsData
    (cl:cons ':header (header msg))
    (cl:cons ':object_data_array (object_data_array msg))
    (cl:cons ':num_car (num_car msg))
    (cl:cons ':num_person (num_person msg))
))
