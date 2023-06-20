// import 'package:chat_app/shared/exports.dart';
// import 'package:flutter/material.dart';

// class ConvoScreen extends StatefulWidget {
//   const ConvoScreen({
//     super.key,
//   });

//   @override
//   State<ConvoScreen> createState() => _ConvoScreenState();
// }

// class _ConvoScreenState extends State<ConvoScreen> {
//   final TextEditingController _textEditingController = TextEditingController();

//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//     final double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: const PreferredSize(
//           preferredSize: Size.fromHeight(70), child: ChatAppBar()),
//       body: Column(
//         children: [
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Column(
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: AssetImage(Images.imageBlank),
//                       radius: 20,
//                     ),
//                     SizedBox(height: height * 0.02),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             height: height * 0.08,
//                             width: width * 0.9,
//                             child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: widget.members.length,
//                               itemBuilder: (context, index) {
//                                 final member = widget.members[index];
//                                 return Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 4.0),
//                                   child: Chip(
//                                     label: Text(member),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             child: GroupedListView<Message, DateTime>(
//               padding: const EdgeInsets.all(8),
//               elements: [],
//               reverse: true,
//               order: GroupedListOrder.DESC,
//               useStickyGroupSeparators: true,
//               floatingHeader: true,
//               groupBy: (message) => DateTime(message.messageDate.year,
//                   message.messageDate.month, message.messageDate.day),
//               groupHeaderBuilder: (Message message) => SizedBox(
//                 height: 40,
//                 child: Center(
//                   child: Text(
//                     DateFormat.yMMMd().format(message.messageDate),
//                     style: const TextStyle(color: Colors.blue, fontSize: 10),
//                   ),
//                 ),
//               ),
//               itemBuilder: (context, Message message) => Align(
//                 alignment: message.isSentByMe
//                     ? Alignment.centerRight
//                     : Alignment.centerLeft,
//                 child: message.isSentByMe
//                     ? SentBubble(
//                         message: message.text,
//                       )
//                     : ReceivedBubble(message: message.text),
//               ),
//             ),
//           ),
//           Container(
//             color: Colors.white,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: ChaTTextField(
//                     cameraOnpressed: () {},
//                     chatController: _textEditingController,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       final String text = _textEditingController.text;
//                       if (text.isNotEmpty) {
//                         final message = Message(
//                           text: text,
//                           messageDate: DateTime.now(),
//                           isSentByMe: true,
//                         );
//                         setState(() {});
//                         _textEditingController.clear();
//                       }
//                     },
//                     child: Container(
//                       height: height * 0.062,
//                       width: width * 0.11,
//                       decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       child: const Icon(
//                         IconlyBold.send,
//                         size: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Message {
//   final String text;
//   final DateTime messageDate;
//   final bool isSentByMe;

//   Message({
//     required this.text,
//     required this.messageDate,
//     required this.isSentByMe,
//   });
// }
