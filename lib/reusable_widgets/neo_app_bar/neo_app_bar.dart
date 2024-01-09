import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/bloc/neo_app_bar_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/model/neo_app_bar_action_model.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/model/neo_app_bar_left_widget_type.dart';
import 'package:backoffice/reusable_widgets/neo_button/bloc/neo_button_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_button/i_neo_button.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_language_switch/neo_language_switch.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/bus/neo_bus.dart';

part 'widgets/neo_app_bar_back_button.dart';

class NeoAppBar extends AppBar {
  final String? _titleText;

  final String? backTransitionId;

  final List<NeoAppBarActionModel> actionList;

  final NeoAppBarLeftWidgetType? leftWidgetType;

  NeoAppBar({
    this.leftWidgetType,
    String? title,
    this.backTransitionId,
    this.actionList = const [],
    super.key,
  })  : _titleText = title,
        super(
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          scrolledUnderElevation: 0,
        );

  @override
  List<Widget>? get actions => _getActions();

  @override
  Widget? get title => _getTitleWidget();

  @override
  Widget? get leading {
    switch (leftWidgetType) {
      case NeoAppBarLeftWidgetType.backButton:
        return _NeoAppBarBackButton(transitionId: backTransitionId.orEmpty);
      case NeoAppBarLeftWidgetType.languageSwitch:
        return const NeoLanguageSwitch();
      case null:
        return null;
    }
  }

  List<Widget>? _getActions() {
    return actionList
        .map(
          (action) => IconButton(
            // STOPSHIP: Remove this and use NeoIconButton instead after added
            onPressed: () {
              if (action.widgetEventKey != null) {
                getIt.get<NeoWidgetEventBus>().addEvent(NeoWidgetEvent(eventId: action.widgetEventKey!));
              }
            },
            icon: NeoIcon(iconUrn: action.iconUrn),
          ),
        )
        .toList();
  }

  Widget? _getTitleWidget() {
    if (_titleText != null) {
      return Text(_titleText, style: NeoTextStyles.titleSixteenSemibold);
    } else {
      return NeoIcon(iconUrn: NeoAssets.onAppBarIcon.urn);
    }
  }
}
