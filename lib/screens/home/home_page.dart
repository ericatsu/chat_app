import 'package:chat_app/controller/conversation_controller.dart';
import 'package:chat_app/screens/home/widgets/chat_top.dart';
import 'package:chat_app/screens/home/widgets/top_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/shared/exports.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ConversationController conversationController =
      Get.put(ConversationController());
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    //final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopWidget(
            ontapped: () {},
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              color: Palette.background,
            ),
            height: height * 0.555,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              child: Column(
                children: [
                  const ChatTop(),
                  Expanded(
                    child: Obx(
                      () {
                        if (conversationController.isLoading.value) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (conversationController.hasError.value) {
                          return const Center(
                              child: Text('Error fetching conversations'));
                        } else {
                          return ListView.builder(
                            itemCount: conversationController.conversations.length,
                            itemBuilder: (ctx, index) {
                              final conversation =
                                  conversationController.conversations[index];
                              return ChatCard(
                                chatDesc: conversation.lastMessage ?? '',
                                chatImage: Images.imageBlank,
                                chatTitle: conversation.topic ?? '',
                                chatPressed: () {
                                  Get.toNamed('/home/details', arguments: {
                                    'chatId': conversation.id,
                                    'topic' : conversation.topic,
                                    'members': conversation.members
                                  });
                                },
                                chatTime: DateTime.fromMillisecondsSinceEpoch(
                                    conversation.modifiedAt ?? 0),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
