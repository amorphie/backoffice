/*
 * neo_bank
 *
 * Created on 16/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_hypertext/model/neo_hypertext_action_type.dart';
import 'package:backoffice/reusable_widgets/neo_hypertext/model/neo_hypertext_highlighted_item.dart';
import 'package:backoffice/reusable_widgets/neo_hypertext/neo_hypertext.dart';
import 'package:backoffice/reusable_widgets/neo_image/neo_image.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

abstract class _Constants {
  static const double imageWidth = 150;
  static const double imageHeight = 100;
  static const String callNumberItemKey = "callNumber";
  static const String networkImageIdentifier = "http";
  static const String securityImagePattern = "{securityImage}";
  static const String securityImageDataKey = "securityImage";
}

class OtpSecurityImageWidget extends StatelessWidget {
  final String phoneNumber;

  const OtpSecurityImageWidget({required this.phoneNumber, super.key});

  @override
  Widget build(BuildContext context) {
    final url = _Constants.securityImagePattern.formatDataWithDataKey(context, _Constants.securityImageDataKey);
    return url.contains(_Constants.networkImageIdentifier)
        ? DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(NeoDimens.px12),
              color: NeoColors.bgMedium,
              border: Border.all(color: NeoColors.borderMediumDark),
            ),
            child: Column(
              children: [
                _buildSecurityImage(url),
                _buildSecurityFirstText(),
                _buildSecuritySecondText(),
              ],
            ),
          ).paddingOnly(bottom: NeoDimens.px24)
        : _buildEmptyImage();
  }

  Widget _buildSecurityImage(String url) {
    return NeoImage(
      imageUrn: url,
      showGridBackground: true,
      width: _Constants.imageWidth,
      height: _Constants.imageHeight,
      borderRadius: BorderRadius.circular(NeoRadius.px12),
      borderWidth: NeoDimens.px4,
      padding: const EdgeInsetsDirectional.only(top: NeoDimens.px16),
    );
  }

  Widget _buildSecurityFirstText() {
    return NeoText(LocalizationKey.otpMainSecurityFirstText.loc(), style: NeoTextStyles.titleTwelveSemibold).paddingOnly(top: NeoDimens.px8, start: NeoDimens.px24, end: NeoDimens.px24);
  }

  Widget _buildSecuritySecondText() {
    return NeoHypertext(
      text: LocalizationKey.otpMainSecuritySecondText.loc(),
      highlightedItems: [
        NeoHypertextHighlightedItem(
          text: LocalizationKey.otpMainSecurityLinkText.loc(),
          actionType: NeoHypertextActionType.callNumber,
          itemKey: _Constants.callNumberItemKey,
          data: phoneNumber,
        ),
      ],
      style: NeoTextStyles.titleTwelveMedium.apply(color: NeoColors.neutral.shade900),
      textAlign: TextAlign.center,
    ).paddingOnly(top: NeoDimens.px4, bottom: NeoDimens.px16, start: NeoDimens.px24, end: NeoDimens.px24);
  }

  Widget _buildEmptyImage() => const SizedBox.shrink();
}
