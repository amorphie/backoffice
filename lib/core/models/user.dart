// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/core/models/common/phone_model.dart';
import 'package:flutter/foundation.dart';

import 'package:admin/core/export/_.dart';

import '../base/base_model.dart';

class UserModel implements BaseModel {
  final String firstName;
  final String lastName;
  final String reference;
  final String password;
  final PhoneModel phone;
  final String eMail;
  final String state;
  final DateTime? modifiedAt;
  final List<TagModel>? tags;

  String get fullName => "$firstName $lastName";

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.reference,
    required this.password,
    required this.phone,
    required this.eMail,
    required this.state,
    this.modifiedAt,
    this.tags,
  });

  factory UserModel.init() {
    return UserModel(firstName: "", lastName: "", reference: "", password: "", eMail: "", state: "", tags: [], phone: PhoneModel());
  }

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? reference,
    String? password,
    PhoneModel? phone,
    String? eMail,
    String? state,
    DateTime? modifiedAt,
    List<TagModel>? tags,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      reference: reference ?? this.reference,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      eMail: eMail ?? this.eMail,
      state: state ?? this.state,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'reference': reference,
      'password': password,
      'phone': phone,
      'eMail': eMail,
      'state': state,
      'modifiedAt': modifiedAt?.toIso8601String(),
      'tags': tags,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      reference: map['reference'] as String,
      password: map['password'] as String,
      phone: PhoneModel.fromMap(map['phone']),
      eMail: map['eMail'] as String,
      state: map['state'] as String,
      modifiedAt: map['modifiedAt'] != null ? DateTime.parse(map['modifiedAt']) : null,
      tags: List<TagModel>.from([]),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, reference: $reference, password: $password, phone: $phone, eMail: $eMail, state: $state, modifiedAt: $modifiedAt, tags: $tags)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.reference == reference &&
        other.password == password &&
        other.phone == phone &&
        other.eMail == eMail &&
        other.state == state &&
        other.modifiedAt == modifiedAt &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return firstName.hashCode ^ lastName.hashCode ^ reference.hashCode ^ password.hashCode ^ phone.hashCode ^ eMail.hashCode ^ state.hashCode ^ modifiedAt.hashCode ^ tags.hashCode;
  }

  @override
  List<String> columns = [
    "firstName",
    "lastName",
    "reference",
    "password",
    "phone",
    "eMail",
    "status",
    "tags",
  ];

  @override
  var id;
}
