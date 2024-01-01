/*
 * Neobank.Client
 *
 * Created on 6/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/core/localization/bloc/localization_bloc.dart';
import 'package:admin/core/localization/language.dart';
import 'package:admin/ui/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:admin/core/util/neo_util.dart';

class NeoLanguageSwitch extends StatelessWidget {
  const NeoLanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final localizationBloc = context.watch<LocalizationBloc>();
    return IconButton(
      icon: NeoIcon(
        iconUrn: _buttonIconUrn,
        color: NeoColors.iconLight,
      ),
      onPressed: () => localizationBloc.add(LocalizationEventSwitchLanguage()),
    );
  }

  String get _buttonIconUrn {
    if (_targetLanguage == Language.turkish) {
      return NeoAssets.languageSwitchSquareTr.urn;
    } else {
      return NeoAssets.languageSwitchSquareEn.urn;
    }
  }

  Language get _targetLanguage {
    if (LocalizationBloc.currentLanguage == Language.english) {
      return Language.turkish;
    } else {
      return Language.english;
    }
  }
}
