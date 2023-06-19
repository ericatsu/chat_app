import 'package:chat_app/shared/exports.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final String chatImage;
  final String chatTitle;
  final String chatDesc;
  final DateTime chatTime;
  final VoidCallback chatPressed;

  const ChatCard(
      {super.key,
      required this.chatImage,
      required this.chatTitle,
      required this.chatDesc,
      required this.chatTime,
      required this.chatPressed});

  String _formatChatTime(DateTime chatTime) {
    final now = DateTime.now();
    final difference = now.difference(chatTime);

    if (difference.inHours < 24) {
      // Less than 24 hours, display time in 24-hour format
      return DateFormat.Hm().format(chatTime);
    } else if (difference.inDays < 7) {
      // Passed 24 hours, display the day
      return DateFormat.E().format(chatTime);
    } else {
      // Passed one week, display the date in format (dd-mm-yyyy)
      return DateFormat('dd-MM-yyyy').format(chatTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final driverImage = chatImage.isNotEmpty
        ? Image.asset(chatImage)
        : Container(
            height: height * 0.065,
            width: width * 0.12,
            decoration: BoxDecoration(
              color: const Color.fromARGB(111, 158, 158, 158),
              borderRadius: BorderRadius.circular(4),
            ),
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: InkWell(
        onTap: chatPressed,
        child: Container(
          height: height * 0.10,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: width * 0.025),
                driverImage,
                SizedBox(width: width * 0.05),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chatTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        chatDesc,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(120, 2, 0, 3)),
                      ),
                    ],
                  ),
                ),
                Text(
                  _formatChatTime(chatTime),
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(120, 2, 0, 3)),
                ),
                SizedBox(width: width * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
