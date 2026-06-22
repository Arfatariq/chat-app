import 'package:chatapp/auth/user_model.dart';
import 'package:chatapp/chats/calls/call_screen.dart';
import 'package:chatapp/chats/calls/call_services.dart';
import 'package:chatapp/chats/chat_bubble.dart';
import 'package:chatapp/chats/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final UserModel userModel;
  const ChatScreen({super.key, required this.userModel});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ChatServices _chatServices = ChatServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isTyping = false;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatServices.sendMessage(
        widget.userModel.uid,
        _messageController.text,
      );
      _messageController.clear();
      setState(() => isTyping = false);
    }
  }

  // 🔹 Delete message in Firebase
  Future<void> _deleteMessage(String chatroomId, String messageId) async {
    await FirebaseFirestore.instance
        .collection('ArfaMessages')
        .doc(chatroomId)
        .collection('messages')
        .doc(messageId)
        .delete();
  }

  // 🔹 Edit message in Firebase
  Future<void> _editMessage(
      String chatroomId, String messageId, String newMessage) async {
    await FirebaseFirestore.instance
        .collection('ArfaMessages')
        .doc(chatroomId)
        .collection('messages')
        .doc(messageId)
        .update({'message': newMessage});
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = _firebaseAuth.currentUser!.uid;
    final receiverId = widget.userModel.uid;
    final ids = [currentUserId, receiverId]..sort();
    final chatroomId = ids.join("_");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 42, 112),
        title: Row(
          children: [
            const SizedBox(width: 10),
            Text(
              widget.userModel.name,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
actions: [
IconButton(
  icon: Icon(Icons.call, color: Colors.white),
  onPressed: () async {
    final callService = CallService();
    final callId = await callService.startCall(widget.userModel.uid, false); // audio
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CallScreen(
          isCaller: true,
          roomId: callId,
          isVideo: false, callerName: '', currentUserId: '',
        ),
      ),
    );
  },
),

IconButton(
  icon: Icon(Icons.videocam, color: Colors.white),
  onPressed: () async {
    final callService = CallService();
    final callId = await callService.startCall(widget.userModel.uid, true); // video
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CallScreen(
          isCaller: true,
          roomId: callId,
          isVideo: true, currentUserId: '', callerName: '',
        ),
      ),
    );
  },
),


  const Icon(Icons.more_vert, color: Colors.white),
  const SizedBox(width: 10),
],

      ),

      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _chatServices.getMessages(currentUserId, receiverId),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No messages yet"));
                }

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final data =
                        messages[index].data() as Map<String, dynamic>;
                    final messageId = messages[index].id;
                    final isSender = data['senderId'] == currentUserId;

                    return MessageBubble(
                      messageId: messageId,
                      message: data['message'] ?? '',
                      isSender: isSender,
                      onEdit: () async {
                        final newMessage = await showDialog<String>(
                          context: context,
                          builder: (context) {
                            final controller = TextEditingController(
                              text: data['message'],
                            );
                            return AlertDialog(
                              title: const Text('Edit Message'),
                              content: TextField(
                                controller: controller,
                                decoration: const InputDecoration(
                                  hintText: 'Enter new message',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, null),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, controller.text),
                                  child: const Text('Save'),
                                ),
                              ],
                            );
                          },
                        );

                        if (newMessage != null &&
                            newMessage.trim().isNotEmpty) {
                          await _editMessage(chatroomId, messageId, newMessage);
                        }
                      },
                      onDelete: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Delete Message'),
                            content: const Text(
                                'Are you sure you want to delete this message?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        );

                        if (confirm == true) {
                          await _deleteMessage(chatroomId, messageId);
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),

          // 🔹 Message Input Field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.mic, color: Colors.grey),
                  onPressed: () {},
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            onChanged: (value) {
                              setState(() {
                                isTyping = value.trim().isNotEmpty;
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: "Type a message...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.photo, color: Colors.grey),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.location_on_outlined,
                              color: Colors.grey),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: const Color.fromARGB(255, 9, 42, 112),
                  child: IconButton(
                    icon: Icon(
                      isTyping ? Icons.send : Icons.mic,
                      color: Colors.white,
                    ),
                    onPressed: isTyping ? sendMessage : () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
