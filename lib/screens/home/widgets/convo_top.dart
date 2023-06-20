import 'package:chat_app/shared/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConvoTop extends StatelessWidget {
  final String chatname;
  final List<String> chatmembers;

   const ConvoTop(
      {super.key, required this.chatname, required this.chatmembers,});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.1,
      color: Palette.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  width: width * 0.11,
                  height: height * 0.055,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              SizedBox(
                height: height * 0.1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.11,
                      height: height * 0.055,
                      decoration: BoxDecoration(
                        color: Palette.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text("👨"),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chatname,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Palette.background,
                              fontWeight: FontWeight.w700),
                        ),
                         SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (String member in chatmembers)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    member,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.more_vert_outlined,
                  color: Colors.white,
                  size: 28,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
