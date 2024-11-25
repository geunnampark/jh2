;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::ScenarioLoad)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'ScenarioLoad (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::SCENARIOLOAD")
  (make-package "MORAI_MSGS::SCENARIOLOAD"))

(in-package "ROS")
;;//! \htmlinclude ScenarioLoad.msg.html


(defclass morai_msgs::ScenarioLoad
  :super ros::object
  :slots (_file_name _load_ego_vehicle_data _load_surrounding_vehicle_data _load_pedestrian_data ))

(defmethod morai_msgs::ScenarioLoad
  (:init
   (&key
    ((:file_name __file_name) "")
    ((:load_ego_vehicle_data __load_ego_vehicle_data) nil)
    ((:load_surrounding_vehicle_data __load_surrounding_vehicle_data) nil)
    ((:load_pedestrian_data __load_pedestrian_data) nil)
    )
   (send-super :init)
   (setq _file_name (string __file_name))
   (setq _load_ego_vehicle_data __load_ego_vehicle_data)
   (setq _load_surrounding_vehicle_data __load_surrounding_vehicle_data)
   (setq _load_pedestrian_data __load_pedestrian_data)
   self)
  (:file_name
   (&optional __file_name)
   (if __file_name (setq _file_name __file_name)) _file_name)
  (:load_ego_vehicle_data
   (&optional __load_ego_vehicle_data)
   (if __load_ego_vehicle_data (setq _load_ego_vehicle_data __load_ego_vehicle_data)) _load_ego_vehicle_data)
  (:load_surrounding_vehicle_data
   (&optional __load_surrounding_vehicle_data)
   (if __load_surrounding_vehicle_data (setq _load_surrounding_vehicle_data __load_surrounding_vehicle_data)) _load_surrounding_vehicle_data)
  (:load_pedestrian_data
   (&optional __load_pedestrian_data)
   (if __load_pedestrian_data (setq _load_pedestrian_data __load_pedestrian_data)) _load_pedestrian_data)
  (:serialization-length
   ()
   (+
    ;; string _file_name
    4 (length _file_name)
    ;; bool _load_ego_vehicle_data
    1
    ;; bool _load_surrounding_vehicle_data
    1
    ;; bool _load_pedestrian_data
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _file_name
       (write-long (length _file_name) s) (princ _file_name s)
     ;; bool _load_ego_vehicle_data
       (if _load_ego_vehicle_data (write-byte -1 s) (write-byte 0 s))
     ;; bool _load_surrounding_vehicle_data
       (if _load_surrounding_vehicle_data (write-byte -1 s) (write-byte 0 s))
     ;; bool _load_pedestrian_data
       (if _load_pedestrian_data (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _file_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _file_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _load_ego_vehicle_data
     (setq _load_ego_vehicle_data (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _load_surrounding_vehicle_data
     (setq _load_surrounding_vehicle_data (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _load_pedestrian_data
     (setq _load_pedestrian_data (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get morai_msgs::ScenarioLoad :md5sum-) "a4a97731b70c0c124bff12c7f07eac46")
(setf (get morai_msgs::ScenarioLoad :datatype-) "morai_msgs/ScenarioLoad")
(setf (get morai_msgs::ScenarioLoad :definition-)
      "string file_name
bool load_ego_vehicle_data
bool load_surrounding_vehicle_data
bool load_pedestrian_data


")



(provide :morai_msgs/ScenarioLoad "a4a97731b70c0c124bff12c7f07eac46")


