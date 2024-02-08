// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NeoBoSummaryWidget extends StatelessWidget {
  final String name;
  final String? description;
  const NeoBoSummaryWidget({
    Key? key,
    required this.name,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: description != null
          ? Text(
              description!,
              style: TextStyle(color: Colors.white),
            )
          : null,
    );
  }
}
