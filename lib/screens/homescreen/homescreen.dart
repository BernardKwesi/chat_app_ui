import "package:flutter/material.dart";
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
        body: Container(),
      ),
    );
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
