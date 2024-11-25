; Auto-generated. Do not edit!


(cl:in-package cbnu_msgs-msg)


;//! \htmlinclude AnObjectData.msg.html

(cl:defclass <AnObjectData> (roslisp-msg-protocol:ros-message)
  ((object_type
    :reader object_type
    :initarg :object_type
    :type cl:string
    :initform "")
   (rel_pos_x
    :reader rel_pos_x
    :initarg :rel_pos_x
    :type cl:float
    :initform 0.0)
   (rel_pos_y
    :reader rel_pos_y
    :initarg :rel_pos_y
    :type cl:float
    :initform 0.0)
   (global_pos_lat
    :reader global_pos_lat
    :initarg :global_pos_lat
    :type cl:float
    :initform 0.0)
   (global_pos_lon
    :reader global_pos_lon
    :initarg :global_pos_lon
    :type cl:float
    :initform 0.0))
)

(cl:defclass AnObjectData (<AnObjectData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AnObjectData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AnObjectData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cbnu_msgs-msg:<AnObjectData> is deprecated: use cbnu_msgs-msg:AnObjectData instead.")))

(cl:ensure-generic-function 'object_type-val :lambda-list '(m))
(cl:defmethod object_type-val ((m <AnObjectData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cbnu_msgs-msg:object_type-val is deprecated.  Use cbnu_msgs-msg:object_type instead.")
  (object_type m))

(cl:ensure-generic-function 'rel_pos_x-val :lambda-list '(m))
(cl:defmethod rel_pos_x-val ((m <AnObjectData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cbnu_msgs-msg:rel_pos_x-val is deprecated.  Use cbnu_msgs-msg:rel_pos_x instead.")
  (rel_pos_x m))

(cl:ensure-generic-function 'rel_pos_y-val :lambda-list '(m))
(cl:defmethod rel_pos_y-val ((m <AnObjectData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cbnu_msgs-msg:rel_pos_y-val is deprecated.  Use cbnu_msgs-msg:rel_pos_y instead.")
  (rel_pos_y m))

(cl:ensure-generic-function 'global_pos_lat-val :lambda-list '(m))
(cl:defmethod global_pos_lat-val ((m <AnObjectData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cbnu_msgs-msg:global_pos_lat-val is deprecated.  Use cbnu_msgs-msg:global_pos_lat instead.")
  (global_pos_lat m))

(cl:ensure-generic-function 'global_pos_lon-val :lambda-list '(m))
(cl:defmethod global_pos_lon-val ((m <AnObjectData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cbnu_msgs-msg:global_pos_lon-val is deprecated.  Use cbnu_msgs-msg:global_pos_lon instead.")
  (global_pos_lon m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AnObjectData>) ostream)
  "Serializes a message object of type '<AnObjectData>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'object_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'object_type))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rel_pos_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rel_pos_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'global_pos_lat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'global_pos_lon))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AnObjectData>) istream)
  "Deserializes a message object of type '<AnObjectData>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'object_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rel_pos_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rel_pos_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'global_pos_lat) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'global_pos_lon) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AnObjectData>)))
  "Returns string type for a message object of type '<AnObjectData>"
  "cbnu_msgs/AnObjectData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AnObjectData)))
  "Returns string type for a message object of type 'AnObjectData"
  "cbnu_msgs/AnObjectData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AnObjectData>)))
  "Returns md5sum for a message object of type '<AnObjectData>"
  "f64d9f4ae123fec27fe26952d0c80dfc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AnObjectData)))
  "Returns md5sum for a message object of type 'AnObjectData"
  "f64d9f4ae123fec27fe26952d0c80dfc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AnObjectData>)))
  "Returns full string definition for message of type '<AnObjectData>"
  (cl:format cl:nil "string object_type~%float32 rel_pos_x~%float32 rel_pos_y~%float32 global_pos_lat~%float32 global_pos_lon~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AnObjectData)))
  "Returns full string definition for message of type 'AnObjectData"
  (cl:format cl:nil "string object_type~%float32 rel_pos_x~%float32 rel_pos_y~%float32 global_pos_lat~%float32 global_pos_lon~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AnObjectData>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'object_type))
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AnObjectData>))
  "Converts a ROS message object to a list"
  (cl:list 'AnObjectData
    (cl:cons ':object_type (object_type msg))
    (cl:cons ':rel_pos_x (rel_pos_x msg))
    (cl:cons ':rel_pos_y (rel_pos_y msg))
    (cl:cons ':global_pos_lat (global_pos_lat msg))
    (cl:cons ':global_pos_lon (global_pos_lon msg))
))
