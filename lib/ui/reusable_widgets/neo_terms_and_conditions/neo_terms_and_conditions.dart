import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/core/dependency_injection/dependency_injection.dart';
import 'package:admin/core/util/constants/neo_widget_event_keys.dart';
import 'package:admin/core/util/neo_util.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event_bus.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class NeoTermsAndConditions extends StatefulWidget {
  final String? dataKey;
  final String titleText;
  final String contentText;
  final EdgeInsetsDirectional padding;

  const NeoTermsAndConditions({
    this.dataKey,
    this.titleText = "",
    this.contentText = "",
    this.padding = const EdgeInsetsDirectional.only(
      start: 24,
      end: 24,
      bottom: 120,
      top: 24,
    ),
    Key? key,
  }) : super(key: key);

  @override
  State<NeoTermsAndConditions> createState() => _NeoTermsAndConditionsState();
}

class _NeoTermsAndConditionsState extends State<NeoTermsAndConditions> {
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: _enableButton,
      child: _buildTitleAndContent(),
    );
  }

  Widget _buildTitleAndContent() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.titleText,
            style: NeoTextStyles.labelSixteenSemibold,
          ).paddingOnly(bottom: NeoDimens.px12),
          Text(
            widget.contentText,
            style: NeoTextStyles.labelFourteenMedium.apply(color: NeoColors.colorNeutral),
          ),
        ],
      ).padding(widget.padding),
    );
  }

  bool _enableButton(ScrollEndNotification notification) {
    final atEnd = notification.metrics.pixels >= notification.metrics.maxScrollExtent;
    if (atEnd) {
      setState(() {
        _isButtonEnabled = true;
      });

      getIt.get<NeoWidgetEventBus>().addEvent(
            NeoWidgetEvent(eventId: NeoWidgetEventKeys.neoButtonChangeEnableStatusEventKey.name, data: true),
          );
    }
    if (widget.dataKey.isNotNull) {
      context.read<WorkflowFormBloc>().add(
            WorkflowFormEventAddAllParameters({widget.dataKey.orEmpty: _isButtonEnabled}),
          );
    }
    return _isButtonEnabled;
  }
}
