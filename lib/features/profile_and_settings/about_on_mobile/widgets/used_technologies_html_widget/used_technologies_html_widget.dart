/*
 * neo_bank
 *
 * Created on 19/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_html_widget/neo_html_widget.dart';

abstract class _Constants {
  static const String iosLicencePath = "assets/html/ios_libraries.html";
  static const String androidLicencePath = "assets/html/android_pods_licence.html";
}

class UsedTechnologiesHtmlWidget extends StatelessWidget {
  const UsedTechnologiesHtmlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NeoHtmlWidget(
      filePath: Platform.isIOS ? _Constants.iosLicencePath : _Constants.androidLicencePath,
    );
  }
}
