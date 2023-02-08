import 'package:flutter/material.dart';

class ConsentModel {
  final String bankName, file, date;
  final IconData status;
  final Icon edit;

  ConsentModel({
    required this.bankName,
    required this.file,
    required this.date,
    required this.status,
    required this.edit,
  });
}
