;; Auto-generated. Do not edit!


(when (boundp 'cbnu_msgs::VehicleTlm)
  (if (not (find-package "CBNU_MSGS"))
    (make-package "CBNU_MSGS"))
  (shadow 'VehicleTlm (find-package "CBNU_MSGS")))
(unless (find-package "CBNU_MSGS::VEHICLETLM")
  (make-package "CBNU_MSGS::VEHICLETLM"))

(in-package "ROS")
;;//! \htmlinclude VehicleTlm.msg.html


(defclass cbnu_msgs::VehicleTlm
  :super ros::object
  :slots (_ned_latitude _ned_longitude _ned_heading _speed _steering_angle _steering_angular_velocity _wheel_velocity_fl _wheel_velocity_fr _wheel_velocity_rl _wheel_velocity_rr _wheel_size_fl _wheel_size_fr _wheel_size_rl _wheel_size_rr _acceleration_left _acceleration_forward _roll _pitch _yaw _wheel_base _curb_weight ))

(defmethod cbnu_msgs::VehicleTlm
  (:init
   (&key
    ((:ned_latitude __ned_latitude) 0.0)
    ((:ned_longitude __ned_longitude) 0.0)
    ((:ned_heading __ned_heading) 0.0)
    ((:speed __speed) 0.0)
    ((:steering_angle __steering_angle) 0.0)
    ((:steering_angular_velocity __steering_angular_velocity) 0.0)
    ((:wheel_velocity_fl __wheel_velocity_fl) 0.0)
    ((:wheel_velocity_fr __wheel_velocity_fr) 0.0)
    ((:wheel_velocity_rl __wheel_velocity_rl) 0.0)
    ((:wheel_velocity_rr __wheel_velocity_rr) 0.0)
    ((:wheel_size_fl __wheel_size_fl) 0.0)
    ((:wheel_size_fr __wheel_size_fr) 0.0)
    ((:wheel_size_rl __wheel_size_rl) 0.0)
    ((:wheel_size_rr __wheel_size_rr) 0.0)
    ((:acceleration_left __acceleration_left) 0.0)
    ((:acceleration_forward __acceleration_forward) 0.0)
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:wheel_base __wheel_base) 0.0)
    ((:curb_weight __curb_weight) 0.0)
    )
   (send-super :init)
   (setq _ned_latitude (float __ned_latitude))
   (setq _ned_longitude (float __ned_longitude))
   (setq _ned_heading (float __ned_heading))
   (setq _speed (float __speed))
   (setq _steering_angle (float __steering_angle))
   (setq _steering_angular_velocity (float __steering_angular_velocity))
   (setq _wheel_velocity_fl (float __wheel_velocity_fl))
   (setq _wheel_velocity_fr (float __wheel_velocity_fr))
   (setq _wheel_velocity_rl (float __wheel_velocity_rl))
   (setq _wheel_velocity_rr (float __wheel_velocity_rr))
   (setq _wheel_size_fl (float __wheel_size_fl))
   (setq _wheel_size_fr (float __wheel_size_fr))
   (setq _wheel_size_rl (float __wheel_size_rl))
   (setq _wheel_size_rr (float __wheel_size_rr))
   (setq _acceleration_left (float __acceleration_left))
   (setq _acceleration_forward (float __acceleration_forward))
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _wheel_base (float __wheel_base))
   (setq _curb_weight (float __curb_weight))
   self)
  (:ned_latitude
   (&optional __ned_latitude)
   (if __ned_latitude (setq _ned_latitude __ned_latitude)) _ned_latitude)
  (:ned_longitude
   (&optional __ned_longitude)
   (if __ned_longitude (setq _ned_longitude __ned_longitude)) _ned_longitude)
  (:ned_heading
   (&optional __ned_heading)
   (if __ned_heading (setq _ned_heading __ned_heading)) _ned_heading)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:steering_angle
   (&optional __steering_angle)
   (if __steering_angle (setq _steering_angle __steering_angle)) _steering_angle)
  (:steering_angular_velocity
   (&optional __steering_angular_velocity)
   (if __steering_angular_velocity (setq _steering_angular_velocity __steering_angular_velocity)) _steering_angular_velocity)
  (:wheel_velocity_fl
   (&optional __wheel_velocity_fl)
   (if __wheel_velocity_fl (setq _wheel_velocity_fl __wheel_velocity_fl)) _wheel_velocity_fl)
  (:wheel_velocity_fr
   (&optional __wheel_velocity_fr)
   (if __wheel_velocity_fr (setq _wheel_velocity_fr __wheel_velocity_fr)) _wheel_velocity_fr)
  (:wheel_velocity_rl
   (&optional __wheel_velocity_rl)
   (if __wheel_velocity_rl (setq _wheel_velocity_rl __wheel_velocity_rl)) _wheel_velocity_rl)
  (:wheel_velocity_rr
   (&optional __wheel_velocity_rr)
   (if __wheel_velocity_rr (setq _wheel_velocity_rr __wheel_velocity_rr)) _wheel_velocity_rr)
  (:wheel_size_fl
   (&optional __wheel_size_fl)
   (if __wheel_size_fl (setq _wheel_size_fl __wheel_size_fl)) _wheel_size_fl)
  (:wheel_size_fr
   (&optional __wheel_size_fr)
   (if __wheel_size_fr (setq _wheel_size_fr __wheel_size_fr)) _wheel_size_fr)
  (:wheel_size_rl
   (&optional __wheel_size_rl)
   (if __wheel_size_rl (setq _wheel_size_rl __wheel_size_rl)) _wheel_size_rl)
  (:wheel_size_rr
   (&optional __wheel_size_rr)
   (if __wheel_size_rr (setq _wheel_size_rr __wheel_size_rr)) _wheel_size_rr)
  (:acceleration_left
   (&optional __acceleration_left)
   (if __acceleration_left (setq _acceleration_left __acceleration_left)) _acceleration_left)
  (:acceleration_forward
   (&optional __acceleration_forward)
   (if __acceleration_forward (setq _acceleration_forward __acceleration_forward)) _acceleration_forward)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:wheel_base
   (&optional __wheel_base)
   (if __wheel_base (setq _wheel_base __wheel_base)) _wheel_base)
  (:curb_weight
   (&optional __curb_weight)
   (if __curb_weight (setq _curb_weight __curb_weight)) _curb_weight)
  (:serialization-length
   ()
   (+
    ;; float64 _ned_latitude
    8
    ;; float64 _ned_longitude
    8
    ;; float64 _ned_heading
    8
    ;; float64 _speed
    8
    ;; float64 _steering_angle
    8
    ;; float64 _steering_angular_velocity
    8
    ;; float64 _wheel_velocity_fl
    8
    ;; float64 _wheel_velocity_fr
    8
    ;; float64 _wheel_velocity_rl
    8
    ;; float64 _wheel_velocity_rr
    8
    ;; float64 _wheel_size_fl
    8
    ;; float64 _wheel_size_fr
    8
    ;; float64 _wheel_size_rl
    8
    ;; float64 _wheel_size_rr
    8
    ;; float64 _acceleration_left
    8
    ;; float64 _acceleration_forward
    8
    ;; float64 _roll
    8
    ;; float64 _pitch
    8
    ;; float64 _yaw
    8
    ;; float64 _wheel_base
    8
    ;; float64 _curb_weight
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _ned_latitude
       (sys::poke _ned_latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ned_longitude
       (sys::poke _ned_longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ned_heading
       (sys::poke _ned_heading (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _steering_angle
       (sys::poke _steering_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _steering_angular_velocity
       (sys::poke _steering_angular_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_velocity_fl
       (sys::poke _wheel_velocity_fl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_velocity_fr
       (sys::poke _wheel_velocity_fr (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_velocity_rl
       (sys::poke _wheel_velocity_rl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_velocity_rr
       (sys::poke _wheel_velocity_rr (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_size_fl
       (sys::poke _wheel_size_fl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_size_fr
       (sys::poke _wheel_size_fr (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_size_rl
       (sys::poke _wheel_size_rl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_size_rr
       (sys::poke _wheel_size_rr (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _acceleration_left
       (sys::poke _acceleration_left (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _acceleration_forward
       (sys::poke _acceleration_forward (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_base
       (sys::poke _wheel_base (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _curb_weight
       (sys::poke _curb_weight (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _ned_latitude
     (setq _ned_latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ned_longitude
     (setq _ned_longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ned_heading
     (setq _ned_heading (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _steering_angle
     (setq _steering_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _steering_angular_velocity
     (setq _steering_angular_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_velocity_fl
     (setq _wheel_velocity_fl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_velocity_fr
     (setq _wheel_velocity_fr (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_velocity_rl
     (setq _wheel_velocity_rl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_velocity_rr
     (setq _wheel_velocity_rr (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_size_fl
     (setq _wheel_size_fl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_size_fr
     (setq _wheel_size_fr (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_size_rl
     (setq _wheel_size_rl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_size_rr
     (setq _wheel_size_rr (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _acceleration_left
     (setq _acceleration_left (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _acceleration_forward
     (setq _acceleration_forward (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_base
     (setq _wheel_base (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _curb_weight
     (setq _curb_weight (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get cbnu_msgs::VehicleTlm :md5sum-) "140037dd6fb977de3cb0c0931cbb58a4")
(setf (get cbnu_msgs::VehicleTlm :datatype-) "cbnu_msgs/VehicleTlm")
(setf (get cbnu_msgs::VehicleTlm :definition-)
      "float64 ned_latitude
float64 ned_longitude
float64 ned_heading

float64 speed

float64 steering_angle
float64 steering_angular_velocity

float64 wheel_velocity_fl
float64 wheel_velocity_fr
float64 wheel_velocity_rl
float64 wheel_velocity_rr

float64 wheel_size_fl
float64 wheel_size_fr
float64 wheel_size_rl
float64 wheel_size_rr

float64 acceleration_left
float64 acceleration_forward

float64 roll
float64 pitch
float64 yaw

float64 wheel_base
float64 curb_weight

")



(provide :cbnu_msgs/VehicleTlm "140037dd6fb977de3cb0c0931cbb58a4")


