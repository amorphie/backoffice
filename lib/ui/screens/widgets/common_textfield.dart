// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../style/colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String val)? onChanged;
  final String? hintText;
  final String labelText;
  const CommonTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(
          color: KC.primary, fontWeight: FontWeight.bold, fontSize: 16),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: KC.secondary),
          borderRadius: BorderRadius.circular(16),
          gapPadding: 8,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          gapPadding: 8,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
            color: KC.primary, fontWeight: FontWeight.bold, fontSize: 16),
        alignLabelWithHint: true,
        hintText: hintText ?? labelText,
      ),
    );
  }
}
