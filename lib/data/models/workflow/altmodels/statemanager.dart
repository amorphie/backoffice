// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'transitions.dart';

class StateManagerModel {
  String? name;
  String? title;
  List<TransitionsModel>? transitions;
  String? status;
  StateManagerModel({
    this.name,
    this.title,
    this.transitions,
    this.status,
  });

  StateManagerModel copyWith({
    String? name,
    String? title,
    List<TransitionsModel>? transitions,
    String? status,
  }) {
    return StateManagerModel(
      name: name ?? this.name,
      title: title ?? this.title,
      transitions: transitions ?? this.transitions,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'title': title,
      'transitions': transitions!.map((x) => x.toMap()).toList(),
      'status': status,
    };
  }

  factory StateManagerModel.fromMap(Map<String, dynamic> map) {
    return StateManagerModel(
      name: map['name'] != null ? map['name'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      transitions: map['transitions'] != null
          ? List<TransitionsModel>.from(
              (map['transitions']).map<TransitionsModel?>(
                (x) => TransitionsModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StateManagerModel.fromJson(String source) => StateManagerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StateManagerModel(name: $name, title: $title, transitions: $transitions, status: $status)';
  }

  @override
  bool operator ==(covariant StateManagerModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.title == title && listEquals(other.transitions, transitions) && other.status == status;
  }

  @override
  int get hashCode {
    return name.hashCode ^ title.hashCode ^ transitions.hashCode ^ status.hashCode;
  }
}
