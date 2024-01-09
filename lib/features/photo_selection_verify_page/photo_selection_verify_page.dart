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

import 'package:flutter/material.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';

class PhotoSelectionVerifyPage extends StatelessWidget {
  const PhotoSelectionVerifyPage({required this.imagePath, super.key});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SizedBox(child: Image.file(File(imagePath))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  //STOPSHIP add localization
                  'Vazgeç',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              TextButton(
                onPressed: () {
                  NeoWidgetEventKeys.neoAvatarChangePhotoEventKey.sendEvent(data: imagePath);
                  Navigator.pop(context);
                },
                child: const Text(
                  //STOPSHIP add localization
                  'Seç',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          ).paddingSymmetric(vertical: NeoDimens.px12),
        ],
      ),
    );
  }
}
