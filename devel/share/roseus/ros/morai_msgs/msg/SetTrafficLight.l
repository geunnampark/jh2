;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::SetTrafficLight)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'SetTrafficLight (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::SETTRAFFICLIGHT")
  (make-package "MORAI_MSGS::SETTRAFFICLIGHT"))

(in-package "ROS")
;;//! \htmlinclude SetTrafficLight.msg.html


(defclass morai_msgs::SetTrafficLight
  :super ros::object
  :slots (_isAutoMode _trafficLightIndex _trafficLightStatus ))

(defmethod morai_msgs::SetTrafficLight
  (:init
   (&key
    ((:isAutoMode __isAutoMode) nil)
    ((:trafficLightIndex __trafficLightIndex) "")
    ((:trafficLightStatus __trafficLightStatus) 0)
    )
   (send-super :init)
   (setq _isAutoMode __isAutoMode)
   (setq _trafficLightIndex (string __trafficLightIndex))
   (setq _trafficLightStatus (round __trafficLightStatus))
   self)
  (:isAutoMode
   (&optional __isAutoMode)
   (if __isAutoMode (setq _isAutoMode __isAutoMode)) _isAutoMode)
  (:trafficLightIndex
   (&optional __trafficLightIndex)
   (if __trafficLightIndex (setq _trafficLightIndex __trafficLightIndex)) _trafficLightIndex)
  (:trafficLightStatus
   (&optional __trafficLightStatus)
   (if __trafficLightStatus (setq _trafficLightStatus __trafficLightStatus)) _trafficLightStatus)
  (:serialization-length
   ()
   (+
    ;; bool _isAutoMode
    1
    ;; string _trafficLightIndex
    4 (length _trafficLightIndex)
    ;; int16 _trafficLightStatus
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _isAutoMode
       (if _isAutoMode (write-byte -1 s) (write-byte 0 s))
     ;; string _trafficLightIndex
       (write-long (length _trafficLightIndex) s) (princ _trafficLightIndex s)
     ;; int16 _trafficLightStatus
       (write-word _trafficLightStatus s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _isAutoMode
     (setq _isAutoMode (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _trafficLightIndex
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _trafficLightIndex (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int16 _trafficLightStatus
     (setq _trafficLightStatus (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get morai_msgs::SetTrafficLight :md5sum-) "b03be827dde5000f1f3c09e99b25ad8f")
(setf (get morai_msgs::SetTrafficLight :datatype-) "morai_msgs/SetTrafficLight")
(setf (get morai_msgs::SetTrafficLight :definition-)
      "bool isAutoMode
string trafficLightIndex
int16 trafficLightStatus

")



(provide :morai_msgs/SetTrafficLight "b03be827dde5000f1f3c09e99b25ad8f")


