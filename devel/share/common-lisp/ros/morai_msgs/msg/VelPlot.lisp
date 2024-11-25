; Auto-generated. Do not edit!


(cl:in-package morai_msgs-msg)


;//! \htmlinclude VelPlot.msg.html

(cl:defclass <VelPlot> (roslisp-msg-protocol:ros-message)
  ((target_vel
    :reader target_vel
    :initarg :target_vel
    :type cl:float
    :initform 0.0)
   (current_vel
    :reader current_vel
    :initarg :current_vel
    :type cl:float
    :initform 0.0))
)

(cl:defclass VelPlot (<VelPlot>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VelPlot>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VelPlot)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name morai_msgs-msg:<VelPlot> is deprecated: use morai_msgs-msg:VelPlot instead.")))

(cl:ensure-generic-function 'target_vel-val :lambda-list '(m))
(cl:defmethod target_vel-val ((m <VelPlot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:target_vel-val is deprecated.  Use morai_msgs-msg:target_vel instead.")
  (target_vel m))

(cl:ensure-generic-function 'current_vel-val :lambda-list '(m))
(cl:defmethod current_vel-val ((m <VelPlot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:current_vel-val is deprecated.  Use morai_msgs-msg:current_vel instead.")
  (current_vel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VelPlot>) ostream)
  "Serializes a message object of type '<VelPlot>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'target_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'current_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VelPlot>) istream)
  "Deserializes a message object of type '<VelPlot>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_vel) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'current_vel) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VelPlot>)))
  "Returns string type for a message object of type '<VelPlot>"
  "morai_msgs/VelPlot")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VelPlot)))
  "Returns string type for a message object of type 'VelPlot"
  "morai_msgs/VelPlot")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VelPlot>)))
  "Returns md5sum for a message object of type '<VelPlot>"
  "f5a3e50e6c7d121a90051a8b33f0ba8d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VelPlot)))
  "Returns md5sum for a message object of type 'VelPlot"
  "f5a3e50e6c7d121a90051a8b33f0ba8d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VelPlot>)))
  "Returns full string definition for message of type '<VelPlot>"
  (cl:format cl:nil "float64 target_vel~%float64 current_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VelPlot)))
  "Returns full string definition for message of type 'VelPlot"
  (cl:format cl:nil "float64 target_vel~%float64 current_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VelPlot>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VelPlot>))
  "Converts a ROS message object to a list"
  (cl:list 'VelPlot
    (cl:cons ':target_vel (target_vel msg))
    (cl:cons ':current_vel (current_vel msg))
))
