// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TitleModel {
  String trTR;
  String enEN;

  TitleModel({
    required this.trTR,
    required this.enEN,
  });

  factory TitleModel.fromMap(Map<String, dynamic> json) {
    return TitleModel(
      trTR: json['tr-TR'] ?? "",
      enEN: json['en-EN'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tr-TR'] = trTR;
    data['en-EN'] = enEN;
    return data;
  }

  TitleModel copyWith({
    String? trTR,
    String? enEN,
  }) {
    return TitleModel(
      trTR: trTR ?? this.trTR,
      enEN: enEN ?? this.enEN,
    );
  }

  String toJson() => json.encode(toMap());

  factory TitleModel.fromJson(String source) => TitleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TitleModel(trTR: $trTR, enEN: $enEN)';

  @override
  bool operator ==(covariant TitleModel other) {
    if (identical(this, other)) return true;

    return other.trTR == trTR && other.enEN == enEN;
  }

  @override
  int get hashCode => trTR.hashCode ^ enEN.hashCode;
}
