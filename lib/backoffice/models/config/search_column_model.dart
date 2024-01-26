// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_column_model.g.dart';

@JsonSerializable()
class SearchColumn extends Equatable {
  String data;
  Map<String, String> title;
  int sort;
  SearchColumn({
    required this.data,
    required this.title,
    required this.sort,
  });

  factory SearchColumn.fromJson(Map<String, dynamic> json) => _$SearchColumnFromJson(json);
  Map<String, dynamic> toJson() => _$SearchColumnToJson(this);
  @override
  List<Object?> get props => [data, title, sort];

  SearchColumn copyWith({
    String? data,
    Map<String, String>? title,
    int? sort,
  }) {
    return SearchColumn(
      data: data ?? this.data,
      title: title ?? this.title,
      sort: sort ?? this.sort,
    );
  }

  @override
  String toString() => 'SearchColumn(data: $data, title: $title, sort: $sort)';

  @override
  bool operator ==(covariant SearchColumn other) {
    if (identical(this, other)) return true;

    return other.data == data && other.title == title && other.sort == sort;
  }

  @override
  int get hashCode => data.hashCode ^ title.hashCode ^ sort.hashCode;
}
