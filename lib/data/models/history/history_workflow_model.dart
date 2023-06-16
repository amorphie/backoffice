// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:admin/data/models/history/history_model.dart';

class HistoryWorkflowModel {
  String instanceId;
  String name;
  List<HistoryModel> transitions;
  HistoryWorkflowModel({
    required this.instanceId,
    required this.name,
    required this.transitions,
  });

  HistoryWorkflowModel copyWith({
    String? instanceId,
    String? name,
    List<HistoryModel>? transitions,
  }) {
    return HistoryWorkflowModel(
      instanceId: instanceId ?? this.instanceId,
      name: name ?? this.name,
      transitions: transitions ?? this.transitions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'instanceId': instanceId,
      'name': name,
      'transitions': transitions.map((x) => x.toMap()).toList(),
    };
  }

  factory HistoryWorkflowModel.fromMap(Map<String, dynamic> map) {
    return HistoryWorkflowModel(
      instanceId: map['instanceId'] as String,
      name: map['name'] as String,
      transitions: List<HistoryModel>.from(
        (map['transitions']).map<HistoryModel>(
          (x) => HistoryModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryWorkflowModel.fromJson(String source) => HistoryWorkflowModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HistoryWorkflowModel(instanceId: $instanceId, name: $name, transitions: $transitions)';

  @override
  bool operator ==(covariant HistoryWorkflowModel other) {
    if (identical(this, other)) return true;

    return other.instanceId == instanceId && other.name == name && listEquals(other.transitions, transitions);
  }

  @override
  int get hashCode => instanceId.hashCode ^ name.hashCode ^ transitions.hashCode;
}
