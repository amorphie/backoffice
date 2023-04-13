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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 10, top: 5),
        padding: const EdgeInsets.all(5),
        decoration: isEspanded
            ? BoxDecoration(
                // color: Colors.white70,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 1, spreadRadius: 2, offset: Offset(2, 2)),
                  BoxShadow(color: isSelected ? Colors.white70 : Colors.white30, blurRadius: 2, spreadRadius: 1, offset: Offset(2, 2)),
                ],
              )
            : null,
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            const Spacer(),
            if (isEspanded) const Icon(Icons.arrow_forward_ios, size: 15),
          ],
        ),
      ),
    );
  }
}
