import 'package:chat_app/shared/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status_view/status_view.dart';

class TopWidget extends StatelessWidget {
  final VoidCallback ontapped;
  const TopWidget({
    super.key,
    required this.ontapped,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.32,
      color: Palette.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcom Eric👋",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        "ChatApp",
                        style: TextStyle(
                            fontSize: 18,
                            color: Palette.background,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: ontapped,
                    child: Container(
                      width: width * 0.1,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.bell_fill,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.2,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Story",
                        style: TextStyle(
                            fontSize: 14,
                            color: Palette.background,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      statusWidget(
                        statusUrl:
                            'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
                        strokes: 5,
                        story: 'Add',
                      ),
                      statusWidget(
                        statusUrl:
                            'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
                        strokes: 1,
                        story: 'Ball',
                      ),
                      statusWidget(
                        statusUrl:
                            'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
                        strokes: 2,
                        story: 'Eric',
                      ),
                      statusWidget(
                        statusUrl:
                            'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
                        strokes: 4,
                        story: 'Messi',
                      ),
                      statusWidget(
                        statusUrl:
                            'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
                        strokes: 3,
                        story: 'Doni',
                      ),
                      statusWidget(
                        statusUrl:
                            'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
                        strokes: 2,
                        story: 'King',
                      ),
                      statusWidget(
                        statusUrl:
                            'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
                        strokes: 1,
                        story: 'Chat',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}

Widget statusWidget(
    {required int strokes, required String statusUrl, required String story}) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Column(
      children: [
        StatusView(
          radius: 25,
          strokeWidth: 2,
          spacing: 8,
          numberOfStatus: 5,
          indexOfSeenStatus: strokes,
          centerImageUrl: statusUrl,
          padding: 4,
          seenColor: Colors.transparent,
          unSeenColor: Palette.background,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          story,
          style: const TextStyle(
              fontSize: 12,
              color: Palette.background,
              fontWeight: FontWeight.w400),
        )
      ],
    ),
  );
}
