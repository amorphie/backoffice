/*
 * Neobank.Client
 *
 * Created on 8/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event_bus.dart';

class NeoSegmentedButton extends StatefulWidget {
  final List<String> segments;
  final String? widgetEventKey;
  final String? initiallySelectedSegment;
  final EdgeInsetsDirectional padding;

  const NeoSegmentedButton({
    required this.segments,
    this.widgetEventKey,
    this.padding = EdgeInsetsDirectional.zero,
    this.initiallySelectedSegment,
    super.key,
  });

  @override
  State<NeoSegmentedButton> createState() => _NeoSegmentedButtonState();
}

class _NeoSegmentedButtonState extends State<NeoSegmentedButton> {
  late String selectedValue = widget.initiallySelectedSegment.orEmpty;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      showSelectedIcon: false,
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStateProperty.resolveWith((states) => EdgeInsetsDirectional.zero),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected) ? NeoColors.bgMediumDark : Colors.transparent,
        ),
        side: MaterialStateBorderSide.resolveWith((states) => BorderSide(color: NeoColors.borderDark)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(NeoDimens.px8),
          ),
        ),
      ),
      segments: <ButtonSegment<String>>[
        ...widget.segments.map(
          (segment) => ButtonSegment(
            value: segment,
            label: SizedBox(
              width: double.maxFinite,
              child: NeoText(
                segment,
                style: NeoTextStyles.bodyFourteenSemibold.copyWith(color: selectedValue != segment ? NeoColors.textPlaceholder : null),
                textAlign: TextAlign.center,
                padding: const EdgeInsetsDirectional.symmetric(vertical: NeoDimens.px8),
              ),
            ),
          ),
        ),
      ],
      selected: {selectedValue},
      onSelectionChanged: (Set<String> newSelection) {
        setState(() {
          selectedValue = newSelection.first;
          if (!widget.widgetEventKey.isNullOrBlank) {
            getIt.get<NeoWidgetEventBus>().addEvent(NeoWidgetEvent(eventId: widget.widgetEventKey.orEmpty, data: selectedValue));
          }
        });
      },
    ).padding(EdgeInsetsDirectional.zero);
  }
}
