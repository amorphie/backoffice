/*
 * neo_bank
 *
 * Created on 8/2/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_amount_widget/neo_amount_widget.dart';
import 'package:backoffice/util/constants/neo_constants.dart';

part 'neo_amount_widget_builder.g.dart';

@JsonWidget(type: 'neo_amount_widget')
abstract class _NeoAmountWidgetBuilder extends JsonWidgetBuilder {
  const _NeoAmountWidgetBuilder({
    required super.args,
  });

  @JsonArgDecoder('style')
  TextStyle _decodeStyle({required dynamic value}) => NeoTextStyles.fromString(value);

  @JsonArgDecoder('precisionStyle')
  TextStyle _decodePrecisionStyle({required dynamic value}) => NeoTextStyles.fromString(value);

  @JsonArgDecoder('symbolStyle')
  TextStyle _decodeSymbolStyle({required dynamic value}) => NeoTextStyles.fromString(value);

  @override
  NeoAmountWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
