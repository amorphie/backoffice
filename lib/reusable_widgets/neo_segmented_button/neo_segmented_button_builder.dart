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

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_segmented_button/neo_segmented_button.dart';

part 'neo_segmented_button_builder.g.dart';

abstract class _Constants {
  static const segmentsKey = "segments";
}

@JsonWidget(type: 'neo_segmented_button')
abstract class _NeoSegmentedButtonBuilder extends JsonWidgetBuilder {
  const _NeoSegmentedButtonBuilder({
    required super.args,
  });

  @JsonArgDecoder(_Constants.segmentsKey)
  List<String> _decodeSegmentStrings({required JsonWidgetData data}) {
    final listString = data.jsonWidgetArgs[_Constants.segmentsKey];
    return listString != null ? List<String>.from(listString) : [];
  }

  @override
  NeoSegmentedButton buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
