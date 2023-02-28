// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class EntityModel {
  String? name;
  String? description;
  String? domainName;
  List<dynamic>? entityData;
  EntityModel({
    this.name,
    this.description,
    this.domainName,
    this.entityData,
  });

  factory EntityModel.init() {
    return EntityModel(
        name: '', description: '', domainName: '', entityData: []);
  }

  EntityModel copyWith({
    String? name,
    String? description,
    String? domainName,
    List<dynamic>? entityData,
  }) {
    return EntityModel(
      name: name ?? this.name,
      description: description ?? this.description,
      domainName: domainName ?? this.domainName,
      entityData: entityData ?? this.entityData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'domainName': domainName,
      'entityData': entityData,
    };
  }

  factory EntityModel.fromMap(Map<String, dynamic> map) {
    return EntityModel(
      name: map['name'] != null ? map['name'] as String : '',
      description:
          map['description'] != null ? map['description'] as String : '',
      domainName: map['domainName'] != null ? map['domainName'] as String : '',
      entityData: map['entityData'] != null
          ? List<dynamic>.from((map['entityData'] as List<dynamic>))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory EntityModel.fromJson(String source) =>
      EntityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EntityModle(name: $name, description: $description, domainName: $domainName, entityData: $entityData)';
  }

  @override
  bool operator ==(covariant EntityModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.domainName == domainName &&
        listEquals(other.entityData, entityData);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        domainName.hashCode ^
        entityData.hashCode;
  }
}
