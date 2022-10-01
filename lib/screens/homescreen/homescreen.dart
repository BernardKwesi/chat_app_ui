import 'package:chat_app_ui/widgets/chat_contacts.dart';
import 'package:chat_app_ui/widgets/custom_container.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../../models/chat_model.dart';
import '../../models/message_model.dart';
import '../../models/user_model.dart';
import '../../widgets/custom_bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<User> users = User.users;
    List<Chat> chats = Chat.chats;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.secondary,
        ],
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chats",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold)),
          centerTitle: false,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Get.changeThemeMode(
                      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                },
                icon: Icon(Get.isDarkMode ? Icons.dark_mode : Icons.light_mode))
          ],
        ),
        body: Column(
          children: [
            ChatContact(users: users),
            Expanded(
              child: Stack(fit: StackFit.expand, children: [
                ChatMessages(height: height, chats: chats),
                CustomBottomNavbar(
                  width: width,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    Key? key,
    required this.height,
    required this.chats,
  }) : super(key: key);

  final double height;
  final List<Chat> chats;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        height: height,
        child: ListView.builder(itemBuilder: (context, index) {
          //Get the other user profile
          User user = chats[index].users!.where((user) => user.id != '1').first;

          //Sort the messages based on the creation time
          chats[index]
              .messages
              .sort((a, b) => b.createdAt.compareTo(a.createdAt));
          //last message
          Message lastMessage = chats[index].messages.first;

          return ListTile(
            onTap: () {
              Get.toNamed('/chat', arguments: [user, chats[index]]);
            },
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user.imageUrl),
            ),
            title: Text(
              '${user.name} ${user.surname}',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(lastMessage.text,
                maxLines: 1, style: Theme.of(context).textTheme.bodySmall),
            trailing: Text(
                '${lastMessage.createdAt.hour}:${lastMessage.createdAt.minute}',
                style: Theme.of(context).textTheme.bodySmall),
          );
        }));
  }
}

/* 
mixin _CustomAppBar implements StatelessWidget, PreferredSize {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Chats",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold)),
      centerTitle: true,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
            },
            icon: Icon(Get.isDarkMode ? Icons.dark_mode : Icons.light_mode))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
} */
