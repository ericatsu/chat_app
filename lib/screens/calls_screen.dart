import 'package:chat_app/shared/exports.dart';
import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          "Calls Screen",
          style: TextStyle(
              color: Palette.background,
              fontSize: 25,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}