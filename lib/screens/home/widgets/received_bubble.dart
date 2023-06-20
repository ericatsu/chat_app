import 'package:chat_app/screens/home/widgets/sent_bubble.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ReceivedBubble extends StatelessWidget {
  final String message;
  const ReceivedBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: CustomPaint(
            painter: Triangle(Colors.grey.shade300),
          ),
        ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(
              color: Color.fromARGB(137, 224, 224, 224),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(19),
                bottomLeft: Radius.circular(19),
                bottomRight: Radius.circular(19),
              ),
            ),
            child: Text(
              message,
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}

// class Triangle extends CustomPainter {
//   final Color backgroundColor;
//   Triangle(this.backgroundColor);

//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()..color = backgroundColor;

//     var path = Path();
//     path.lineTo(-5, 0);
//     path.lineTo(0, 10);
//     path.lineTo(5, 0);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
