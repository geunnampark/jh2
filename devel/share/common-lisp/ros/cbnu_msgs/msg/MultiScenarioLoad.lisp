; Auto-generated. Do not edit!


(cl:in-package cbnu_msgs-msg)


;//! \htmlinclude MultiScenarioLoad.msg.html

(cl:defclass <MultiScenarioLoad> (roslisp-msg-protocol:ros-message)
  ((file_name
    :reader file_name
    :initarg :file_name
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (load_ego_vehicle_data
    :reader load_ego_vehicle_data
    :initarg :load_ego_vehicle_data
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil))
   (load_surrounding_vehicle_data
    :reader load_surrounding_vehicle_data
    :initarg :load_surrounding_vehicle_data
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil))
   (load_pedestrian_data
    :reader load_pedestrian_data
    :initarg :load_pedestrian_data
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil))
   (load_object_data
    :reader load_object_data
    :initarg :load_object_data
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass MultiScenarioLoad (<MultiScenarioLoad>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MultiScenarioLoad>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MultiScenarioLoad)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cbnu_msgs-msg:<MultiScenarioLoad> is deprecated: use cbnu_msgs-msg:MultiScenarioLoad instead.")))

(cl:ensure-generic-function 'file_name-val :lambda-list '(m))
(cl:defmethod file_name-val ((m <MultiScenarioLoad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cbnu_msgs-msg:file_name-val is deprecated.  Use cbnu_msgs-msg:file_name instead.")
  (file_name m))

(cl:ensure-generic-function 'load_ego_vehicle_data-val :lambda-list '(m))
(cl:defmethod load_ego_vehicle_data-val ((m <MultiScenarioLoad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cbnu_msgs-msg:load_ego_vehicle_data-val is deprecated.  Use cbnu_msgs-msg:load_ego_vehicle_data instead.")
  (load_ego_vehicle_data m))

(cl:ensure-generic-function 'load_surrounding_vehicle_data-val :lambda-list '(m))
(cl:defmethod load_surrounding_vehicle_data-val ((m <MultiScenarioLoad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cbnu_msgs-msg:load_surrounding_vehicle_data-val is deprecated.  Use cbnu_msgs-msg:load_surrounding_vehicle_data instead.")
  (load_surrounding_vehicle_data m))

(cl:ensure-generic-function 'load_pedestrian_data-val :lambda-list '(m))
(cl:defmethod load_pedestrian_data-val ((m <MultiScenarioLoad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cbnu_msgs-msg:load_pedestrian_data-val is deprecated.  Use cbnu_msgs-msg:load_pedestrian_data instead.")
  (load_pedestrian_data m))

(cl:ensure-generic-function 'load_object_data-val :lambda-list '(m))
(cl:defmethod load_object_data-val ((m <MultiScenarioLoad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cbnu_msgs-msg:load_object_data-val is deprecated.  Use cbnu_msgs-msg:load_object_data instead.")
  (load_object_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MultiScenarioLoad>) ostream)
  "Serializes a message object of type '<MultiScenarioLoad>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'file_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'file_name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'load_ego_vehicle_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'load_ego_vehicle_data))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'load_surrounding_vehicle_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'load_surrounding_vehicle_data))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'load_pedestrian_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'load_pedestrian_data))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'load_object_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'load_object_data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MultiScenarioLoad>) istream)
  "Deserializes a message object of type '<MultiScenarioLoad>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'file_name) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'file_name)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'load_ego_vehicle_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'load_ego_vehicle_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'load_surrounding_vehicle_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'load_surrounding_vehicle_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'load_pedestrian_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'load_pedestrian_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'load_object_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'load_object_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MultiScenarioLoad>)))
  "Returns string type for a message object of type '<MultiScenarioLoad>"
  "cbnu_msgs/MultiScenarioLoad")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MultiScenarioLoad)))
  "Returns string type for a message object of type 'MultiScenarioLoad"
  "cbnu_msgs/MultiScenarioLoad")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MultiScenarioLoad>)))
  "Returns md5sum for a message object of type '<MultiScenarioLoad>"
  "72663bbaba4c22d9e77ddf06c9dac39c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MultiScenarioLoad)))
  "Returns md5sum for a message object of type 'MultiScenarioLoad"
  "72663bbaba4c22d9e77ddf06c9dac39c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MultiScenarioLoad>)))
  "Returns full string definition for message of type '<MultiScenarioLoad>"
  (cl:format cl:nil "string[] file_name~%bool[] load_ego_vehicle_data~%bool[] load_surrounding_vehicle_data~%bool[] load_pedestrian_data~%bool[] load_object_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MultiScenarioLoad)))
  "Returns full string definition for message of type 'MultiScenarioLoad"
  (cl:format cl:nil "string[] file_name~%bool[] load_ego_vehicle_data~%bool[] load_surrounding_vehicle_data~%bool[] load_pedestrian_data~%bool[] load_object_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MultiScenarioLoad>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'file_name) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'load_ego_vehicle_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'load_surrounding_vehicle_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'load_pedestrian_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'load_object_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MultiScenarioLoad>))
  "Converts a ROS message object to a list"
  (cl:list 'MultiScenarioLoad
    (cl:cons ':file_name (file_name msg))
    (cl:cons ':load_ego_vehicle_data (load_ego_vehicle_data msg))
    (cl:cons ':load_surrounding_vehicle_data (load_surrounding_vehicle_data msg))
    (cl:cons ':load_pedestrian_data (load_pedestrian_data msg))
    (cl:cons ':load_object_data (load_object_data msg))
))
