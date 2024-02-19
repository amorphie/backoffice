import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_rounded_image/neo_rounded_image.dart';
import 'package:backoffice/reusable_widgets/neo_stepper/model/neo_stepper_item_model.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

part './widgets/_neo_stepper_item_widget.dart';
part './widgets/_neo_stepper_detail_vertical.dart';

class NeoStepper extends StatelessWidget {
  final List<NeoStepperItemModel> steps;
  final EdgeInsetsDirectional padding;
  final double? verticalMaxHeight;
  final Axis axis;

  const NeoStepper({
    required this.steps,
    this.axis = Axis.horizontal,
    this.padding = EdgeInsetsDirectional.zero,
    this.verticalMaxHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return axis == Axis.horizontal ? _buildStepperHorizontal() : _buildStepperVertical();
  }

  Widget _buildStepperHorizontal() {
    return SizedBox(height: NeoDimens.px48, child: Flex(direction: axis, children: _buildSteps())).padding(padding);
  }

  Widget _buildStepperVertical() {
    return verticalMaxHeight == null
        ? _buildStepperVerticalBase()
        : ConstrainedBox(
            constraints: BoxConstraints(maxHeight: verticalMaxHeight!),
            child: _buildStepperVerticalBase(),
          );
  }

  Widget _buildStepperVerticalBase() {
    return Flex(
      direction: Axis.horizontal,
      children: [
        SizedBox(
          width: NeoDimens.px48,
          child: Column(children: _buildSteps()).paddingSymmetric(vertical: NeoDimens.px16),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildStepDetailsVertical(),
        ),
      ],
    ).padding(padding);
  }

  List<Widget> _buildSteps() {
    final horizontalPadding = axis == Axis.horizontal ? NeoDimens.px4 : NeoDimens.px0;
    final verticalPadding = axis == Axis.horizontal ? NeoDimens.px0 : NeoDimens.px4;
    final padding = EdgeInsetsDirectional.symmetric(horizontal: horizontalPadding, vertical: verticalPadding);

    final List<Widget> stepperAndDividers = [];
    for (var i = 0; i < steps.length; i++) {
      final isPrevious = i < steps.findSelectedIndex();
      final isCurrent = i == steps.findSelectedIndex();
      stepperAndDividers.add(
        _NeoStepperItemWidget(
          iconUrn: steps[i].iconUrn,
          isCompleted: isPrevious || isCurrent,
          isCurrentlySelected: isCurrent,
        ),
      );
      if (i != steps.length - 1) {
        stepperAndDividers.add(_addStepperDivider(isPrevious, axis == Axis.horizontal, padding));
      }
    }
    return stepperAndDividers;
  }

  Widget _addStepperDivider(bool isCompleted, bool isHorizontal, EdgeInsetsDirectional padding) {
    return Expanded(
      child: isHorizontal
          ? Divider(color: isCompleted ? NeoColors.bgDarker : NeoColors.bgMediumDark).padding(padding)
          : VerticalDivider(color: isCompleted ? NeoColors.bgDarker : NeoColors.bgMediumDark).padding(padding),
    );
  }

  List<Widget> _buildStepDetailsVertical() {
    final List<Widget> stepDetails = [];
    for (var i = 0; i < steps.length; i++) {
      stepDetails.add(
        _NeoStepperDetailVertical(
          title: steps[i].title,
          description: steps[i].description,
          datetime: steps[i].datetime,
        ),
      );
    }
    return stepDetails;
  }
}
