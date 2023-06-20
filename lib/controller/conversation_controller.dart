import 'dart:convert';

import 'package:chat_app/model/conversation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ConversationController extends GetxController {
  RxList<Data> conversations = <Data>[].obs;
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;

  String convoURL = dotenv.get("BASE_URL", fallback: "");
  @override
  void onInit() {
    super.onInit();
    fetchConversations();
  }

  Future<void> fetchConversations() async {
    isLoading.value = true;
    try {
      dynamic response = await http.get(Uri.parse(convoURL));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final fetchedConversations = (data['data'] as List<dynamic>)
            .map((item) => Data.fromJson(item as Map<String, dynamic>))
            .toList();
        conversations.value = fetchedConversations;
      } else {
        // Handle error
        print('Error fetching conversations: ${response.statusCode}');
        hasError.value = true;
      }
    } catch (e) {
      print('Error fetching conversations: $e');
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<Message>> fetchMessages(int chatId) async {
    try {
      final response = await http.get(
        Uri.parse('$convoURL/$chatId'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print('Response body: $jsonData');
        final data = jsonData['data'];

        if (data is Map<String, dynamic>) {
          final message = Message.fromJson(data);
          return [message];
        } else {
          throw Exception(
              'Invalid response format. Expected a message object.');
        }
      } else {
        throw Exception('Error fetching messages: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching messages: $e');
    }
  }

}
