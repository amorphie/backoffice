// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MenuButtonCard extends StatelessWidget {
  final String text;
  final bool isEspanded;
  final Function()? onPressed;
  final bool isSelected;
  const MenuButtonCard({
    Key? key,
    required this.text,
    this.isEspanded = true,
    this.isSelected = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 10, top: 5),
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(color: isSelected ? Colors.white54 : Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
