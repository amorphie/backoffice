// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'sort_direction_enum.dart';

class SortColumnModel {
  String sortColumn;
  SortDirection sortDirection;

  SortColumnModel({
    required this.sortColumn,
    required this.sortDirection,
  });

  bool get sortAscending => sortDirection == SortDirection.asc;
  bool get hasSort => sortColumn.isNotEmpty;
  Map<String, String> toQueryMap() {
    var map = <String, String>{};
    if (hasSort) map["sortColumn"] = sortColumn;
    map["sortDirection"] = sortDirection.toMap();
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sortColumn': sortColumn,
      'sortDirection': sortDirection.toMap(),
    };
  }

  factory SortColumnModel.fromMap(Map<String, dynamic> map) {
    return SortColumnModel(
      sortColumn: map['sortColumn'] as String,
      sortDirection: SortDirection.fromMap(map['sortDirection']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SortColumnModel.fromJson(String source) => SortColumnModel.fromMap(json.decode(source) as Map<String, dynamic>);

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
