import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String val)? onChanged;
  final Function()? onComplate;
  final Function(String val)? onSubmit;
  final String label;
  final IconData? icon;
  CustomTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.onComplate,
    this.onSubmit,
    this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        onEditingComplete: onComplate,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[300]!)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          hintText: label,
          labelText: label,
          suffixIcon: Icon(icon),
        ),
      ),
    );
  }
}
