import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Chat App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: HomePage(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Data> conversations = [];

  @override
  void initState() {
    super.initState();
    fetchConversations();
  }

  Future<void> fetchConversations() async {
    final response = await http.get(
        Uri.parse('https://flutter-test-9vcb.onrender.com/api/v1/chat_room'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final fetchedConversations = (data['data'] as List<dynamic>)
          .map((item) => Data.fromJson(item as Map<String, dynamic>))
          .toList();
      setState(() {
        conversations = fetchedConversations;
      });
    } else {
      // Handle error
      print('Error fetching conversations: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversations'),
      ),
      body: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (ctx, index) {
          final conversation = conversations[index];
          return ListTile(
            title: Text(conversation.topic ?? ''),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ConversationPage(conversation)),
              );
            },
          );
        },
      ),
    );
  }
}

class ConversationPage extends StatefulWidget {
  final Data conversation;

  ConversationPage(this.conversation);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  List<String> messages = [];
  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchMessages();
  }

  Future<void> fetchMessages() async {
    final response = await http.get(Uri.parse(
        'https://flutter-test-9vcb.onrender.com/api/v1/chat_room/${widget.conversation.id}'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final fetchedMessages = List<String>.from(data['messages']);
      setState(() {
        messages = fetchedMessages;
      });
    } else {
      // Handle error
      print('Error fetching messages: ${response.statusCode}');
    }
  }

  Future<void> sendMessage(String message) async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      messages.add(message);
    });
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.conversation.topic ?? ''),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (ctx, index) {
                final message = messages[index];
                return ListTile(
                  title: Text(message),
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
                    decoration: InputDecoration(labelText: 'Type a message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final message = messageController.text;
                    if (message.isNotEmpty) {
                      sendMessage(message);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Data {
  int? id;
  String? lastMessage;
  List<String>? members;
  String? topic;
  int? modifiedAt;

  Data({this.id, this.lastMessage, this.members, this.topic, this.modifiedAt});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      lastMessage: json['last_message'],
      members: List<String>.from(json['members'] as List<dynamic>),
      topic: json['topic'],
      modifiedAt: json['modified_at'],
    );
  }
}
