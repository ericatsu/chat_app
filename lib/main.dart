
import 'package:chat_app/controller/conversation_controller.dart';
import 'package:chat_app/screens/getstarted/get_started.dart';
import 'package:chat_app/screens/home/details_page.dart';
import 'package:chat_app/screens/home/home_page.dart';
import 'package:chat_app/shared/exports.dart';
import 'package:chat_app/shared/nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(ConversationController());
      }),
      home: const GetStarted(),
      initialRoute: '/',
     getPages: [
        GetPage(name: '/', page: () =>  const NavSection()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/home/details', page: () => DetailsPage()),
      ],
    );
  }
}

