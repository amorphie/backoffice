// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:admin/core/export/_.dart';

import '../base/base_model.dart';

class UserModel implements BaseModel {
  final String firstName;
  final String lastName;
  final String reference;
  final String password;
  final String phone;
  final String eMail;
  final String state;
  final DateTime? modifiedAt;
  final IconData edit;
  final IconData status;
  final List<String> tags;

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
    required this.edit,
    required this.status,
    required this.tags,
  });

  factory UserModel.init() {
    return UserModel(firstName: "", lastName: "", reference: "", password: "", eMail: "", state: "", edit: Icons.edit, status: Icons.check, tags: [], phone: "");
  }

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? reference,
    String? password,
    String? phone,
    String? eMail,
    String? state,
    DateTime? modifiedAt,
    IconData? edit,
    IconData? status,
    List<String>? tags,
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
      edit: edit ?? this.edit,
      status: status ?? this.status,
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
      'modifiedAt': modifiedAt?.millisecondsSinceEpoch,
      'edit': edit.codePoint,
      'status': status.codePoint,
      'tags': tags,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        firstName: map['firstName'] as String,
        lastName: map['lastName'] as String,
        reference: map['reference'] as String,
        password: map['password'] as String,
        phone: map['phone'] as String,
        eMail: map['eMail'] as String,
        state: map['state'] as String,
        modifiedAt: map['modifiedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['modifiedAt'] as int) : null,
        edit: IconData(map['edit'] as int, fontFamily: 'MaterialIcons'),
        status: IconData(map['status'] as int, fontFamily: 'MaterialIcons'),
        tags: List<String>.from(
          (map['tags'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, reference: $reference, password: $password, phone: $phone, eMail: $eMail, state: $state, modifiedAt: $modifiedAt, edit: $edit, status: $status, tags: $tags)';
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
        other.edit == edit &&
        other.status == status &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        reference.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        eMail.hashCode ^
        state.hashCode ^
        modifiedAt.hashCode ^
        edit.hashCode ^
        status.hashCode ^
        tags.hashCode;
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
