// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HistoryResponseDataModel {
  String fieldUpdates;
  String status;
  HistoryResponseDataModel({
    required this.fieldUpdates,
    required this.status,
  });

  HistoryResponseDataModel copyWith({
    String? fieldUpdates,
    String? status,
  }) {
    return HistoryResponseDataModel(
      fieldUpdates: fieldUpdates ?? this.fieldUpdates,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fieldUpdates': fieldUpdates,
      'status': status,
    };
  }

  factory HistoryResponseDataModel.fromMap(Map<String, dynamic> map) {
    return HistoryResponseDataModel(
      fieldUpdates: map['fieldUpdates'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryResponseDataModel.fromJson(String source) =>
      HistoryResponseDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'HistoryResponseDataModel(fieldUpdates: $fieldUpdates, status: $status)';

  @override
  bool operator ==(covariant HistoryResponseDataModel other) {
    if (identical(this, other)) return true;

    return other.fieldUpdates == fieldUpdates && other.status == status;
  }

  @override
  int get hashCode => fieldUpdates.hashCode ^ status.hashCode;
}
