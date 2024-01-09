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
import 'package:flutter/material.dart';
import 'package:backoffice/features/photo_selection_verify_page/photo_selection_verify_page.dart';

@immutable
class PhotoSelectionVerifyPageRoute extends StatelessWidget {
  const PhotoSelectionVerifyPageRoute({super.key, this.arguments});
  final Map<String, String>? arguments;

  @override
  Widget build(BuildContext context) {
    return PhotoSelectionVerifyPage(
      imagePath: arguments?["imagePath"] ?? '',
    );
  }
}
