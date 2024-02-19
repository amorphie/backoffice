/*
 * 
 * neo_ui
 * 
 * Created on 8/01/2024.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/core_widgets/neo_app/bloc/neo_app_bloc.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_category_item_widget/neo_category_item_widget.dart';
import 'package:backoffice/reusable_widgets/neo_image/neo_image.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

part 'widgets/neo_theme_selector_item.dart';

enum ThemeMode { light, dark, system }

abstract class _Constants {
  static const borderColorWidth = 3.0;
  static const imageHeight = 80.0;
}

class NeoThemeSelector extends StatelessWidget {
  final String? iconUrn;
  final String? title;
  final EdgeInsetsDirectional padding;

  const NeoThemeSelector({
    this.iconUrn,
    this.title,
    this.padding = EdgeInsetsDirectional.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: _buildThemeSelector(),
    );
  }

  Widget _buildThemeSelector() {
    return DecoratedBox(
      decoration: const BoxDecoration(color: NeoColors.baseWhite),
      child: Column(
        children: [
          NeoCategoryItemWidget(
            iconUrn: NeoAssets.changeScreenMode20px.urn,
            title: LocalizationKey.profileAndSettingsAppSettingsThemeLabel.loc(),
          ),
          BlocBuilder<NeoAppBloc, NeoAppState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ThemeSelectorItem(
                    onTap: () {
                      context.read<NeoAppBloc>().add(NeoAppEventChangeAppTheme(selectedTheme: ThemeMode.light.name));
                    },
                    image: NeoAssets.themeLightImage.urn,
                    text: LocalizationKey.profileAndSettingsAppSettingsLightThemeLabel.loc(),
                    isSelected: state.appTheme == ThemeMode.light.name,
                  ),
                  ThemeSelectorItem(
                    onTap: () {
                      context.read<NeoAppBloc>().add(NeoAppEventChangeAppTheme(selectedTheme: ThemeMode.dark.name));
                    },
                    image: NeoAssets.themeDarkImage.urn,
                    text: LocalizationKey.profileAndSettingsAppSettingsDarkThemeLabel.loc(),
                    isSelected: state.appTheme == ThemeMode.dark.name,
                  ),
                  ThemeSelectorItem(
                    onTap: () {
                      context.read<NeoAppBloc>().add(NeoAppEventChangeAppTheme(selectedTheme: ThemeMode.system.name));
                    },
                    image: NeoAssets.themeSystemImage.urn,
                    text: LocalizationKey.profileAndSettingsAppSettingsSystemThemeLabel.loc(),
                    isSelected: state.appTheme == ThemeMode.system.name,
                  ),
                ],
              );
            },
          ).paddingOnly(top: NeoDimens.px12),
        ],
      ),
    );
  }
}
