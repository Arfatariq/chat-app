import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Send message
  Future<void> sendMessage(String receiverId, String message) async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return;

    final senderId = currentUser.uid;
    final timestamp = Timestamp.now();

    // Create a unique chat room ID (sorted so both users share the same chat room)
    List<String> ids = [senderId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    // Save the message in the chat room
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add({
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
    });
  }

  // Get messages stream
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
