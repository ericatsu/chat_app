import 'package:chat_app/shared/exports.dart';
import 'package:flutter/material.dart';

class ConvoScreen extends StatefulWidget {
  final String chatDataImage;
  final String chatDataTitle;
  final String chatDataStatus;

  const ConvoScreen({
    super.key,
    required this.chatDataImage,
    required this.chatDataTitle,
    required this.chatDataStatus,
  });

  @override
  State<ConvoScreen> createState() => _ConvoScreenState();
}

class _ConvoScreenState extends State<ConvoScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70), child: ChatAppBar()),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.chatDataImage),
                      radius: 35,
                    ),
                    SizedBox(height: height * 0.015),
                    Text(
                      widget.chatDataTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      widget.chatDataStatus,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF0EBE7E),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: GroupedListView<Message, DateTime>(
              padding: const EdgeInsets.all(8),
              elements: messages,
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              groupBy: (message) => DateTime(message.messageDate.year,
                  message.messageDate.month, message.messageDate.day),
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40,
                child: Center(
                  child: Text(
                    DateFormat.yMMMd().format(message.messageDate),
                    style:
                        const TextStyle(color: Colors.blue, fontSize: 10),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Align(
                alignment: message.isSentByMe
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: message.isSentByMe
                    ? SentBubble(
                        message: message.text,
                      )
                    : ReceivedBubble(message: message.text),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: ChaTTextField(
                    cameraOnpressed: () {},
                    chatController: _textEditingController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      final String text = _textEditingController.text;
                      if (text.isNotEmpty) {
                        final message = Message(
                          text: text,
                          messageDate: DateTime.now(),
                          isSentByMe: true,
                        );
                        setState(() {
                          messages.add(message);
                        });
                        _textEditingController.clear();
                      }
                    },
                    child: Container(
                      height: height * 0.062,
                      width: width * 0.11,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        IconlyBold.send,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
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

class Message {
  final String text;
  final DateTime messageDate;
  final bool isSentByMe;

  Message({
    required this.text,
    required this.messageDate,
    required this.isSentByMe,
  });
}

List<Message> messages = [
  Message(
    text: "Yes how",
    messageDate: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: false,
  ),
  Message(
    text: "So",
    messageDate: DateTime.now().subtract(const Duration(minutes: 2)),
    isSentByMe: true,
  ),
  Message(
    text: "That",
    messageDate: DateTime.now().subtract(const Duration(minutes: 10)),
    isSentByMe: true,
  ),
  Message(
    text: "Shut the fuck up",
    messageDate: DateTime.now().subtract(const Duration(days: 1, minutes: 21)),
    isSentByMe: false,
  ),
  Message(
    text: "No hash",
    messageDate: DateTime.now().subtract(const Duration(days: 1, minutes: 22)),
    isSentByMe: true,
  ),
  Message(
    text: "Word",
    messageDate: DateTime.now().subtract(const Duration(days: 2, minutes: 22)),
    isSentByMe: false,
  ),
  Message(
    isSentByMe: false,
    messageDate: DateTime.now().subtract(const Duration(days: 2, minutes: 23)),
    text: "Vhim",
  ),
];
