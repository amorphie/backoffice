// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/core/export/_.dart';

class UserModel {
  String firstName;
  String lastName;
  String reference;
  String password;
  String eMail;
  String state;
  DateTime? modifiedAt;
  final IconData edit;
  final IconData status;
  final String tags;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.reference,
    required this.password,
    required this.eMail,
    required this.state,
    this.modifiedAt,
    required this.edit,
    required this.status,
    required this.tags,
  });

  factory UserModel.init() {
    return UserModel(
        firstName: "firstName",
        lastName: "lastName",
        reference: "reference",
        password: "password",
        eMail: "eMail",
        state: "state",
        edit: Icons.edit,
        status: Icons.check,
        tags: "tags");
  }

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? reference,
    String? password,
    String? eMail,
    String? state,
    DateTime? modifiedAt,
    IconData? edit,
    IconData? status,
    String? tags,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      reference: reference ?? this.reference,
      password: password ?? this.password,
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
      eMail: map['eMail'] as String,
      state: map['state'] as String,
      modifiedAt: map['modifiedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['modifiedAt'] as int)
          : null,
      edit: IconData(map['edit'] as int, fontFamily: 'MaterialIcons'),
      status: IconData(map['status'] as int, fontFamily: 'MaterialIcons'),
      tags: map['tags'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, reference: $reference, password: $password, eMail: $eMail, state: $state, modifiedAt: $modifiedAt, edit: $edit, status: $status, tags: $tags)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.reference == reference &&
        other.password == password &&
        other.eMail == eMail &&
        other.state == state &&
        other.modifiedAt == modifiedAt &&
        other.edit == edit &&
        other.status == status &&
        other.tags == tags;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        reference.hashCode ^
        password.hashCode ^
        eMail.hashCode ^
        state.hashCode ^
        modifiedAt.hashCode ^
        edit.hashCode ^
        status.hashCode ^
        tags.hashCode;
  }
}

List<UserModel> users = [
  UserModel(
      reference: "000000000 000000 0000 00000",
      firstName: "Ozan Deniz",
      lastName: "Demirtaş",
      status: Icons.check_circle,
      tags: "retail-customer, bank-staff",
      edit: Icons.edit,
      eMail: '',
      password: "",
      state: ""),
  UserModel(
      reference: "000000000 000000 0000 00000",
      firstName: "Ertuğrul",
      lastName: "Dağlı",
      status: Icons.timer_sharp,
      tags: "retail-customer",
      edit: Icons.edit,
      eMail: '',
      password: "",
      state: ""),
  UserModel(
      reference: "000000000 000000 0000 00000",
      firstName: "Gökhan",
      lastName: "Basut",
      status: Icons.check_circle,
      tags: "retail-customer",
      edit: Icons.edit,
      eMail: '',
      password: "",
      state: ""),
  UserModel(
      reference: "000000000 000000 0000 00000",
      firstName: "İsmail",
      lastName: "Türüt",
      status: Icons.timer_sharp,
      tags: "bank-staff",
      edit: Icons.edit,
      eMail: '',
      password: "",
      state: ""),
  UserModel(
      reference: "000000000 000000 0000 00000",
      firstName: "Daft",
      lastName: "Punk",
      status: Icons.cancel,
      tags: "bank-staff",
      edit: Icons.edit,
      eMail: '',
      password: "",
      state: ""),
  UserModel(
      reference: "000000000 000000 0000 00000",
      firstName: "Linkin",
      lastName: "Park",
      status: Icons.check_circle,
      tags: "potential-customer, bank-staff",
      edit: Icons.edit,
      eMail: '',
      password: "",
      state: ""),
  UserModel(
      reference: "000000000 000000 0000 00000",
      firstName: "Orhan",
      lastName: "Gencebay",
      status: Icons.cancel,
      tags: "potential-customer",
      edit: Icons.edit,
      eMail: '',
      password: "",
      state: ""),
];
