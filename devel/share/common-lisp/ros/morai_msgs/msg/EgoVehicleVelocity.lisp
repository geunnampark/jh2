; Auto-generated. Do not edit!


(cl:in-package morai_msgs-msg)


;//! \htmlinclude EgoVehicleVelocity.msg.html

(cl:defclass <EgoVehicleVelocity> (roslisp-msg-protocol:ros-message)
  ((velocity
    :reader velocity
    :initarg :velocity
    :type cl:float
    :initform 0.0))
)

(cl:defclass EgoVehicleVelocity (<EgoVehicleVelocity>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EgoVehicleVelocity>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EgoVehicleVelocity)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name morai_msgs-msg:<EgoVehicleVelocity> is deprecated: use morai_msgs-msg:EgoVehicleVelocity instead.")))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <EgoVehicleVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:velocity-val is deprecated.  Use morai_msgs-msg:velocity instead.")
  (velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EgoVehicleVelocity>) ostream)
  "Serializes a message object of type '<EgoVehicleVelocity>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EgoVehicleVelocity>) istream)
  "Deserializes a message object of type '<EgoVehicleVelocity>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EgoVehicleVelocity>)))
  "Returns string type for a message object of type '<EgoVehicleVelocity>"
  "morai_msgs/EgoVehicleVelocity")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EgoVehicleVelocity)))
  "Returns string type for a message object of type 'EgoVehicleVelocity"
  "morai_msgs/EgoVehicleVelocity")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EgoVehicleVelocity>)))
  "Returns md5sum for a message object of type '<EgoVehicleVelocity>"
  "6d3b2ef8452c2fe21adb709618d2518f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EgoVehicleVelocity)))
  "Returns md5sum for a message object of type 'EgoVehicleVelocity"
  "6d3b2ef8452c2fe21adb709618d2518f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EgoVehicleVelocity>)))
  "Returns full string definition for message of type '<EgoVehicleVelocity>"
  (cl:format cl:nil "float64 velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EgoVehicleVelocity)))
  "Returns full string definition for message of type 'EgoVehicleVelocity"
  (cl:format cl:nil "float64 velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EgoVehicleVelocity>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EgoVehicleVelocity>))
  "Converts a ROS message object to a list"
  (cl:list 'EgoVehicleVelocity
    (cl:cons ':velocity (velocity msg))
))
