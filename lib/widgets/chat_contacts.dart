import "package:flutter/material.dart";

import '../models/user_model.dart';

class ChatContact extends StatefulWidget {
  final List users;
  const ChatContact({super.key, required this.users});

  @override
  State<ChatContact> createState() => _ChatContactState();
}

class _ChatContactState extends State<ChatContact> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    List users = widget.users;
    return Container(
      height: height * 0.125,
      margin: const EdgeInsets.only(
        left: 20,
        top: 20,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: ((context, index) {
          User user = users[index];
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    user.imageUrl,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
