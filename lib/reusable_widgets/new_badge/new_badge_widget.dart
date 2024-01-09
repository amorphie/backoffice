import 'package:flutter/material.dart';

class NewBadgeWidget extends StatelessWidget {
  final String text;
  final EdgeInsets padding;

  const NewBadgeWidget({
    Key? key,
    this.text = "New",
    this.padding = const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: padding,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
