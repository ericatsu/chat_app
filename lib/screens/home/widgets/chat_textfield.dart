import 'package:chat_app/shared/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChaTTextField extends StatelessWidget {
  final TextEditingController chatController;
  final VoidCallback cameraOnpressed;
  final VoidCallback sendOnpressed;

  const ChaTTextField(
      {super.key,
      required this.chatController,
      required this.cameraOnpressed,
      required this.sendOnpressed});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.1,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(55, 148, 196, 236),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: width * 0.11,
                    height: height * 0.055,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(99, 155, 39, 176),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.mic,
                        color: Colors.purple,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: chatController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Type Message here',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(96, 2, 0, 3),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                InkWell(
                  onTap: sendOnpressed,
                  child: Container(
                    width: width * 0.10,
                    height: height * 0.055,
                    decoration: BoxDecoration(
                      color:  const Color.fromARGB(88, 33, 149, 243),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.send,
                        color: Colors.blue,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
