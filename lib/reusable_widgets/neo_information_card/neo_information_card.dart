import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_information_card/model/neo_information_card_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoInformationCard extends StatelessWidget {
  final String? iconUrn;
  final Widget content;
  final String? title;
  final NeoInformationCardDisplayMode displayMode;
  final EdgeInsetsDirectional padding;

  const NeoInformationCard({
    required this.content,
    super.key,
    this.iconUrn,
    this.title,
    this.displayMode = NeoInformationCardDisplayMode.gray,
    this.padding = EdgeInsetsDirectional.zero,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(NeoRadius.px8),
        color: displayMode.color,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (iconUrn != null)
            NeoIcon(
              iconUrn: iconUrn!,
              color: displayMode.iconColor,
            ).paddingOnly(end: NeoDimens.px12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  NeoText(
                    title,
                    textAlign: TextAlign.start,
                    style: NeoTextStyles.titleTwelveSemibold,
                  ),
                content,
              ],
            ),
          ),
        ],
      ).paddingAll(NeoDimens.px16),
    ).padding(padding);
  }
}
