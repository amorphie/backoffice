import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_badge/model/neo_badge_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoBadge extends StatelessWidget {
  final String? text;
  final String? iconUrn;
  final NeoBadgeDisplayMode displayMode;
  final double? minWidth;
  final EdgeInsetsDirectional padding;

  const NeoBadge({
    this.text,
    this.iconUrn,
    this.displayMode = NeoBadgeDisplayMode.green,
    this.minWidth,
    this.padding = EdgeInsetsDirectional.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: minWidth ?? 0,
      ),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(
          NeoRadius.px4,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconUrn != null)
            NeoIcon(
              iconUrn: iconUrn!,
              width: NeoDimens.px16,
              color: _textIconColor,
              height: NeoDimens.px16,
            ).paddingOnly(end: NeoDimens.px4),
          NeoText(
            text,
            style: NeoTextStyles.bodyFourteenSemibold.copyWith(color: _textIconColor),
          ),
        ],
      ).paddingSymmetric(horizontal: NeoDimens.px8, vertical: NeoDimens.px4),
    ).paddingOnly(start: padding.start, top: padding.top, end: padding.end, bottom: padding.bottom);
  }

  Color get _backgroundColor => switch (displayMode) {
        NeoBadgeDisplayMode.greenHighlighted => NeoColors.bgSuccessLight,
        NeoBadgeDisplayMode.redHighlighted => NeoColors.bgDangerLight,
        NeoBadgeDisplayMode.orangeHighlighted => NeoColors.bgWarningLight,
        NeoBadgeDisplayMode.blueHighlighted => NeoColors.bgInformationLight,
        NeoBadgeDisplayMode.purpleHighlighted => NeoColors.bgSupportPLight,
        NeoBadgeDisplayMode.yellowHighlighted => NeoColors.bgSupportYLight,
        NeoBadgeDisplayMode.blackHighlighted => NeoColors.bgSupportY,
        NeoBadgeDisplayMode.green => Colors.transparent,
        NeoBadgeDisplayMode.red => Colors.transparent,
        NeoBadgeDisplayMode.orange => Colors.transparent,
        NeoBadgeDisplayMode.blue => Colors.transparent,
        NeoBadgeDisplayMode.purple => Colors.transparent,
        NeoBadgeDisplayMode.yellow => Colors.transparent,
        NeoBadgeDisplayMode.black => Colors.transparent,
      };

  Color get _textIconColor => switch (displayMode) {
        NeoBadgeDisplayMode.green => NeoColors.textSuccess,
        NeoBadgeDisplayMode.red => NeoColors.textDanger,
        NeoBadgeDisplayMode.orange => NeoColors.textWarning,
        NeoBadgeDisplayMode.blue => NeoColors.textInformation,
        NeoBadgeDisplayMode.purple => NeoColors.textSupportP,
        NeoBadgeDisplayMode.yellow => NeoColors.textSupportY,
        NeoBadgeDisplayMode.black => NeoColors.textDefault,
        NeoBadgeDisplayMode.greenHighlighted => NeoColors.textSuccess,
        NeoBadgeDisplayMode.redHighlighted => NeoColors.textDanger,
        NeoBadgeDisplayMode.orangeHighlighted => NeoColors.textWarning,
        NeoBadgeDisplayMode.blueHighlighted => NeoColors.textInformation,
        NeoBadgeDisplayMode.purpleHighlighted => NeoColors.textSupportP,
        NeoBadgeDisplayMode.yellowHighlighted => NeoColors.textSupportY,
        NeoBadgeDisplayMode.blackHighlighted => NeoColors.textDefault,
      };
}
