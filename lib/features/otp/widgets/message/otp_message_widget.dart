import 'package:flutter/material.dart';
import 'package:backoffice/util/neo_util.dart';

class OtpMessageWidget extends StatelessWidget {
  final String message;

  const OtpMessageWidget({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(color: Colors.black),
    ).paddingSymmetric(vertical: 8);
  }
}
