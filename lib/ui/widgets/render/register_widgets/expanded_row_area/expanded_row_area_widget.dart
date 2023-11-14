// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ExpandedRowAreaWidget extends StatelessWidget {
  final List data;
  final bool isTitle;
  const ExpandedRowAreaWidget({
    Key? key,
    required this.data,
    this.isTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Row(
        children: data
            .map((e) => Expanded(
                    child: Text(
                  e,
                  style: TextStyle(fontWeight: isTitle ? FontWeight.bold : FontWeight.w400),
                )))
            .toList(),
      ),
    );
  }
}
