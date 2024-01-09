import 'package:flutter/material.dart';

class AccountsCustomInfoText extends StatefulWidget {
  final String title;
  final String subTitle;
  const AccountsCustomInfoText({
    required this.title,
    required this.subTitle,
    super.key,
  });

  @override
  State<AccountsCustomInfoText> createState() => _AccountsCustomInfoTextState();
}

class _AccountsCustomInfoTextState extends State<AccountsCustomInfoText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText(widget.title, 1),
              buildText(widget.subTitle, 0),
            ],
          ),
        ],
      ),
    );
  }

  Text buildText(String text, int type) => Text(
        text,
        style: TextStyle(fontSize: 16, color: type == 1 ? Colors.red : Colors.black, fontWeight: FontWeight.bold),
      );
}
