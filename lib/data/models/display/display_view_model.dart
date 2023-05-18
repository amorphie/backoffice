import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DisplayViewModel {
  String id;
  String entity;
  Map<String, dynamic> data;
  Widget page;
  DisplayViewModel({
    required this.id,
    required this.entity,
    required this.data,
    required this.page,
  });
  factory DisplayViewModel.init() => DisplayViewModel(id: "", entity: "", data: {}, page: Container());
  bool get isBlank => this == DisplayViewModel.init();

  @override
  bool operator ==(covariant DisplayViewModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.entity == entity && mapEquals(other.data, data);
  }

  @override
  int get hashCode => id.hashCode ^ entity.hashCode ^ data.hashCode;
}
