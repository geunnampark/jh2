; Auto-generated. Do not edit!


(cl:in-package morai_msgs-msg)


;//! \htmlinclude FactoryAddress.msg.html

(cl:defclass <FactoryAddress> (roslisp-msg-protocol:ros-message)
  ((factory_addr_row
    :reader factory_addr_row
    :initarg :factory_addr_row
    :type cl:integer
    :initform 0)
   (factory_addr_col
    :reader factory_addr_col
    :initarg :factory_addr_col
    :type cl:integer
    :initform 0)
   (mission_index
    :reader mission_index
    :initarg :mission_index
    :type cl:integer
    :initform 0))
)

(cl:defclass FactoryAddress (<FactoryAddress>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FactoryAddress>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FactoryAddress)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name morai_msgs-msg:<FactoryAddress> is deprecated: use morai_msgs-msg:FactoryAddress instead.")))

(cl:ensure-generic-function 'factory_addr_row-val :lambda-list '(m))
(cl:defmethod factory_addr_row-val ((m <FactoryAddress>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:factory_addr_row-val is deprecated.  Use morai_msgs-msg:factory_addr_row instead.")
  (factory_addr_row m))

(cl:ensure-generic-function 'factory_addr_col-val :lambda-list '(m))
(cl:defmethod factory_addr_col-val ((m <FactoryAddress>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:factory_addr_col-val is deprecated.  Use morai_msgs-msg:factory_addr_col instead.")
  (factory_addr_col m))

(cl:ensure-generic-function 'mission_index-val :lambda-list '(m))
(cl:defmethod mission_index-val ((m <FactoryAddress>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:mission_index-val is deprecated.  Use morai_msgs-msg:mission_index instead.")
  (mission_index m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FactoryAddress>) ostream)
  "Serializes a message object of type '<FactoryAddress>"
  (cl:let* ((signed (cl:slot-value msg 'factory_addr_row)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'factory_addr_col)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'mission_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FactoryAddress>) istream)
  "Deserializes a message object of type '<FactoryAddress>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'factory_addr_row) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'factory_addr_col) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mission_index) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FactoryAddress>)))
  "Returns string type for a message object of type '<FactoryAddress>"
  "morai_msgs/FactoryAddress")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FactoryAddress)))
  "Returns string type for a message object of type 'FactoryAddress"
  "morai_msgs/FactoryAddress")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FactoryAddress>)))
  "Returns md5sum for a message object of type '<FactoryAddress>"
  "3a5097aee45ce9c14e33f6cc877af060")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FactoryAddress)))
  "Returns md5sum for a message object of type 'FactoryAddress"
  "3a5097aee45ce9c14e33f6cc877af060")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FactoryAddress>)))
  "Returns full string definition for message of type '<FactoryAddress>"
  (cl:format cl:nil "int32 factory_addr_row~%int32 factory_addr_col~%~%int32 mission_index~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FactoryAddress)))
  "Returns full string definition for message of type 'FactoryAddress"
  (cl:format cl:nil "int32 factory_addr_row~%int32 factory_addr_col~%~%int32 mission_index~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FactoryAddress>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FactoryAddress>))
  "Converts a ROS message object to a list"
  (cl:list 'FactoryAddress
    (cl:cons ':factory_addr_row (factory_addr_row msg))
    (cl:cons ':factory_addr_col (factory_addr_col msg))
    (cl:cons ':mission_index (mission_index msg))
))
