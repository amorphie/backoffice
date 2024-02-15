/*
 * neo_bank
 *
 * Created on 19/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_navigation_button/neo_navigation_button.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';

part 'neo_navigation_button_builder.g.dart';

@JsonWidget(type: 'neo_navigation_button')
abstract class _NeoNavigationButtonBuilder extends JsonWidgetBuilder {
  const _NeoNavigationButtonBuilder({required super.args});

  @override
  NeoNavigationButton buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
