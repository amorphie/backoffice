/*
 * 
 * Neobank.Client
 * 
 * Created on 22/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_annotation/json_annotation.dart';

part 'neo_address_selection_response_data.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class NeoAddressSelectionResponseData {
  NeoAddressSelectionResponseData({
    required this.cityCode,
    required this.cityName,
    required this.townCode,
    required this.townName,
    required this.districtName,
    required this.streetName,
    required this.addressType,
    required this.addressDetail,
    required this.fullAddressInfo,
    required this.type,
    required this.addressIconUrn,
  });

  @JsonKey(name: "cityCode")
  final int? cityCode;

  @JsonKey(name: "cityName")
  final String? cityName;

  @JsonKey(name: "townCode")
  final int? townCode;

  @JsonKey(name: "townName")
  final String? townName;

  @JsonKey(name: "districtName")
  final String? districtName;

  @JsonKey(name: "streetName")
  final String? streetName;

  @JsonKey(name: "addressType", defaultValue: 1)
  final int addressType;

  @JsonKey(name: "addressDetail")
  final String? addressDetail;

  @JsonKey(name: "fullAddressInfo")
  final String? fullAddressInfo;

  @JsonKey(name: "type", includeToJson: false)
  final String? type;

  @JsonKey(name: "addressIconUrn", includeToJson: false)
  final String? addressIconUrn;

  factory NeoAddressSelectionResponseData.fromJson(Map<String, dynamic> json) =>
      _$NeoAddressSelectionResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$NeoAddressSelectionResponseDataToJson(this);
}
