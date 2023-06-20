import 'package:chat_app/shared/exports.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String senderName;
  final String chatMessage;
  final DateTime messageTime;
  final Color senderColor;
  final Alignment senderAlignment;
  final Alignment timeAlignment;
  final Alignment bubbleAlignment;

  const MessageBubble(
      {super.key,
      required this.senderName,
      required this.chatMessage,
      required this.messageTime,
      required this.senderColor, required this.senderAlignment, required this.timeAlignment, required this.bubbleAlignment});


      String _formatMessageTime(DateTime messageTime) {
    final now = DateTime.now();
    final difference = now.difference(messageTime);

    if (difference.inHours < 24) {
      return DateFormat.Hm().format(messageTime);
    } else if (difference.inDays < 7) {
      return DateFormat.E().format(messageTime);
    } else {
      return DateFormat('dd-MM-yyyy').format(messageTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 10),
      child: Align(
        alignment: bubbleAlignment,
        child: Container(
          color: Colors.transparent,
         width: width * 0.5,
          child: Column(
            children: [
            Align(
              alignment: senderAlignment,
              child: Text(
                senderName,
                style: const TextStyle(fontSize: 9.5, fontWeight: FontWeight.w300),
              ),
            ),
            Container(
                width: width * 0.5,
                decoration: BoxDecoration(
                  color: senderColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    chatMessage,
                    style: const TextStyle(fontSize: 12),
                  ),
                )),
            Align(
              alignment: timeAlignment,
              child: Text(
                _formatMessageTime(messageTime),
                style: const TextStyle(fontSize: 9.5, fontWeight: FontWeight.w300),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
