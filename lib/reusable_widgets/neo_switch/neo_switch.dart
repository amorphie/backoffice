import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_switch/bloc/neo_switch_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_switch/bloc/neo_switch_event.dart';
import 'package:backoffice/reusable_widgets/neo_switch/bloc/neo_switch_state.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

abstract class _Constants {
  static const double width = 50;
  static const double height = 26;
  static const double onBorderWidth = 1;
  static const double offBorderWidth = 0;
  static const double thumbPadding = 3;
  static const double dragDistance = 25;
  static const double containerWidth = 18;
  static const double containerHeight = 18;
}

class NeoSwitch extends StatelessWidget {
  final String dataKey;
  final bool initialValue;
  final EdgeInsetsDirectional padding;

  const NeoSwitch({
    required this.dataKey,
    this.initialValue = false,
    this.padding = EdgeInsetsDirectional.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoSwitchBloc()..add(NeoSwitchEventInitial(isEnabled: initialValue)),
      child: BlocConsumer<NeoSwitchBloc, NeoSwitchState>(
        listener: (context, state) {
          _onSwitchChange(context);
        },
        builder: (context, state) {
          double dragDistance = 0;

          return GestureDetector(
            onTap: () => context.read<NeoSwitchBloc>().add(NeoSwitchEventToggleValue()),
            onHorizontalDragUpdate: (details) => dragDistance += details.primaryDelta ?? 0,
            onHorizontalDragEnd: (details) {
              if (dragDistance.abs() > _Constants.dragDistance) {
                if ((dragDistance > 0 && !state.isEnabled) || (dragDistance < 0 && state.isEnabled)) {
                  context.read<NeoSwitchBloc>().add(NeoSwitchEventToggleValue());
                }
              }
              dragDistance = 0;
            },
            child: AnimatedContainer(
              duration: AppConstants.defaultAnimationDuration,
              width: _Constants.width,
              height: _Constants.height,
              decoration: BoxDecoration(
                border: Border.all(
                  color: state.isEnabled ? Colors.transparent : NeoColors.bgDarker,
                  width: state.isEnabled ? _Constants.offBorderWidth : _Constants.onBorderWidth,
                ),
                borderRadius: BorderRadius.circular(NeoRadius.px16),
                color: state.isEnabled ? NeoColors.bgDarker : NeoColors.baseWhite,
              ),
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: AppConstants.defaultAnimationDuration,
                    curve: Curves.easeInOutCubic,
                    alignment: state.isEnabled ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
                    padding: const EdgeInsets.all(_Constants.thumbPadding),
                    child: Container(
                      width: _Constants.containerWidth,
                      height: _Constants.containerHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: state.isEnabled ? NeoColors.bgPrimaryGreen : NeoColors.bgDarker,
                      ),
                      child: state.isEnabled
                          ? Center(
                              child: NeoIcon(
                                iconUrn: NeoAssets.check16px.urn,
                                width: NeoDimens.px12,
                                color: NeoColors.iconDefault,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
          ).padding(padding);
        },
      ),
    );
  }

  void _onSwitchChange(BuildContext context) {
    if (dataKey.isNotNull) {
      try {
        context.read<WorkflowFormBloc>().add(WorkflowFormEventAddAllParameters({dataKey: context.read<NeoSwitchBloc>().state.isEnabled}));
      } catch (e) {
        // No-op
      }
    }
  }
}
