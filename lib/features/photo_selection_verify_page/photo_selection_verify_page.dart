/*
 * neo_bank
 *
 * Created on 27/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';

class PhotoSelectionVerifyPage extends StatelessWidget {
  const PhotoSelectionVerifyPage({required this.imagePath, super.key});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: kIsWeb ? SizedBox(child: Image.network(imagePath)) : SizedBox(child: Image.file(File(imagePath))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => NeoWidgetEventKeys.globalNavigationPop.sendEvent(),
                child: NeoText(
                  LocalizationKey.generalDismissPictureButton.loc(),
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              TextButton(
                onPressed: () {
                  NeoWidgetEventKeys.neoAvatarChangePhotoEventKey.sendEvent(data: imagePath);
                  NeoWidgetEventKeys.globalNavigationPop.sendEvent();
                },
                child: NeoText(
                  LocalizationKey.generalSelectPlaceholder.loc(),
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          ).paddingSymmetric(vertical: NeoDimens.px12),
        ],
      ),
    );
  }
}
