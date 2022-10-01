import "package:flutter/material.dart";

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.height, required this.child});

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.7,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
        color: Theme.of(context).colorScheme.background.withOpacity(0.8),
      ),
      child: child,
    );
  }
}
