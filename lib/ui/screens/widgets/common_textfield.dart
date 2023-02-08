// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../style/colors.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String val)? onChanged;
  final String? hintText;
  final String labelText;
  final bool isObscure;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;
  const CommonTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.hintText,
    required this.labelText,
    this.isObscure = false,
    this.keyboardType,
    this.maxLines = 1,
    this.maxLength = 30,
    this.inputFormatter,
  }) : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late bool obscure;
  @override
  void initState() {
    super.initState();
    obscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: widget.inputFormatter,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      onChanged: widget.onChanged,
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
        labelText: widget.labelText,
        labelStyle: TextStyle(
            color: KC.primary, fontWeight: FontWeight.bold, fontSize: 16),
        alignLabelWithHint: true,
        hintText: widget.hintText ?? widget.labelText,
        suffixIcon: widget.isObscure
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                child: Icon(
                  Icons.remove_red_eye,
                  color: obscure ? Colors.grey : null,
                ))
            : null,
      ),
    );
  }
}
