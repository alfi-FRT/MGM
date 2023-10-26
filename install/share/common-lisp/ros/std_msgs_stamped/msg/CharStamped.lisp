; Auto-generated. Do not edit!


(cl:in-package std_msgs_stamped-msg)


;//! \htmlinclude CharStamped.msg.html

(cl:defclass <CharStamped> (roslisp-msg-protocol:ros-message)
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

(cl:defclass CharStamped (<CharStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CharStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CharStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name std_msgs_stamped-msg:<CharStamped> is deprecated: use std_msgs_stamped-msg:CharStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CharStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader std_msgs_stamped-msg:header-val is deprecated.  Use std_msgs_stamped-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <CharStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader std_msgs_stamped-msg:data-val is deprecated.  Use std_msgs_stamped-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CharStamped>) ostream)
  "Serializes a message object of type '<CharStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CharStamped>) istream)
  "Deserializes a message object of type '<CharStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CharStamped>)))
  "Returns string type for a message object of type '<CharStamped>"
  "std_msgs_stamped/CharStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CharStamped)))
  "Returns string type for a message object of type 'CharStamped"
  "std_msgs_stamped/CharStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CharStamped>)))
  "Returns md5sum for a message object of type '<CharStamped>"
  "5afacf670cd60dfcaaf6b7ff4f12ccd8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CharStamped)))
  "Returns md5sum for a message object of type 'CharStamped"
  "5afacf670cd60dfcaaf6b7ff4f12ccd8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CharStamped>)))
  "Returns full string definition for message of type '<CharStamped>"
  (cl:format cl:nil "Header header~%char data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CharStamped)))
  "Returns full string definition for message of type 'CharStamped"
  (cl:format cl:nil "Header header~%char data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CharStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CharStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'CharStamped
    (cl:cons ':header (header msg))
    (cl:cons ':data (data msg))
))
