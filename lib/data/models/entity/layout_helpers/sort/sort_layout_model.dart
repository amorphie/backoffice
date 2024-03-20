// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:admin/data/models/entity/layout_helpers/sort/sort_column_model.dart';

class SortLayoutModel {
  List<String> columns;
  SortColumnModel defaultData;
  SortLayoutModel({
    required this.columns,
    required this.defaultData,
  });

  SortLayoutModel copyWith({
    List<String>? columns,
    SortColumnModel? defaultData,
  }) {
    return SortLayoutModel(
      columns: columns ?? this.columns,
      defaultData: defaultData ?? this.defaultData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'columns': columns,
      'defaultData': defaultData.toMap(),
    };
  }

  factory SortLayoutModel.fromMap(Map<String, dynamic> map) {
    return SortLayoutModel(
      columns: List<String>.from(map['columns']),
      defaultData: SortColumnModel.fromMap(map['defaultData'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SortLayoutModel.fromJson(String source) => SortLayoutModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SortLayoutModel(columns: $columns, defaultData: $defaultData)';

  @override
  bool operator ==(covariant SortLayoutModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.columns, columns) && other.defaultData == defaultData;
  }

  @override
  int get hashCode => columns.hashCode ^ defaultData.hashCode;
}
