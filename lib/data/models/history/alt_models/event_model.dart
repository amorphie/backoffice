// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/data/models/history/alt_models/data_model.dart';

class HistoryEventsModel {
  String id;
  String name;
  String executedAt;
  int duration;
  HistoryDataModel inputData;
  HistoryDataModel outputData;
  HistoryDataModel details;
  HistoryEventsModel({
    required this.id,
    required this.name,
    required this.executedAt,
    required this.duration,
    required this.inputData,
    required this.outputData,
    required this.details,
  });

  HistoryEventsModel copyWith({
    String? id,
    String? name,
    String? executedAt,
    int? duration,
    HistoryDataModel? inputData,
    HistoryDataModel? outputData,
    HistoryDataModel? details,
  }) {
    return HistoryEventsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      executedAt: executedAt ?? this.executedAt,
      duration: duration ?? this.duration,
      inputData: inputData ?? this.inputData,
      outputData: outputData ?? this.outputData,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'executedAt': executedAt,
      'duration': duration,
      'inputData': inputData.toMap(),
      'outputData': outputData.toMap(),
      'details': details.toMap(),
    };
  }

  factory HistoryEventsModel.fromMap(Map<String, dynamic> map) {
    return HistoryEventsModel(
      id: map['id'] as String,
      name: map['name'] as String,
      executedAt: map['executedAt'] as String,
      duration: map['duration'] as int,
      inputData:
          HistoryDataModel.fromMap(map['inputData'] as Map<String, dynamic>),
      outputData:
          HistoryDataModel.fromMap(map['outputData'] as Map<String, dynamic>),
      details: HistoryDataModel.fromMap(map['details'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryEventsModel.fromJson(String source) =>
      HistoryEventsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HistoryEventsModel(id: $id, name: $name, executedAt: $executedAt, duration: $duration, inputData: $inputData, outputData: $outputData, details: $details)';
  }

  @override
  bool operator ==(covariant HistoryEventsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.executedAt == executedAt &&
        other.duration == duration &&
        other.inputData == inputData &&
        other.outputData == outputData &&
        other.details == details;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        executedAt.hashCode ^
        duration.hashCode ^
        inputData.hashCode ^
        outputData.hashCode ^
        details.hashCode;
  }
}
