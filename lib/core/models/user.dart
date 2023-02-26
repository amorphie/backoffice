// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:admin/core/models/common/user_phone_model.dart';

import '../base/base_model.dart';

class UserModel implements BaseModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String reference;
  final String password;
  final PhoneModel phone;
  final String eMail;
  final String state;
  final DateTime? modifiedAt;
  final List<dynamic>? tag;

  String get fullName => "$firstName $lastName";

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.reference,
    required this.password,
    required this.phone,
    required this.eMail,
    required this.state,
    this.modifiedAt,
    this.tag,
  });

  factory UserModel.init() {
    return UserModel(
        id: "",
        firstName: "",
        lastName: "",
        reference: "",
        password: "",
        eMail: "",
        state: "",
        // tag: [],
        phone: PhoneModel());
  }

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? reference,
    String? password,
    PhoneModel? phone,
    String? eMail,
    String? state,
    DateTime? modifiedAt,
    List<String>? tag,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      reference: reference ?? this.reference,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      eMail: eMail ?? this.eMail,
      state: state ?? this.state,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      tag: tag ?? this.tag,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'reference': reference,
      'password': password,
      'phone': phone.toMap(),
      'eMail': eMail,
      'state': state,
      'modifiedAt': modifiedAt?.millisecondsSinceEpoch,
      'tag': tag,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      reference: map['reference'] as String,
      password: map['password'] as String,
      phone: PhoneModel.fromMap(map['phone'] as Map<String, dynamic>),
      eMail: map['eMail'] as String,
      state: map['state'] as String,
      modifiedAt:
          map['modifiedAt'] != null ? DateTime.parse(map['modifiedAt']) : null,
      tag: map['tag'] != null
          ? List<dynamic>.from((map['tag'] as List<dynamic>))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, reference: $reference, password: $password, phone: $phone, eMail: $eMail, state: $state, modifiedAt: $modifiedAt, tag: $tag)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.reference == reference &&
        other.password == password &&
        other.phone == phone &&
        other.eMail == eMail &&
        other.state == state &&
        other.modifiedAt == modifiedAt &&
        listEquals(other.tag, tag);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        reference.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        eMail.hashCode ^
        state.hashCode ^
        modifiedAt.hashCode ^
        tag.hashCode;
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
    "tag",
  ];

  @override
  set id(String? _id) {
    // TODO: implement id
  }
}
