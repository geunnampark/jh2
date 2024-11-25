;; Auto-generated. Do not edit!


(when (boundp 'cbnu_msgs::MultiScenarioLoad)
  (if (not (find-package "CBNU_MSGS"))
    (make-package "CBNU_MSGS"))
  (shadow 'MultiScenarioLoad (find-package "CBNU_MSGS")))
(unless (find-package "CBNU_MSGS::MULTISCENARIOLOAD")
  (make-package "CBNU_MSGS::MULTISCENARIOLOAD"))

(in-package "ROS")
;;//! \htmlinclude MultiScenarioLoad.msg.html


(defclass cbnu_msgs::MultiScenarioLoad
  :super ros::object
  :slots (_file_name _load_ego_vehicle_data _load_surrounding_vehicle_data _load_pedestrian_data _load_object_data ))

(defmethod cbnu_msgs::MultiScenarioLoad
  (:init
   (&key
    ((:file_name __file_name) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:load_ego_vehicle_data __load_ego_vehicle_data) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:load_surrounding_vehicle_data __load_surrounding_vehicle_data) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:load_pedestrian_data __load_pedestrian_data) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:load_object_data __load_object_data) (let (r) (dotimes (i 0) (push nil r)) r))
    )
   (send-super :init)
   (setq _file_name __file_name)
   (setq _load_ego_vehicle_data __load_ego_vehicle_data)
   (setq _load_surrounding_vehicle_data __load_surrounding_vehicle_data)
   (setq _load_pedestrian_data __load_pedestrian_data)
   (setq _load_object_data __load_object_data)
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
  (:load_object_data
   (&optional __load_object_data)
   (if __load_object_data (setq _load_object_data __load_object_data)) _load_object_data)
  (:serialization-length
   ()
   (+
    ;; string[] _file_name
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _file_name)) 4
    ;; bool[] _load_ego_vehicle_data
    (* 1    (length _load_ego_vehicle_data)) 4
    ;; bool[] _load_surrounding_vehicle_data
    (* 1    (length _load_surrounding_vehicle_data)) 4
    ;; bool[] _load_pedestrian_data
    (* 1    (length _load_pedestrian_data)) 4
    ;; bool[] _load_object_data
    (* 1    (length _load_object_data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _file_name
     (write-long (length _file_name) s)
     (dolist (elem _file_name)
       (write-long (length elem) s) (princ elem s)
       )
     ;; bool[] _load_ego_vehicle_data
     (write-long (length _load_ego_vehicle_data) s)
     (dotimes (i (length _load_ego_vehicle_data))
       (if (elt _load_ego_vehicle_data i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; bool[] _load_surrounding_vehicle_data
     (write-long (length _load_surrounding_vehicle_data) s)
     (dotimes (i (length _load_surrounding_vehicle_data))
       (if (elt _load_surrounding_vehicle_data i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; bool[] _load_pedestrian_data
     (write-long (length _load_pedestrian_data) s)
     (dotimes (i (length _load_pedestrian_data))
       (if (elt _load_pedestrian_data i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; bool[] _load_object_data
     (write-long (length _load_object_data) s)
     (dotimes (i (length _load_object_data))
       (if (elt _load_object_data i) (write-byte -1 s) (write-byte 0 s))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _file_name
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _file_name (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _file_name i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; bool[] _load_ego_vehicle_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _load_ego_vehicle_data (make-list n))
     (dotimes (i n)
     (setf (elt _load_ego_vehicle_data i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; bool[] _load_surrounding_vehicle_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _load_surrounding_vehicle_data (make-list n))
     (dotimes (i n)
     (setf (elt _load_surrounding_vehicle_data i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; bool[] _load_pedestrian_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _load_pedestrian_data (make-list n))
     (dotimes (i n)
     (setf (elt _load_pedestrian_data i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; bool[] _load_object_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _load_object_data (make-list n))
     (dotimes (i n)
     (setf (elt _load_object_data i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;;
   self)
  )

(setf (get cbnu_msgs::MultiScenarioLoad :md5sum-) "72663bbaba4c22d9e77ddf06c9dac39c")
(setf (get cbnu_msgs::MultiScenarioLoad :datatype-) "cbnu_msgs/MultiScenarioLoad")
(setf (get cbnu_msgs::MultiScenarioLoad :definition-)
      "string[] file_name
bool[] load_ego_vehicle_data
bool[] load_surrounding_vehicle_data
bool[] load_pedestrian_data
bool[] load_object_data

")



(provide :cbnu_msgs/MultiScenarioLoad "72663bbaba4c22d9e77ddf06c9dac39c")


