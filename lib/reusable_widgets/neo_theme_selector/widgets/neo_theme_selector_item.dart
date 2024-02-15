/*
 * 
 * neo_ui
 * 
 * Created on 8/01/2024.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

part of '../neo_theme_selector.dart';

class ThemeSelectorItem extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final String text;
  final bool isSelected;

  const ThemeSelectorItem({
    required this.onTap,
    required this.image,
    required this.text,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(NeoRadius.px12),
        ),
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(NeoRadius.px12),
                border: Border.all(
                  color: isSelected ? NeoColors.bgPrimaryGreen : Colors.transparent,
                  width: _Constants.borderColorWidth,
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(NeoDimens.px4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(NeoRadius.px12),
                      child: SizedBox(
                        height: _Constants.imageHeight,
                        child: NeoImage(imageUrn: image),
                      ),
                    ),
                  ),
                  if (isSelected)
                    const Padding(
                      padding: EdgeInsets.all(NeoDimens.px12),
                      // STOPSHIP: Icon not provided yet.
                      child: Icon(Icons.check, color: NeoColors.baseWhite, size: 24.0),
                    ),
                ],
              ),
            ),
            NeoText(text, style: const TextStyle(fontWeight: FontWeight.bold)).paddingOnly(top: NeoDimens.px8),
          ],
        ),
      ),
    );
  }
}
