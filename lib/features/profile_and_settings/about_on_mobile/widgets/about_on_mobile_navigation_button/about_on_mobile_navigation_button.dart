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

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:backoffice/core/pages/neo_page_id.dart';
import 'package:backoffice/reusable_widgets/neo_category_item_widget/neo_category_item_widget.dart';
import 'package:backoffice/reusable_widgets/neo_divider/neo_divider.dart';
import 'package:backoffice/util/constants/neo_constants.dart';

abstract class _Constants {
  static const String title = "profileAndSettings_aboutOnMobil_technologies_title";
  static const String body = "profileAndSettings_aboutOnMobil_technologies_text";
}

class AboutOnMobileNavigationButton extends StatelessWidget {
  const AboutOnMobileNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !kIsWeb,
      child: Column(
        children: [
          NeoDivider(
            color: NeoColors.borderMediumLight,
          ),
          const NeoCategoryItemWidget(
            navigationPath: NeoPageId.settingsUsedTechnologies,
            title: _Constants.title,
            body: _Constants.body,
            hasChevron: true,
            padding: EdgeInsetsDirectional.symmetric(horizontal: NeoDimens.px24, vertical: NeoDimens.px16),
          ),
          NeoDivider(
            color: NeoColors.borderMediumLight,
          ),
        ],
      ),
    );
  }
}
