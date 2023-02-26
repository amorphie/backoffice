// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PhoneModel {
  int? countryCode;
  int? prefix;
  int? number;
  PhoneModel({
    this.countryCode,
    this.prefix,
    this.number,
  });
  String get phoneNumber =>
      "${countryCode ?? 0} ${prefix ?? 0} ${number ?? 0} ";

  factory PhoneModel.init() {
    return PhoneModel(countryCode: 90, number: 000000, prefix: 500);
  }

  PhoneModel copyWith({
    int? countryCode,
    int? prefix,
    int? number,
  }) {
    return PhoneModel(
      countryCode: countryCode ?? this.countryCode,
      prefix: prefix ?? this.prefix,
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'countryCode': countryCode,
      'prefix': prefix,
      'number': number,
    };
  }

  factory PhoneModel.fromMap(Map<String, dynamic> map) {
    return PhoneModel(
      countryCode:
          map['countryCode'] != null ? map['countryCode'] as int : null,
      prefix: map['prefix'] != null ? map['prefix'] as int : null,
      number: map['number'] != null ? map['number'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhoneModel.fromJson(String source) =>
      PhoneModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PhoneModel(countryCode: $countryCode, prefix: $prefix, number: $number)';

  @override
  bool operator ==(covariant PhoneModel other) {
    if (identical(this, other)) return true;

    return other.countryCode == countryCode &&
        other.prefix == prefix &&
        other.number == number;
  }

  @override
  int get hashCode => countryCode.hashCode ^ prefix.hashCode ^ number.hashCode;
}
