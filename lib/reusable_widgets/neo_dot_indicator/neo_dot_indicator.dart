import 'package:flutter/material.dart';
import 'package:backoffice/util/app_constants.dart';
import 'package:backoffice/util/constants/neo_constants.dart';

class NeoDotIndicator extends AnimatedWidget {
  final AnimationController animationController;
  final int currentIndex;
  final int itemCount;
  final Color activeColor;
  final Color inactiveColor;
  final double activeSize;
  final double inactiveSize;
  final double activeWidth;
  final double inactiveWidth;
  final double spacing;

  const NeoDotIndicator({
    required this.animationController,
    required this.currentIndex,
    required this.itemCount,
    super.key,
    this.activeColor = NeoColors.iconPrimaryGreen,
    this.inactiveColor = NeoColors.iconDefault,
    this.activeSize = NeoDimens.px8,
    this.inactiveSize = NeoDimens.px4,
    this.activeWidth = NeoDimens.px8,
    this.inactiveWidth = NeoDimens.px4,
    this.spacing = NeoDimens.px4,
  }) : super(listenable: animationController);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(itemCount, (index) {
        final bool isCurrentPage = currentIndex == index;
        final double size = isCurrentPage ? activeSize : inactiveSize;
        final double width = isCurrentPage ? activeWidth : inactiveWidth;

        return AnimatedContainer(
          duration: AppConstants.defaultAnimationDuration,
          curve: Curves.easeOut,
          width: width,
          height: size,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          decoration: BoxDecoration(
            border: isCurrentPage ? Border.all(color: NeoColors.borderDarker) : Border.all(width: 0),
            color: isCurrentPage ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(size / 2),
          ),
        );
      }),
    );
  }
}
