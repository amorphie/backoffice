import 'package:flutter/material.dart';
import 'package:admin/ui/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:admin/core/util/constants/neo_colors.dart';
import 'package:admin/core/util/constants/neo_dimens.dart';
import 'package:admin/core/util/constants/neo_text_styles.dart';
import 'package:admin/core/util/extensions/widget_extensions.dart';

class NeoBottomNavigationItem extends StatelessWidget {
  final String iconUrn;
  final String labelText;
  final bool isSelected;

  const NeoBottomNavigationItem({required this.iconUrn, required this.labelText, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NeoIcon(
          iconUrn: iconUrn,
          color: NeoColors.bgPrimaryGreen,
        ).paddingOnly(bottom: NeoDimens.px4),
        Text(
          labelText,
          maxLines: 1,
          textAlign: TextAlign.left,
          style: NeoTextStyles.bodyTwelveMedium.copyWith(color: isSelected ? NeoColors.textPrimaryGreen : NeoColors.textDefaultInverse),
        ),
      ],
    );
  }
}
