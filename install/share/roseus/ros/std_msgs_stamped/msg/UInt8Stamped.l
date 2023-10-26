;; Auto-generated. Do not edit!


(when (boundp 'std_msgs_stamped::UInt8Stamped)
  (if (not (find-package "STD_MSGS_STAMPED"))
    (make-package "STD_MSGS_STAMPED"))
  (shadow 'UInt8Stamped (find-package "STD_MSGS_STAMPED")))
(unless (find-package "STD_MSGS_STAMPED::UINT8STAMPED")
  (make-package "STD_MSGS_STAMPED::UINT8STAMPED"))

(in-package "ROS")
;;//! \htmlinclude UInt8Stamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass std_msgs_stamped::UInt8Stamped
  :super ros::object
  :slots (_header _data ))

(defmethod std_msgs_stamped::UInt8Stamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:data __data) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _data (round __data))
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
    ;; uint8 _data
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _data
       (write-byte _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _data
     (setq _data (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get std_msgs_stamped::UInt8Stamped :md5sum-) "dd7703d5078812384ba611ee20b8fecf")
(setf (get std_msgs_stamped::UInt8Stamped :datatype-) "std_msgs_stamped/UInt8Stamped")
(setf (get std_msgs_stamped::UInt8Stamped :definition-)
      "Header header
uint8 data

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



(provide :std_msgs_stamped/UInt8Stamped "dd7703d5078812384ba611ee20b8fecf")


