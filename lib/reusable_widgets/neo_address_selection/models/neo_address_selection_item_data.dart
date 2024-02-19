/*
 * neo_bank
 *
 * Created on 25/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:backoffice/reusable_widgets/neo_address_selection/models/neo_address_selection_response_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/base_dropdown_item_data.dart';
import 'package:backoffice/util/neo_util.dart';

// ignore: must_be_immutable
class NeoAddressSelectionItemData extends BaseDropdownItemData {
  NeoAddressSelectionItemData({
    required super.formData,
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
    super.isInitiallySelected = false,
  });

  final int? cityCode;
  final String cityName;
  final int? townCode;
  final String townName;
  final String districtName;
  final String streetName;
  final int? addressType;
  final String addressDetail;
  final String fullAddressInfo;
  final String type;
  final String addressIconUrn;

  // STOPSHIP: Check formData
  factory NeoAddressSelectionItemData.fromNetworkData(NeoAddressSelectionResponseData response) => NeoAddressSelectionItemData(
        formData: response.toJson(),
        cityCode: response.cityCode,
        cityName: response.cityName.orEmpty,
        townCode: response.townCode,
        townName: response.townName.orEmpty,
        districtName: response.districtName.orEmpty,
        streetName: response.streetName.orEmpty,
        addressType: response.addressType,
        addressDetail: response.addressDetail.orEmpty,
        fullAddressInfo: response.fullAddressInfo.orEmpty,
        type: response.type.orEmpty,
        addressIconUrn: response.addressIconUrn.orEmpty,
      );

  @override
  List<Object?> get props => [
        formData,
        isInitiallySelected,
        districtName,
        fullAddressInfo,
        type,
        addressIconUrn,
      ];
}
