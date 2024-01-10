import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brg_phone_number.g.dart';

@JsonSerializable()
class BrgPhoneNumber extends Equatable {
  @JsonKey(name: "countryCode")
  final String countryCode;

  @JsonKey(name: "prefix")
  final String prefix;

  @JsonKey(name: "number")
  final String number;

  const BrgPhoneNumber({
    required this.countryCode,
    required this.prefix,
    required this.number,
  });

  @override
  List<Object?> get props => [countryCode, prefix, number];

  Map<String, dynamic> toJson() => _$BrgPhoneNumberToJson(this);

  factory BrgPhoneNumber.fromJson(Map<String, dynamic> json) => _$BrgPhoneNumberFromJson(json);
}
