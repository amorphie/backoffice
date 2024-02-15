/*
 * 
 * neo_bank
 * 
 * Created on 18/1/2024.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:backoffice/core/managers/permission_manager/permission_manager.dart';
import 'package:backoffice/core/pages/neo_page_id.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';

class PickLocalImageUsecase {
  Future<void> pickFromGallery(BuildContext context) async {
    if (!kIsWeb) {
      final isGranted = await PermissionManager.checkGalleryPermission(context);
      if (!isGranted) {
        return;
      }
    }
    final picker = ImagePicker();
    final pickerFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickerFile != null) {
      _handleNavigation(pickerFile);
    }
  }

  Future<void> pickFromCamera(BuildContext context) async {
    try {
      final isGranted = await PermissionManager.checkCameraPermission(context);
      if (!isGranted) {
        return;
      }
      final picker = ImagePicker();
      final pickerFile = await picker.pickImage(source: ImageSource.camera);
      if (pickerFile != null) {
        _handleNavigation(pickerFile);
      }
    } catch (e) {
      // TODO: Notify user for permission is required case
    }
  }

  void _handleNavigation(XFile pickerFile) {
    NeoWidgetEventKeys.globalNavigationPush.sendEvent(
      data: "${NeoPageId.photoSelectionVerify}?imagePath=${pickerFile.path}",
    );
  }
}
