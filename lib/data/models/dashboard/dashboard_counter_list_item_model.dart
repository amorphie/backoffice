// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DashboardCounterListItemModel {
  final String title;
  final int value;

  DashboardCounterListItemModel({
    required this.title,
    required this.value,
  });

  DashboardCounterListItemModel copyWith({
    String? title,
    int? value,
  }) {
    return DashboardCounterListItemModel(
      title: title ?? this.title,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'value': value,
    };
  }

  factory DashboardCounterListItemModel.fromMap(Map<String, dynamic> map) {
    return DashboardCounterListItemModel(
      title: map['title'] as String,
      value: map['value'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DashboardCounterListItemModel.fromJson(String source) => DashboardCounterListItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DashboardCounterListItemModel(title: $title, value: $value)';

  @override
  bool operator ==(covariant DashboardCounterListItemModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.value == value;
  }

  @override
  int get hashCode => title.hashCode ^ value.hashCode;
}
