import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'transition_model.dart';

class StateManager {
  String name;
  String title;
  List<TransitionModel>? transitions;

  StateManager({
    required this.name,
    required this.title,
    this.transitions,
  });

  StateManager copyWith({
    String? name,
    String? title,
    List<TransitionModel>? transitions,
  }) {
    return StateManager(
      name: name ?? this.name,
      title: title ?? this.title,
      transitions: transitions ?? this.transitions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'title': title,
      'transitions': transitions?.map((x) => x.toMap()).toList(),
    };
  }

  factory StateManager.fromMap(Map<String, dynamic> map) {
    return StateManager(
      name: map['name'] as String,
      title: map['title'] as String,
      transitions: map['transitions'] != null
          ? List<TransitionModel>.from(
              (map['transitions']).map<TransitionModel>(
                (x) => TransitionModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StateManager.fromJson(String source) => StateManager.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StateManager(name: $name, title: $title, transitions: $transitions)';

  @override
  bool operator ==(covariant StateManager other) {
    if (identical(this, other)) return true;

    return other.name == name && other.title == title && listEquals(other.transitions, transitions);
  }

  @override
  int get hashCode => name.hashCode ^ title.hashCode ^ transitions.hashCode;
}
