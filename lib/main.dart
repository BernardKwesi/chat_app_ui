import 'package:chat_app_ui/config/theme.dart';
import 'package:chat_app_ui/screens/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/chatscreen/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme(),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: "/", page: () => const HomeScreen()),
        GetPage(name: "/chat", page: () => const ChatScreen()),
      ],
    );
  }
}
