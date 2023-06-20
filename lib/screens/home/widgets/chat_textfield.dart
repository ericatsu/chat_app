import 'package:chat_app/shared/exports.dart';
import 'package:flutter/material.dart';

class ChaTTextField extends StatelessWidget {
  final TextEditingController chatController;
  final VoidCallback cameraOnpressed;

  const ChaTTextField({super.key, required this.chatController, required this.cameraOnpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            IconButton(
              onPressed: cameraOnpressed,
              icon: const Icon(IconlyLight.camera, color: Color.fromARGB(96, 2, 0, 3),),
            ),
            // const VerticalDivider(
            //   thickness: 1.0,
            //   color: Colors.black,
            //   width: 2.0,
            // ),
            Expanded(
              child: TextField(
                controller: chatController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: 'Type Message here',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(96, 2, 0, 3),
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}