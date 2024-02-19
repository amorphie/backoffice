import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_enable_state.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';
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
          NeoText(
            widget.titleText,
            style: NeoTextStyles.labelSixteenSemibold,
          ).paddingOnly(bottom: NeoDimens.px12),
          NeoText(
            widget.contentText,
            style: NeoTextStyles.labelFourteenMedium.apply(color: NeoColors.neutral.shade900),
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

      NeoWidgetEventKeys.neoButtonChangeEnableStateEventKey.sendEvent(data: NeoButtonEnableState.enabled);
    }
    if (widget.dataKey.isNotNull) {
      context.read<WorkflowFormBloc>().add(
            WorkflowFormEventAddAllParameters({widget.dataKey.orEmpty: _isButtonEnabled}),
          );
    }
    return _isButtonEnabled;
  }
}
