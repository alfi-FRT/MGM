;; Auto-generated. Do not edit!


(when (boundp 'std_msgs_stamped::UInt32MultiArrayStamped)
  (if (not (find-package "STD_MSGS_STAMPED"))
    (make-package "STD_MSGS_STAMPED"))
  (shadow 'UInt32MultiArrayStamped (find-package "STD_MSGS_STAMPED")))
(unless (find-package "STD_MSGS_STAMPED::UINT32MULTIARRAYSTAMPED")
  (make-package "STD_MSGS_STAMPED::UINT32MULTIARRAYSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude UInt32MultiArrayStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass std_msgs_stamped::UInt32MultiArrayStamped
  :super ros::object
  :slots (_header _layout _data ))

(defmethod std_msgs_stamped::UInt32MultiArrayStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:layout __layout) (instance std_msgs::MultiArrayLayout :init))
    ((:data __data) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _header __header)
   (setq _layout __layout)
   (setq _data __data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:layout
   (&rest __layout)
   (if (keywordp (car __layout))
       (send* _layout __layout)
     (progn
       (if __layout (setq _layout (car __layout)))
       _layout)))
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; std_msgs/MultiArrayLayout _layout
    (send _layout :serialization-length)
    ;; uint32[] _data
    (* 4    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/MultiArrayLayout _layout
       (send _layout :serialize s)
     ;; uint32[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-long (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/MultiArrayLayout _layout
     (send _layout :deserialize buf ptr-) (incf ptr- (send _layout :serialization-length))
   ;; uint32[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get std_msgs_stamped::UInt32MultiArrayStamped :md5sum-) "0de61da9f012bea43ff596610569d51a")
(setf (get std_msgs_stamped::UInt32MultiArrayStamped :datatype-) "std_msgs_stamped/UInt32MultiArrayStamped")
(setf (get std_msgs_stamped::UInt32MultiArrayStamped :definition-)
      "Header header
std_msgs/MultiArrayLayout layout
uint32[] data

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

================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
uint32 stride  # stride of given dimension
")



(provide :std_msgs_stamped/UInt32MultiArrayStamped "0de61da9f012bea43ff596610569d51a")


