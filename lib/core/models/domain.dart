// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class DomainModel {
  String? name;
  String? description;
  List<dynamic>? entities;
  DomainModel({
    this.name,
    this.description,
    this.entities,
  });

  factory DomainModel.init() {
    return DomainModel(name: '', description: '');
  }

  DomainModel copyWith({
    String? name,
    String? description,
    List<dynamic>? entities,
  }) {
    return DomainModel(
      name: name ?? this.name,
      description: description ?? this.description,
      entities: entities ?? this.entities,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'entities': entities,
    };
  }

  factory DomainModel.fromMap(Map<String, dynamic> map) {
    return DomainModel(
      name: map['name'] != null ? map['name'] as String : '',
      description:
          map['description'] != null ? map['description'] as String : '',
      entities: map['entities'] != null
          ? List<dynamic>.from((map['entities'] as List<dynamic>))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory DomainModel.fromJson(String source) =>
      DomainModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DomainModel(name: $name, description: $description, entities: $entities)';

  @override
  bool operator ==(covariant DomainModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        listEquals(other.entities, entities);
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ entities.hashCode;
}
