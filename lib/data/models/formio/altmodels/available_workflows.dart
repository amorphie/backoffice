// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../transitions.dart';

class AvailableWorkflowModel {
  String? name;
  String? title;
  List<TransitionsModel>? transitions;
  AvailableWorkflowModel({
    this.name,
    this.title,
    this.transitions,
  });

  AvailableWorkflowModel copyWith({
    String? name,
    String? title,
    List<TransitionsModel>? transitions,
  }) {
    return AvailableWorkflowModel(
      name: name ?? this.name,
      title: title ?? this.title,
      transitions: transitions ?? this.transitions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'title': title,
      'transitions': transitions!.map((x) => x.toMap()).toList(),
    };
  }

  factory AvailableWorkflowModel.fromMap(Map<String, dynamic> map) {
    return AvailableWorkflowModel(
      name: map['name'] != null ? map['name'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      transitions: map['transitions'] != null
          ? List<TransitionsModel>.from(
              (map['transitions'] as List<int>).map<TransitionsModel?>(
                (x) => TransitionsModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AvailableWorkflowModel.fromJson(String source) =>
      AvailableWorkflowModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AvailableWorkflowModel(name: $name, title: $title, transitions: $transitions)';

  @override
  bool operator ==(covariant AvailableWorkflowModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.title == title &&
        listEquals(other.transitions, transitions);
  }

  @override
  int get hashCode => name.hashCode ^ title.hashCode ^ transitions.hashCode;
}
