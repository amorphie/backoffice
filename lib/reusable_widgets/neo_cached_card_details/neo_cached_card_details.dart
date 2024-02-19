/*
 * 
 * neo_bank
 * 
 * Created on 29/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_cached_card_details/bloc/neo_cached_card_details_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_image/neo_image.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

abstract class _Constants {
  static const smallCardImageWidth = 70.0;
  static const smallCardImageHeight = 42.0;
  static const temporaryClosureVerticalPadding = 18.0;
  static const temporaryClosureStatusCode = "GN";
}

class NeoCachedCardDetails extends StatelessWidget {
  final EdgeInsetsDirectional padding;
  final String dataKey;

  const NeoCachedCardDetails({required this.dataKey, this.padding = EdgeInsetsDirectional.zero, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoCachedCardDetailsBloc()..add(const NeoCachedCardDetailsEventFetchCardDetails()),
      child: BlocConsumer<NeoCachedCardDetailsBloc, NeoCachedCardDetailsState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildComponent(
                state.cardName.orEmpty,
                state.cardNumber.orEmpty,
                state.cardImageUrn.orEmpty,
                state.cardStatusCode.orEmpty == _Constants.temporaryClosureStatusCode,
              ).padding(padding),
            ],
          );
        },
        listener: (context, state) {
          if (!state.cardNumber.isNullOrBlank) {
            context.read<WorkflowFormBloc>().add(WorkflowFormEventAddAllParameters({dataKey: state.cardNumber.orEmpty}));
          }
        },
      ),
    );
  }

  Widget _buildComponent(String cardName, String cardNumber, String cardImageUrn, bool shouldShowTemporaryClosure) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(NeoRadius.px20),
        color: NeoColors.baseWhite,
        boxShadow: const [NeoShadows.xl],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildCardImage(cardImageUrn).paddingOnly(end: NeoDimens.px16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  NeoText(
                    cardName,
                    style: NeoTextStyles.labelFourteenSemibold,
                  ).paddingOnly(bottom: NeoDimens.px4),
                  NeoText(
                    cardNumber.getMaskedCardNumber(),
                    style: NeoTextStyles.bodyTwelveMedium.apply(color: NeoColors.textSecondary),
                  ),
                ],
              ),
            ],
          ).paddingAll(NeoDimens.px24),
          if (shouldShowTemporaryClosure) _buildTemporaryClosureBottomBox(),
        ],
      ),
    );
  }

  Widget _buildTemporaryClosureBottomBox() {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: const [NeoShadows.xl],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(NeoRadius.px20),
          bottomRight: Radius.circular(NeoRadius.px20),
        ),
        color: NeoColors.bgWarningLight,
      ),
      child: Center(
        child: Row(
          children: [
            NeoIcon(iconUrn: NeoAssets.clock24px.urn, color: NeoColors.iconWarning).paddingOnly(end: NeoDimens.px12),
            NeoText(
              LocalizationKey.debitCardCardDetailsTemporaryClosedText.loc(),
              style: NeoTextStyles.bodyTwelveSemibold,
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: NeoDimens.px24, vertical: _Constants.temporaryClosureVerticalPadding),
    );
  }

  Widget _buildCardImage(String cardImage) {
    return NeoImage(
      imageUrn: cardImage.orEmpty,
      width: _Constants.smallCardImageWidth,
      height: _Constants.smallCardImageHeight,
    );
  }
}
