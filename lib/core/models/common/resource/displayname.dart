// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DisplayNameModel {
  final String id;
  final String language;
  final String label;
  DisplayNameModel({
    required this.id,
    required this.language,
    required this.label,
  });

  DisplayNameModel copyWith({
    String? id,
    String? language,
    String? label,
  }) {
    return DisplayNameModel(
      id: id ?? this.id,
      language: language ?? this.language,
      label: label ?? this.label,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'language': language,
      'label': label,
    };
  }

  factory DisplayNameModel.fromMap(Map<String, dynamic> map) {
    return DisplayNameModel(
      id: map['id'] as String,
      language: map['language'] as String,
      label: map['label'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DisplayNameModel.fromJson(String source) =>
      DisplayNameModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ResourceDisplayNameModel(id: $id, language: $language, label: $label)';

  @override
  bool operator ==(covariant DisplayNameModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.language == language && other.label == label;
  }

  @override
  int get hashCode => id.hashCode ^ language.hashCode ^ label.hashCode;
}
