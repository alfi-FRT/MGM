; Auto-generated. Do not edit!


(cl:in-package std_msgs_stamped-msg)


;//! \htmlinclude Int64Stamped.msg.html

(cl:defclass <Int64Stamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (data
    :reader data
    :initarg :data
    :type cl:integer
    :initform 0))
)

(cl:defclass Int64Stamped (<Int64Stamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Int64Stamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Int64Stamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name std_msgs_stamped-msg:<Int64Stamped> is deprecated: use std_msgs_stamped-msg:Int64Stamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Int64Stamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader std_msgs_stamped-msg:header-val is deprecated.  Use std_msgs_stamped-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <Int64Stamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader std_msgs_stamped-msg:data-val is deprecated.  Use std_msgs_stamped-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Int64Stamped>) ostream)
  "Serializes a message object of type '<Int64Stamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'data)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Int64Stamped>) istream)
  "Deserializes a message object of type '<Int64Stamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Int64Stamped>)))
  "Returns string type for a message object of type '<Int64Stamped>"
  "std_msgs_stamped/Int64Stamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Int64Stamped)))
  "Returns string type for a message object of type 'Int64Stamped"
  "std_msgs_stamped/Int64Stamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Int64Stamped>)))
  "Returns md5sum for a message object of type '<Int64Stamped>"
  "28133f39b947dbb86bee940be137535f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Int64Stamped)))
  "Returns md5sum for a message object of type 'Int64Stamped"
  "28133f39b947dbb86bee940be137535f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Int64Stamped>)))
  "Returns full string definition for message of type '<Int64Stamped>"
  (cl:format cl:nil "Header header~%int64 data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Int64Stamped)))
  "Returns full string definition for message of type 'Int64Stamped"
  (cl:format cl:nil "Header header~%int64 data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Int64Stamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Int64Stamped>))
  "Converts a ROS message object to a list"
  (cl:list 'Int64Stamped
    (cl:cons ':header (header msg))
    (cl:cons ':data (data msg))
))
