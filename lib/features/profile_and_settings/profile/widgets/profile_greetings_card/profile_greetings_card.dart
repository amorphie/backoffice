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

import 'package:flutter/material.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/core/pages/neo_page_id.dart';
import 'package:backoffice/features/profile_and_settings/profile/usecases/get_greetings_message_usecase.dart';
import 'package:backoffice/reusable_widgets/neo_avatar/neo_avatar.dart';
import 'package:backoffice/reusable_widgets/neo_category_item_widget/neo_category_item_widget.dart';
import 'package:backoffice/util/neo_util.dart';

class ProfileGreetingsCard extends StatelessWidget {
  final EdgeInsetsDirectional padding;

  const ProfileGreetingsCard({
    this.padding = EdgeInsetsDirectional.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          color: NeoColors.baseWhite,
          borderRadius: BorderRadius.circular(NeoRadius.px20),
          boxShadow: const [NeoShadows.xl],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeoAvatar(
              axis: Axis.horizontal,
              subText: GetGreetingsMessageUsecase().call(),
            ).paddingOnly(bottom: NeoDimens.px20),
            NeoCategoryItemWidget(
              iconUrn: NeoAssets.userAccount20px.urn,
              hasShadow: false,
              title: LocalizationKey.profileAndSettingsMainPersonalInformationTitle.loc(),
              body: LocalizationKey.profileAndSettingsMainPersonalInformationSubtitle.loc(),
              navigationPath: NeoPageId.personalInformation,
              hasChevron: true,
              iconSpacing: NeoDimens.px12,
            ).paddingAll(NeoDimens.px8),
          ],
        ).paddingAll(NeoDimens.px24),
      ),
    );
  }
}
