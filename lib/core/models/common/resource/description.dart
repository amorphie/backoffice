// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DescriptionModel {
  final String id;
  final String language;
  final String label;
  DescriptionModel({
    required this.id,
    required this.language,
    required this.label,
  });

  DescriptionModel copyWith({
    String? id,
    String? language,
    String? label,
  }) {
    return DescriptionModel(
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

  factory DescriptionModel.fromMap(Map<String, dynamic> map) {
    return DescriptionModel(
      id: map['id'] as String,
      language: map['language'] as String,
      label: map['label'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DescriptionModel.fromJson(String source) =>
      DescriptionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ResourceDescriptionModel(id: $id, language: $language, label: $label)';

  @override
  bool operator ==(covariant DescriptionModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.language == language && other.label == label;
  }

  @override
  int get hashCode => id.hashCode ^ language.hashCode ^ label.hashCode;
}
