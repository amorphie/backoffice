// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sort_direction_enum.dart';

part 'sort_column_model.g.dart';

@JsonSerializable()
class SortColumnModel extends Equatable {
  String sortColumn;
  SortDirection sortDirection;

  SortColumnModel({
    required this.sortColumn,
    required this.sortDirection,
  });

  factory SortColumnModel.fromJson(Map<String, dynamic> json) => _$SortColumnModelFromJson(json);
  Map<String, dynamic> toJson() => _$SortColumnModelToJson(this);
  @override
  List<Object?> get props => [sortColumn, sortDirection];

  bool get sortAscending => sortDirection == SortDirection.asc;
  bool get hasSort => sortColumn.isNotEmpty;
  Map<String, String> toQueryMap() {
    var map = <String, String>{};
    if (hasSort) map["sortColumn"] = sortColumn;
    map["sortDirection"] = sortDirection.name;
    return map;
  }

  SortColumnModel copyWith({
    String? sortColumn,
    SortDirection? sortDirection,
  }) {
    return SortColumnModel(
      sortColumn: sortColumn ?? this.sortColumn,
      sortDirection: sortDirection ?? this.sortDirection,
    );
  }

  @override
  String toString() => 'SortColumnModel(sortColumn: $sortColumn, sortDirection: $sortDirection)';

  @override
  bool operator ==(covariant SortColumnModel other) {
    if (identical(this, other)) return true;

    return other.sortColumn == sortColumn && other.sortDirection == sortDirection;
  }

  @override
  int get hashCode => sortColumn.hashCode ^ sortDirection.hashCode;
}
