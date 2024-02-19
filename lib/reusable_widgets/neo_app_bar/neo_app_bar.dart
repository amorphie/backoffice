import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_manager.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/bloc/neo_app_bar_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/model/neo_app_bar_left_widget_type.dart';
import 'package:backoffice/reusable_widgets/neo_button/bloc/neo_button_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_button/i_neo_button.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_language_switch/neo_language_switch.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';

part 'widgets/neo_app_bar_back_button.dart';

class NeoAppBar extends AppBar {
  final String? _titleText;
  final String? backTransitionId;
  final NeoAppBarLeftWidgetType? leftWidgetType;
  final String? cachedTitleKey;

  NeoAppBar({
    String? title,
    Brightness? statusBarIconBrightness = Brightness.dark,
    this.leftWidgetType,
    this.backTransitionId,
    this.cachedTitleKey,
    super.actions,
    super.key,
  })  : _titleText = title,
        super(
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: statusBarIconBrightness,
          ),
          scrolledUnderElevation: 0,
        );

  @override
  Widget? get title => _getTitleWidget();

  @override
  Widget? get leading {
    switch (leftWidgetType) {
      case NeoAppBarLeftWidgetType.backButton:
        return _NeoAppBarBackButton(transitionId: backTransitionId);
      case NeoAppBarLeftWidgetType.languageSwitch:
        return const NeoLanguageSwitch();
      case null:
        return null;
    }
  }

  Widget? _getTitleWidget() {
    if (!cachedTitleKey.isNullOrBlank) {
      final String cachedTitle = GetIt.I<NeoParameterManager>().readFromCache(cachedTitleKey!);
      return NeoText(cachedTitle, style: NeoTextStyles.titleSixteenSemibold);
    } else {
      if (_titleText != null) {
        return NeoText(_titleText, style: NeoTextStyles.titleSixteenSemibold);
      } else {
        return NeoIcon(iconUrn: NeoAssets.onAppBarLogo.urn);
      }
    }
  }
}
