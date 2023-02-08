import 'package:flutter/material.dart';

class TagModel {
  final String isim;
  final String soyIsim;
  final Icon durum;
  final String tags;
  final IconData edit;

  TagModel({
    required this.isim,
    required this.soyIsim,
    required this.tags,
    required this.durum,
    required this.edit,
  });
}
