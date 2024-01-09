/*
 *
 * Neobank.Client
 *
 * Created on 14/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 *
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_image_selector/neo_image_selector_widget.dart';

part 'neo_image_selector_widget_builder.g.dart';

@JsonWidget(type: 'neo_image_selector_widget')
abstract class _NeoImageSelectorWidgetBuilder extends JsonWidgetBuilder {
  const _NeoImageSelectorWidgetBuilder({required super.args});

  @override
  NeoImageSelectorWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
