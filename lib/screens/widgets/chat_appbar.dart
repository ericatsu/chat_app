import 'package:chat_app/shared/exports.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: height * 0.075,
              width: width * 0.12,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 233, 233),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                IconlyLight.arrow_left_2,
                size: 14,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.46,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              height: height * 0.075,
              width: width * 0.12,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 233, 233),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                IconlyBold.call,
                color: Color(0xFF0EBE7E),
                size: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}