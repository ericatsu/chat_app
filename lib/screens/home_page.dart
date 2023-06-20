import 'package:chat_app/controller/conversation_controller.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            const Center(
              child: Text(
                'Chat',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.8,
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
                            Get.toNamed('/details', arguments: conversation.id);
                            
                          },
                          chatTime: DateTime.fromMillisecondsSinceEpoch(
                              conversation.modifiedAt ?? 0),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
