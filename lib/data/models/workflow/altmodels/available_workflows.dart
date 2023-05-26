// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'transitions.dart';

class RunningWorkflowsModel {
  String? name;
  String? title;
  List<TransitionsModel>? transitions;
  RunningWorkflowsModel({
    this.name,
    this.title,
    this.transitions,
  });

  RunningWorkflowsModel copyWith({
    String? name,
    String? title,
    List<TransitionsModel>? transitions,
  }) {
    return RunningWorkflowsModel(
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

  factory RunningWorkflowsModel.fromMap(Map<String, dynamic> map) {
    return RunningWorkflowsModel(
      name: map['name'] != null ? map['name'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      transitions: map['transitions'] != null
          ? List<TransitionsModel>.from(
              (map['transitions']).map<TransitionsModel?>(
                (x) => TransitionsModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RunningWorkflowsModel.fromJson(String source) => RunningWorkflowsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AvailableWorkflowModel(name: $name, title: $title, transitions: $transitions)';

  @override
  bool operator ==(covariant RunningWorkflowsModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.title == title && listEquals(other.transitions, transitions);
  }

  @override
  int get hashCode => name.hashCode ^ title.hashCode ^ transitions.hashCode;
}
