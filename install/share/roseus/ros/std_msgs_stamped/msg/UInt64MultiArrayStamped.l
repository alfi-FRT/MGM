;; Auto-generated. Do not edit!


(when (boundp 'std_msgs_stamped::UInt64MultiArrayStamped)
  (if (not (find-package "STD_MSGS_STAMPED"))
    (make-package "STD_MSGS_STAMPED"))
  (shadow 'UInt64MultiArrayStamped (find-package "STD_MSGS_STAMPED")))
(unless (find-package "STD_MSGS_STAMPED::UINT64MULTIARRAYSTAMPED")
  (make-package "STD_MSGS_STAMPED::UINT64MULTIARRAYSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude UInt64MultiArrayStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass std_msgs_stamped::UInt64MultiArrayStamped
  :super ros::object
  :slots (_header _layout _data ))

(defmethod std_msgs_stamped::UInt64MultiArrayStamped
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
    ;; uint64[] _data
    (* 8    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/MultiArrayLayout _layout
       (send _layout :serialize s)
     ;; uint64[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _data i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _data i)) (= (length ((elt _data i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _data i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _data i) . bv) 1) -1) s))
             ((and (class (elt _data i)) (= (length ((elt _data i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _data i) . bv) 0) s)
              (write-long (if (>= (elt _data i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _data i) s)(write-long (if (>= (elt _data i) 0) 0 #xffffffff) s)))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/MultiArrayLayout _layout
     (send _layout :deserialize buf ptr-) (incf ptr- (send _layout :serialization-length))
   ;; uint64[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     
#+(or :alpha :irix6 :x86_64)
      (setf (elt _data i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _data i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;;
   self)
  )

(setf (get std_msgs_stamped::UInt64MultiArrayStamped :md5sum-) "162c51aac0ff084a0daa48aa9cdb4e79")
(setf (get std_msgs_stamped::UInt64MultiArrayStamped :datatype-) "std_msgs_stamped/UInt64MultiArrayStamped")
(setf (get std_msgs_stamped::UInt64MultiArrayStamped :definition-)
      "Header header
std_msgs/MultiArrayLayout layout
uint64[] data

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



(provide :std_msgs_stamped/UInt64MultiArrayStamped "162c51aac0ff084a0daa48aa9cdb4e79")


