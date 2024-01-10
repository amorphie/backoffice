// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sort_column_model.dart';

part 'sort_layout_model.g.dart';

@JsonSerializable()
class SortLayoutModel extends Equatable {
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

  factory SortLayoutModel.fromJson(Map<String, dynamic> json) => _$SortLayoutModelFromJson(json);
  Map<String, dynamic> toJson() => _$SortLayoutModelToJson(this);
  @override
  List<Object?> get props => [columns, defaultData];

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
