// ignore_for_file: unused_element

part of '../neo_stepper.dart';

class _NeoStepperItemWidget extends StatelessWidget {
  final bool isCurrentlySelected;
  final bool isCompleted;
  final String iconUrn;
  final double? width;
  final double? height;

  const _NeoStepperItemWidget({
    required this.iconUrn,
    required this.isCompleted,
    required this.isCurrentlySelected,
    this.width = NeoDimens.px24,
    this.height = NeoDimens.px24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isCurrentlySelected) {
      return _buildCurrentStep();
    } else if (isCompleted) {
      return _buildCompletedStep();
    } else {
      return _buildDefaultStep();
    }
  }

  Widget _buildDefaultStep() {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: NeoColors.bgMedium,
        border: Border.all(color: NeoColors.borderDark),
      ),
      child: Container(
        width: NeoDimens.px8,
        height: NeoDimens.px8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: NeoColors.iconDisabled,
        ),
      ),
    );
  }

  Widget _buildCompletedStep() {
    return Container(
      decoration: BoxDecoration(color: NeoColors.bgDarker, borderRadius: BorderRadius.circular(NeoRadius.rounded)),
      width: width,
      height: height,
      child: Center(
        child: NeoIcon(
          iconUrn: NeoAssets.check16px.urn,
          color: NeoColors.iconPrimaryGreen,
        ),
      ),
    );
  }

  Widget _buildCurrentStep() {
    return NeoRoundedImage(
      width: NeoDimens.px24,
      height: NeoDimens.px24,
      borderWidth: NeoDimens.px2,
      borderDividerWidth: NeoDimens.px2,
      isHighlighted: true,
      hasBackground: true,
      imageUrn: iconUrn,
      color: NeoColors.iconPrimaryGreen,
    );
  }
}
