; Auto-generated. Do not edit!


(cl:in-package std_msgs_stamped-msg)


;//! \htmlinclude ByteStamped.msg.html

(cl:defclass <ByteStamped> (roslisp-msg-protocol:ros-message)
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

(cl:defclass ByteStamped (<ByteStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ByteStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ByteStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name std_msgs_stamped-msg:<ByteStamped> is deprecated: use std_msgs_stamped-msg:ByteStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ByteStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader std_msgs_stamped-msg:header-val is deprecated.  Use std_msgs_stamped-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <ByteStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader std_msgs_stamped-msg:data-val is deprecated.  Use std_msgs_stamped-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ByteStamped>) ostream)
  "Serializes a message object of type '<ByteStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ByteStamped>) istream)
  "Deserializes a message object of type '<ByteStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ByteStamped>)))
  "Returns string type for a message object of type '<ByteStamped>"
  "std_msgs_stamped/ByteStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ByteStamped)))
  "Returns string type for a message object of type 'ByteStamped"
  "std_msgs_stamped/ByteStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ByteStamped>)))
  "Returns md5sum for a message object of type '<ByteStamped>"
  "7a643bfe8146d0a2a32750c524956814")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ByteStamped)))
  "Returns md5sum for a message object of type 'ByteStamped"
  "7a643bfe8146d0a2a32750c524956814")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ByteStamped>)))
  "Returns full string definition for message of type '<ByteStamped>"
  (cl:format cl:nil "Header header~%byte data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ByteStamped)))
  "Returns full string definition for message of type 'ByteStamped"
  (cl:format cl:nil "Header header~%byte data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ByteStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ByteStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'ByteStamped
    (cl:cons ':header (header msg))
    (cl:cons ':data (data msg))
))
