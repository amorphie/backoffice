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

import 'package:flutter/material.dart';
import 'package:backoffice/core/localization/bloc/localization_bloc.dart';
import 'package:backoffice/core/localization/language.dart';
import 'package:backoffice/reusable_widgets/neo_category_item_widget/neo_category_item_widget.dart';
import 'package:backoffice/reusable_widgets/neo_segmented_button/neo_segmented_button.dart';
import 'package:backoffice/util/neo_util.dart';

class SegmentedLanguageSwitch extends StatelessWidget {
  final EdgeInsetsDirectional padding;

  const SegmentedLanguageSwitch({this.padding = EdgeInsetsDirectional.zero, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NeoCategoryItemWidget(
          iconUrn: NeoAssets.languageSquare20px.urn,
          title: "profileAndSettings_appSettings_language_label",
        ).paddingOnly(bottom: NeoDimens.px16),
        NeoSegmentedButton(
          widgetEventKey: "neoSegmentedButtonChangeLanguage",
          segments: Language.values
              .map(
                (e) => e.languageCode == Language.english.languageCode ? Language.english.languageName : Language.turkish.languageName,
              )
              .toList(),
          initiallySelectedSegment: LocalizationBloc.currentLanguage?.languageCode == Language.english.languageCode ? Language.english.languageName : Language.turkish.languageName,
        ),
      ],
    ).padding(padding);
  }
}
