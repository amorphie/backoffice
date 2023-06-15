// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HistoryDataModel {
  String additionalProp1;
  String additionalProp2;
  String additionalProp3;
  HistoryDataModel({
    required this.additionalProp1,
    required this.additionalProp2,
    required this.additionalProp3,
  });

  HistoryDataModel copyWith({
    String? additionalProp1,
    String? additionalProp2,
    String? additionalProp3,
  }) {
    return HistoryDataModel(
      additionalProp1: additionalProp1 ?? this.additionalProp1,
      additionalProp2: additionalProp2 ?? this.additionalProp2,
      additionalProp3: additionalProp3 ?? this.additionalProp3,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'additionalProp1': additionalProp1,
      'additionalProp2': additionalProp2,
      'additionalProp3': additionalProp3,
    };
  }

  factory HistoryDataModel.fromMap(Map<String, dynamic> map) {
    return HistoryDataModel(
      additionalProp1: map['additionalProp1'] as String,
      additionalProp2: map['additionalProp2'] as String,
      additionalProp3: map['additionalProp3'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryDataModel.fromJson(String source) =>
      HistoryDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'HistoryDataModel(additionalProp1: $additionalProp1, additionalProp2: $additionalProp2, additionalProp3: $additionalProp3)';

  @override
  bool operator ==(covariant HistoryDataModel other) {
    if (identical(this, other)) return true;

    return other.additionalProp1 == additionalProp1 &&
        other.additionalProp2 == additionalProp2 &&
        other.additionalProp3 == additionalProp3;
  }

  @override
  int get hashCode =>
      additionalProp1.hashCode ^
      additionalProp2.hashCode ^
      additionalProp3.hashCode;
}
