// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HistorySubmitDataModel {
  String entityData;
  String formData;
  String additionalData;
  HistorySubmitDataModel({
    required this.entityData,
    required this.formData,
    required this.additionalData,
  });

  HistorySubmitDataModel copyWith({
    String? entityData,
    String? formData,
    String? additionalData,
  }) {
    return HistorySubmitDataModel(
      entityData: entityData ?? this.entityData,
      formData: formData ?? this.formData,
      additionalData: additionalData ?? this.additionalData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'entityData': entityData,
      'formData': formData,
      'additionalData': additionalData,
    };
  }

  factory HistorySubmitDataModel.fromMap(Map<String, dynamic> map) {
    return HistorySubmitDataModel(
      entityData: map['entityData'] as String,
      formData: map['formData'] as String,
      additionalData: map['additionalData'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistorySubmitDataModel.fromJson(String source) =>
      HistorySubmitDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'HistorySubmitDataModel(entityData: $entityData, formData: $formData, additionalData: $additionalData)';

  @override
  bool operator ==(covariant HistorySubmitDataModel other) {
    if (identical(this, other)) return true;

    return other.entityData == entityData &&
        other.formData == formData &&
        other.additionalData == additionalData;
  }

  @override
  int get hashCode =>
      entityData.hashCode ^ formData.hashCode ^ additionalData.hashCode;
}
