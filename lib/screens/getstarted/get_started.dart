import 'package:chat_app/screens/home/home_page.dart';
import 'package:chat_app/shared/exports.dart';
import 'package:chat_app/shared/nav_widget.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Palette.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.6,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: ExactAssetImage(Images.startedbg))),
          ),
          SizedBox(
            width: width * 0.8,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "It's easy talking to your friends with ChatApp",
                softWrap: true,
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
            width: width * 0.7,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                
                "Call your friend Simply and Simple With ChatApp",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white30),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          InkWell(
            onTap: () {
              Get.to(const NavSection());
            },
            child: Center(
              child: Container(
                height: height * 0.07,
                width: width * 0.85,
                decoration: const BoxDecoration(
                  color: Palette.background,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Palette.primary,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
