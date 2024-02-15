/*
 * neo_bank
 *
 * Created on 10/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/adapters/neo_dropdown_base_adapter.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/base_dropdown_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/neo_dropdown_list_tile_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_widgets/neo_list_tile_item_widget.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoImagePickerDropdownAdapter extends NeoDropdownBaseAdapter<NeoDropdownListTileData> {
  final Function getImageFromCamera;
  final Function getImageFromGallery;
  final bool deleteImageDataVisibility;

  NeoImagePickerDropdownAdapter({
    required this.getImageFromCamera,
    required this.getImageFromGallery,
    required this.deleteImageDataVisibility,
  });

  @override
  List<NeoDropdownListTileData> get itemList => [
        NeoDropdownListTileData(
          formData: "",
          displayData: LocalizationKey.generalTakePictureButton.loc(),
          leadingIconUrn: NeoAssets.cameraPhoto24px.urn,
          onPressed: () => getImageFromCamera(),
        ),
        NeoDropdownListTileData(
          formData: "",
          displayData: LocalizationKey.generalSelectPictureButton.loc(),
          leadingIconUrn: NeoAssets.imageAdd24px.urn,
          onPressed: () => getImageFromGallery(),
        ),
        if (deleteImageDataVisibility)
          NeoDropdownListTileData(
            formData: "",
            displayData: LocalizationKey.generalRemovePictureButton.loc(),
            leadingIconUrn: NeoAssets.trash24px.urn,
            onPressed: () => NeoWidgetEventKeys.neoAvatarDeletePhotoEventKey.sendEvent(),
          ),
      ];

  @override
  String get bottomSheetTitle => LocalizationKey.generalEditPictureTitle.loc();

  @override
  String? get searchHintText => null;

  @override
  String get submitButtonText => "";

  @override
  bool get displaySubmitButton => false;

  @override
  Widget Function(BuildContext) get unselectedBuilder => (BuildContext context) {
        return _buildContent();
      };

  @override
  Widget Function(BuildContext, BaseDropdownItemData) get selectedBuilder => (
        BuildContext context,
        BaseDropdownItemData selectedItem,
      ) {
        return _buildContent();
      };

  @override
  NeoDropdownBottomSheetItemBuilder<BaseDropdownItemData> get bottomSheetItemBuilder => (context, item) {
        return NeoListTileItemWidget(item: item as NeoDropdownListTileData);
      };

  Widget _buildContent() {
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(NeoRadius.rounded)),
      child: NeoIcon(
        iconUrn: NeoAssets.edit16px.urn,
        color: NeoColors.iconPrimaryGreenDark,
      ).paddingAll(NeoDimens.px2),
    );
  }

  @override
  List<NeoDropdownListTileData>? Function(String key) get filterItems => (key) {
        return itemList;
      };
}
