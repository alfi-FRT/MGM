; Auto-generated. Do not edit!


(cl:in-package std_msgs_stamped-msg)


;//! \htmlinclude ColorRGBAStamped.msg.html

(cl:defclass <ColorRGBAStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (r
    :reader r
    :initarg :r
    :type cl:float
    :initform 0.0)
   (g
    :reader g
    :initarg :g
    :type cl:float
    :initform 0.0)
   (b
    :reader b
    :initarg :b
    :type cl:float
    :initform 0.0)
   (a
    :reader a
    :initarg :a
    :type cl:float
    :initform 0.0))
)

(cl:defclass ColorRGBAStamped (<ColorRGBAStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ColorRGBAStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ColorRGBAStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name std_msgs_stamped-msg:<ColorRGBAStamped> is deprecated: use std_msgs_stamped-msg:ColorRGBAStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ColorRGBAStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader std_msgs_stamped-msg:header-val is deprecated.  Use std_msgs_stamped-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'r-val :lambda-list '(m))
(cl:defmethod r-val ((m <ColorRGBAStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader std_msgs_stamped-msg:r-val is deprecated.  Use std_msgs_stamped-msg:r instead.")
  (r m))

(cl:ensure-generic-function 'g-val :lambda-list '(m))
(cl:defmethod g-val ((m <ColorRGBAStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader std_msgs_stamped-msg:g-val is deprecated.  Use std_msgs_stamped-msg:g instead.")
  (g m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <ColorRGBAStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader std_msgs_stamped-msg:b-val is deprecated.  Use std_msgs_stamped-msg:b instead.")
  (b m))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <ColorRGBAStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader std_msgs_stamped-msg:a-val is deprecated.  Use std_msgs_stamped-msg:a instead.")
  (a m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ColorRGBAStamped>) ostream)
  "Serializes a message object of type '<ColorRGBAStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'r))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'g))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'b))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'a))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ColorRGBAStamped>) istream)
  "Deserializes a message object of type '<ColorRGBAStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'g) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'b) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'a) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ColorRGBAStamped>)))
  "Returns string type for a message object of type '<ColorRGBAStamped>"
  "std_msgs_stamped/ColorRGBAStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ColorRGBAStamped)))
  "Returns string type for a message object of type 'ColorRGBAStamped"
  "std_msgs_stamped/ColorRGBAStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ColorRGBAStamped>)))
  "Returns md5sum for a message object of type '<ColorRGBAStamped>"
  "970ecd4722ca3bc9c59a06e7d6a0f73a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ColorRGBAStamped)))
  "Returns md5sum for a message object of type 'ColorRGBAStamped"
  "970ecd4722ca3bc9c59a06e7d6a0f73a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ColorRGBAStamped>)))
  "Returns full string definition for message of type '<ColorRGBAStamped>"
  (cl:format cl:nil "Header header~%float32 r~%float32 g~%float32 b~%float32 a~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ColorRGBAStamped)))
  "Returns full string definition for message of type 'ColorRGBAStamped"
  (cl:format cl:nil "Header header~%float32 r~%float32 g~%float32 b~%float32 a~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ColorRGBAStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ColorRGBAStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'ColorRGBAStamped
    (cl:cons ':header (header msg))
    (cl:cons ':r (r msg))
    (cl:cons ':g (g msg))
    (cl:cons ':b (b msg))
    (cl:cons ':a (a msg))
))
