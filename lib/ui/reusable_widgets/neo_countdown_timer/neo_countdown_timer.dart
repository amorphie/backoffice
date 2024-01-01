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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/ui/reusable_widgets/neo_countdown_timer/bloc/neo_countdown_timer_bloc.dart';
import 'package:admin/ui/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:admin/core/util/neo_util.dart';

class _Constants {
  _Constants._();

  static double boxWidth = 94;
}

class NeoCountdownTimer extends StatefulWidget {
  final String iconUrn;
  final int duration;

  const NeoCountdownTimer({required this.iconUrn, required this.duration, super.key});

  @override
  State<NeoCountdownTimer> createState() => _NeoCountdownTimerState();
}

class _NeoCountdownTimerState extends State<NeoCountdownTimer> {
  @override
  void dispose() {
    BlocProvider.of<NeoCountdownTimerBloc>(context).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoCountdownTimerBloc(duration: widget.duration)..add(NeoCountdownTimerEventStartTimer(duration: widget.duration)),
      child: BlocBuilder<NeoCountdownTimerBloc, NeoCountdownTimerState>(
        builder: (context, state) {
          return ConstrainedBox(
            constraints: BoxConstraints(minWidth: _Constants.boxWidth, minHeight: NeoDimens.px52, maxHeight: NeoDimens.px52),
            child: DecoratedBox(
              decoration: BoxDecoration(color: NeoColors.bgDarker, borderRadius: BorderRadius.circular(NeoRadius.px8)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NeoIcon(
                    height: NeoDimens.px20,
                    width: NeoDimens.px20,
                    color: NeoColors.iconLight,
                    iconUrn: widget.iconUrn,
                  ).paddingOnly(end: NeoDimens.px8),
                  Text(
                    state.duration ?? "",
                    style: NeoTextStyles.labelFourteenSemibold.apply(color: NeoColors.colorBaseWhite),
                  ),
                ],
              ).paddingSymmetric(horizontal: NeoDimens.px12),
            ),
          );
        },
      ),
    );
  }
}
