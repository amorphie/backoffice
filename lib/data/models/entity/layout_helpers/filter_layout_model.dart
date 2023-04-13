// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FilterLayout {
  String? field;
  String? type;

  FilterLayout({
    this.field,
    this.type,
  });

  FilterLayout copyWith({
    String? field,
    String? type,
  }) {
    return FilterLayout(
      field: field ?? this.field,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'field': field,
      'type': type,
    };
  }

  factory FilterLayout.fromMap(Map<String, dynamic> map) {
    return FilterLayout(
      field: map['field'] != null ? map['field'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilterLayout.fromJson(String source) => FilterLayout.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FilterLayout(field: $field, type: $type)';

  @override
  bool operator ==(covariant FilterLayout other) {
    if (identical(this, other)) return true;

    return other.field == field && other.type == type;
  }

  @override
  int get hashCode => field.hashCode ^ type.hashCode;
}
