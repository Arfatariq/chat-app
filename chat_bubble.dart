import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String messageId;
  final String message;
  final bool isSender;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const MessageBubble({
    super.key,
    required this.messageId,
    required this.message,
    required this.isSender,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
  
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: const Text("Message Options"),
                content: const Text("Would you like to edit or delete this message?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onEdit();
                    },
                    child: const Text(
                      "Edit",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onDelete();
                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: isSender ? const Color(0xFF092A70) : Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft: isSender
                  ? const Radius.circular(16)
                  : const Radius.circular(0),
              bottomRight: isSender
                  ? const Radius.circular(0)
                  : const Radius.circular(16),
            ),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isSender ? Colors.white : Colors.black87,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
