// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RequestModel {
  final String senderId;
  final String senderName;
  final String receiverName;

 final String receiverId;
 final String status;
 final DateTime timestamp;
  RequestModel({
    required this.senderId,
    required this.senderName,
    required this.receiverName,
    required this.receiverId,
    required this.status,
    required this.timestamp,
  });

  RequestModel copyWith({
    String? senderId,
    String? senderName,
    String? receiverName,
    String? receiverId,
    String? status,
    DateTime? timestamp,
  }) {
    return RequestModel(
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      receiverName: receiverName ?? this.receiverName,
      receiverId: receiverId ?? this.receiverId,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'senderName': senderName,
      'receiverName': receiverName,
      'receiverId': receiverId,
      'status': status,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    return RequestModel(
      senderId: map['senderId'] as String,
      senderName: map['senderName'] as String,
      receiverName: map['receiverName'] as String,
      receiverId: map['receiverId'] as String,
      status: map['status'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) => RequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RequestModel(senderId: $senderId, senderName: $senderName, receiverName: $receiverName, receiverId: $receiverId, status: $status, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant RequestModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.senderId == senderId &&
      other.senderName == senderName &&
      other.receiverName == receiverName &&
      other.receiverId == receiverId &&
      other.status == status &&
      other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return senderId.hashCode ^
      senderName.hashCode ^
      receiverName.hashCode ^
      receiverId.hashCode ^
      status.hashCode ^
      timestamp.hashCode;
  }
}
