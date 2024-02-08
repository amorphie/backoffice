// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NeoBoDetailItemTitleWidget extends StatelessWidget {
  final String title;
  const NeoBoDetailItemTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 4, bottom: 2, left: 6),
        child: Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ));
  }
}
