;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::FactoryAddress)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'FactoryAddress (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::FACTORYADDRESS")
  (make-package "MORAI_MSGS::FACTORYADDRESS"))

(in-package "ROS")
;;//! \htmlinclude FactoryAddress.msg.html


(defclass morai_msgs::FactoryAddress
  :super ros::object
  :slots (_factory_addr_row _factory_addr_col _mission_index ))

(defmethod morai_msgs::FactoryAddress
  (:init
   (&key
    ((:factory_addr_row __factory_addr_row) 0)
    ((:factory_addr_col __factory_addr_col) 0)
    ((:mission_index __mission_index) 0)
    )
   (send-super :init)
   (setq _factory_addr_row (round __factory_addr_row))
   (setq _factory_addr_col (round __factory_addr_col))
   (setq _mission_index (round __mission_index))
   self)
  (:factory_addr_row
   (&optional __factory_addr_row)
   (if __factory_addr_row (setq _factory_addr_row __factory_addr_row)) _factory_addr_row)
  (:factory_addr_col
   (&optional __factory_addr_col)
   (if __factory_addr_col (setq _factory_addr_col __factory_addr_col)) _factory_addr_col)
  (:mission_index
   (&optional __mission_index)
   (if __mission_index (setq _mission_index __mission_index)) _mission_index)
  (:serialization-length
   ()
   (+
    ;; int32 _factory_addr_row
    4
    ;; int32 _factory_addr_col
    4
    ;; int32 _mission_index
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _factory_addr_row
       (write-long _factory_addr_row s)
     ;; int32 _factory_addr_col
       (write-long _factory_addr_col s)
     ;; int32 _mission_index
       (write-long _mission_index s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _factory_addr_row
     (setq _factory_addr_row (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _factory_addr_col
     (setq _factory_addr_col (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _mission_index
     (setq _mission_index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get morai_msgs::FactoryAddress :md5sum-) "3a5097aee45ce9c14e33f6cc877af060")
(setf (get morai_msgs::FactoryAddress :datatype-) "morai_msgs/FactoryAddress")
(setf (get morai_msgs::FactoryAddress :definition-)
      "int32 factory_addr_row
int32 factory_addr_col

int32 mission_index

")



(provide :morai_msgs/FactoryAddress "3a5097aee45ce9c14e33f6cc877af060")


