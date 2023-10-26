;; Auto-generated. Do not edit!


(when (boundp 'std_msgs_stamped::TimeStamped)
  (if (not (find-package "STD_MSGS_STAMPED"))
    (make-package "STD_MSGS_STAMPED"))
  (shadow 'TimeStamped (find-package "STD_MSGS_STAMPED")))
(unless (find-package "STD_MSGS_STAMPED::TIMESTAMPED")
  (make-package "STD_MSGS_STAMPED::TIMESTAMPED"))

(in-package "ROS")
;;//! \htmlinclude TimeStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass std_msgs_stamped::TimeStamped
  :super ros::object
  :slots (_header _data ))

(defmethod std_msgs_stamped::TimeStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:data __data) (instance ros::time :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _data __data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; time _data
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; time _data
       (write-long (send _data :sec) s) (write-long (send _data :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; time _data
     (send _data :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _data :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get std_msgs_stamped::TimeStamped :md5sum-) "4830f52a04f1d11eee39b731d1c6b7e3")
(setf (get std_msgs_stamped::TimeStamped :datatype-) "std_msgs_stamped/TimeStamped")
(setf (get std_msgs_stamped::TimeStamped :definition-)
      "Header header
time data

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :std_msgs_stamped/TimeStamped "4830f52a04f1d11eee39b731d1c6b7e3")


