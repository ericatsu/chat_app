import 'dart:async';

import 'package:chat_app/controller/conversation_controller.dart';
import 'package:chat_app/model/conversation.dart';
import 'package:chat_app/screens/home/widgets/chat_textfield.dart';
import 'package:chat_app/screens/home/widgets/convo_top.dart';
import 'package:chat_app/screens/home/widgets/message_bubble.dart';
import 'package:chat_app/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final ConversationController controller = Get.find();
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  int? chatId;
  List<Message> messages = [];
  String? topic;
  List<String>? members;

  @override
  void initState() {
    super.initState();
    final arguments = Get.arguments as Map<String, dynamic>;
    chatId = arguments['chatId'] as int?;
    members = arguments['members'] as List<String>?;
    topic = arguments['topic'] as String?;
    fetchMessages();
  }

  Future<void> fetchMessages() async {
    messages = await controller.fetchMessages(chatId!);
    setState(() {});
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  Future<void> sendMessage() async {
    final messageText = messageController.text.trim();
    if (messageText.isNotEmpty) {
      final newMessage = Message(
        id: messages.length + 1,
        chatId: chatId,
        sender: 'Eric',
        message: messageText,
        modifiedAt: DateTime.now().millisecondsSinceEpoch,
      );
      setState(() {
        messages.add(newMessage);
      });
      messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      await Future.delayed(const Duration(seconds: 2));

      final receivedMessage = Message(
        id: messages.length + 1,
        chatId: chatId,
        sender: 'Bot',
        message: 'This is the response after 2 seconds.',
        modifiedAt: DateTime.now().millisecondsSinceEpoch,
      );
      setState(() {
        messages.add(receivedMessage);
      });
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.primary,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: height * 0.01,
        ),
        ConvoTop(
          chatname: topic ?? '',
          chatmembers: members ?? [],
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: Palette.background,
          ),
          height: height * 0.785,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.008,
              ),
              Container(
                width: width * 0.15,
                height: height * 0.046,
                decoration: BoxDecoration(
                  color: Palette.secondary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "Today",
                    style: TextStyle(color: Colors.blue, fontSize: 11),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isUserMessage = message.sender == 'User';
                    return MessageBubble(
                      senderName: message.sender ?? '',
                      chatMessage: message.message ?? '',
                      messageTime: DateTime.fromMillisecondsSinceEpoch(
                          message.modifiedAt ?? 0),
                      senderColor: isUserMessage
                          ? Palette.secondary
                          : const Color.fromARGB(141, 33, 149, 243),
                      senderAlignment: isUserMessage
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      timeAlignment: isUserMessage
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      bubbleAlignment: isUserMessage
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: ChaTTextField(
                  cameraOnpressed: () {},
                  chatController: messageController,
                  sendOnpressed: sendMessage,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
