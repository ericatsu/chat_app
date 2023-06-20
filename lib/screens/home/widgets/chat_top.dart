import 'package:chat_app/shared/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatTop extends StatelessWidget {
  const ChatTop({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.08,
      child: Column(
        children: [
          SizedBox(
            width: width * 0.2,
            child: const Divider(
              color: Colors.grey,
              height: 6,
              thickness: 3,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recent Chat",
                style: TextStyle(
                    color: Palette.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  width: width * 0.26,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(166, 235, 212, 215),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          CupertinoIcons.archivebox,
                          color: Palette.primary,
                          size: 14,
                        ),
                        Text("Archive Chat", style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600
                        ),)
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
