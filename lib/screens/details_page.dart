import 'dart:async';

import 'package:chat_app/controller/conversation_controller.dart';
import 'package:chat_app/model/conversation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final ConversationController controller = Get.find();
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  int? chatId;
  List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    chatId = Get.arguments as int?;
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
        sender: 'User',
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

      // Simulating delay before receiving an answer
      await Future.delayed(const Duration(seconds: 2));

      final receivedMessage = Message(
        id: messages.length + 1,
        chatId: chatId,
        sender: 'Bot',
        message: 'This is an automated reply.',
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Text(message.sender ?? ''),
                  subtitle: Text(message.message ?? ''),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: sendMessage,
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
