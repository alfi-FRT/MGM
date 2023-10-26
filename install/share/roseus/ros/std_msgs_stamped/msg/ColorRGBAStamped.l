;; Auto-generated. Do not edit!


(when (boundp 'std_msgs_stamped::ColorRGBAStamped)
  (if (not (find-package "STD_MSGS_STAMPED"))
    (make-package "STD_MSGS_STAMPED"))
  (shadow 'ColorRGBAStamped (find-package "STD_MSGS_STAMPED")))
(unless (find-package "STD_MSGS_STAMPED::COLORRGBASTAMPED")
  (make-package "STD_MSGS_STAMPED::COLORRGBASTAMPED"))

(in-package "ROS")
;;//! \htmlinclude ColorRGBAStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass std_msgs_stamped::ColorRGBAStamped
  :super ros::object
  :slots (_header _r _g _b _a ))

(defmethod std_msgs_stamped::ColorRGBAStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:r __r) 0.0)
    ((:g __g) 0.0)
    ((:b __b) 0.0)
    ((:a __a) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _r (float __r))
   (setq _g (float __g))
   (setq _b (float __b))
   (setq _a (float __a))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:r
   (&optional __r)
   (if __r (setq _r __r)) _r)
  (:g
   (&optional __g)
   (if __g (setq _g __g)) _g)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _r
    4
    ;; float32 _g
    4
    ;; float32 _b
    4
    ;; float32 _a
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _r
       (sys::poke _r (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _g
       (sys::poke _g (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _b
       (sys::poke _b (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _a
       (sys::poke _a (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _r
     (setq _r (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _g
     (setq _g (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _b
     (setq _b (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _a
     (setq _a (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get std_msgs_stamped::ColorRGBAStamped :md5sum-) "970ecd4722ca3bc9c59a06e7d6a0f73a")
(setf (get std_msgs_stamped::ColorRGBAStamped :datatype-) "std_msgs_stamped/ColorRGBAStamped")
(setf (get std_msgs_stamped::ColorRGBAStamped :definition-)
      "Header header
float32 r
float32 g
float32 b
float32 a

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



(provide :std_msgs_stamped/ColorRGBAStamped "970ecd4722ca3bc9c59a06e7d6a0f73a")


