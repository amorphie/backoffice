/*
 * Neobank.Client
 *
 * Created on 28/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:admin/ui/reusable_widgets/neo_swipe_button/neo_swipe_button.dart';

part 'neo_swipe_button_builder.g.dart';

@JsonWidget(type: 'neo_swipe_button')
abstract class _NeoSwipeButtonBuilder extends JsonWidgetBuilder {
  const _NeoSwipeButtonBuilder({required super.args});

  @override
  NeoSwipeButton buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
