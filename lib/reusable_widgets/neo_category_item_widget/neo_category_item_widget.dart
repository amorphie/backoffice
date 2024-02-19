/*
 *
 * Neobank.Client
 *
 * Created on 15/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 *
 */

import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_badge/model/neo_badge_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_badge/neo_badge.dart';
import 'package:backoffice/reusable_widgets/neo_button/bloc/neo_button_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_button/i_neo_button.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_image/neo_image.dart';
import 'package:backoffice/reusable_widgets/neo_navigation_button/neo_navigation_button.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';

class NeoCategoryItemWidget extends INeoButton {
  final String? navigationPath;
  final String? iconUrn;
  final String? title;
  final String? subtitle;
  final String? body;
  final bool isNew;
  final Widget? badge;
  final String? imageUrn;
  final bool hasChevron;
  final bool hasShadow;
  final double iconSpacing;

  const NeoCategoryItemWidget({
    this.navigationPath,
    this.iconUrn,
    this.title,
    this.subtitle,
    this.body,
    this.isNew = false,
    this.badge,
    this.imageUrn,
    this.hasChevron = false,
    this.hasShadow = true,
    this.iconSpacing = NeoDimens.px8,
    super.transitionId,
    super.startWorkflow,
    super.padding,
    super.key,
  });

  @override
  Widget Function(BuildContext, NeoButtonState) get childBuilder => (context, state) {
        return !transitionId.isNullOrBlank
            ? InkWell(
                onTap: () => startTransition(context),
                child: _buildNeoCategoryItem(context),
              )
            : navigationPath != null && navigationPath!.isNotEmpty
                ? NeoNavigationButton(
                    navigationPath: navigationPath!,
                    navigationType: NeoNavigationType.push,
                    child: _buildNeoCategoryItem(context),
                  )
                : _buildNeoCategoryItem(context);
      };

  Widget _buildNeoCategoryItem(BuildContext context) {
    return Row(
      children: [
        if (iconUrn.isNotNull) _buildLeading(),
        if (imageUrn.isNotNull) _buildImage(),
        _buildTitle(),
        if (isNew) _buildTrailing(),
        if (badge.isNotNull) badge!.paddingOnly(start: NeoDimens.px16),
        if (hasChevron) NeoIcon(iconUrn: NeoAssets.arrowRight20px.urn).paddingOnly(start: NeoDimens.px16),
      ],
    ).padding(padding ?? EdgeInsetsDirectional.zero);
  }

  Widget _buildImage() {
    return NeoImage(
      imageUrn: imageUrn.orEmpty,
      borderRadius: BorderRadius.circular(NeoRadius.px4),
      width: NeoDimens.px44,
      height: NeoDimens.px44,
    ).paddingOnly(end: iconSpacing);
  }

  Widget _buildLeading() {
    if (hasShadow) {
      return Container(
        width: NeoDimens.px44,
        height: NeoDimens.px44,
        decoration: BoxDecoration(
          color: NeoColors.bgMedium,
          borderRadius: BorderRadius.circular(NeoRadius.rounded),
        ),
        child: NeoIcon(
          iconUrn: iconUrn.orEmpty,
        ).paddingAll(NeoDimens.px12),
      ).paddingOnly(end: iconSpacing);
    } else {
      return NeoIcon(iconUrn: iconUrn.orEmpty).paddingOnly(end: iconSpacing);
    }
  }

  Widget _buildTitle() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title.isNotNull)
            NeoText(
              title.orEmpty,
              style: NeoTextStyles.bodyFourteenSemibold.copyWith(color: NeoColors.textDefault),
            ),
          if (subtitle.isNotNull)
            NeoText(
              subtitle.orEmpty,
              style: NeoTextStyles.bodyFourteenMedium,
            ).paddingOnly(
              top: title.isNullOrBlank ? NeoDimens.px0 : NeoDimens.px4,
            ),
          if (body.isNotNull)
            NeoText(
              body.orEmpty,
              style: NeoTextStyles.bodyTwelveMedium.copyWith(color: NeoColors.textSecondary),
            ).paddingOnly(top: NeoDimens.px4),
        ],
      ),
    );
  }

  Widget _buildTrailing() {
    return const NeoBadge(
      // STOPSHIP: Localization
      text: "Yeni",
      displayMode: NeoBadgeDisplayMode.blackHighlighted,
    );
  }
}
