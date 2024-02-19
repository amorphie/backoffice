/*
 * 
 * neo_bank
 * 
 * Created on 30/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_cached_card_details/neo_cached_card_details.dart';

part 'neo_cached_card_details_builder.g.dart';

@JsonWidget(type: 'neo_cached_card_details')
abstract class _NeoCachedCardDetailsBuilder extends JsonWidgetBuilder {
  const _NeoCachedCardDetailsBuilder({
    required super.args,
  });

  @override
  NeoCachedCardDetails buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
