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

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:backoffice/core/navigation/navigation_helper.dart';
import 'package:backoffice/core/pages/neo_page_id.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_list_tile_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/usecases/display_list_tile_bottom_sheet.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_assets.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';

class DisplayImagePickerBottomSheet {
  final NeoNavigationHelper neoNavigationHelper;

  DisplayImagePickerBottomSheet() : neoNavigationHelper = NeoNavigationHelper();

  void call(BuildContext context, {required bool deleteImageDataVisibility}) {
    const DisplayListTileBottomSheet().call(
      context,
      "Fotoğrafı Düzenle", // STOPSHIP: Handle localization
      [
        NeoDropdownListTileData(
          formData: "",
          displayData: "Fotoğraf Çek", // STOPSHIP: Handle localization
          leadingIconUrn: NeoAssets.takePicture.urn,
          onPressed: () {
            _getImageFromCamera(context);
          },
        ),
        NeoDropdownListTileData(
          formData: "",
          displayData: "Kütüphaneden Seç",
          leadingIconUrn: NeoAssets.selectFromGallery.urn,
          onPressed: () {
            _getImageFromGallery(context);
          },
        ),
        if (deleteImageDataVisibility)
          NeoDropdownListTileData(
            formData: "",
            displayData: "Fotoğrafı Kaldır", // STOPSHIP: Handle localization
            leadingIconUrn: NeoAssets.trash.urn,
            onPressed: () {
              NeoWidgetEventKeys.neoAvatarDeletePhotoEventKey.sendEvent();
            },
          ),
      ],
    );
  }

  Future<void> _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickerFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickerFile != null && context.mounted) {
      await _handleNavigation(context, pickerFile);
    }
  }

  Future<void> _getImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    final pickerFile = await picker.pickImage(source: ImageSource.camera);
    if (pickerFile != null && context.mounted) {
      await _handleNavigation(context, pickerFile);
    }
  }

  Future<void> _handleNavigation(BuildContext context, XFile pickerFile) async {
    await neoNavigationHelper.navigate(
      context: context,
      navigationType: NeoNavigationType.push,
      navigationPath: "${NeoPageId.photoSelectionVerify}?imagePath=${pickerFile.path}",
    );
  }
}
