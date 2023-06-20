import 'package:chat_app/shared/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Center(
        child: Text(
          "Profile page",
          style: TextStyle(
            color: Palette.background,
            fontSize: 25,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}