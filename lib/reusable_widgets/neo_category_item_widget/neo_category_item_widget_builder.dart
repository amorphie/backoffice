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

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_category_item_widget/neo_category_item_widget.dart';
import 'package:backoffice/util/neo_util.dart';

part 'neo_category_item_widget_builder.g.dart';

@JsonWidget(type: 'neo_category_item_widget')
abstract class _NeoCategoryItemWidgetBuilder extends JsonWidgetBuilder {
  const _NeoCategoryItemWidgetBuilder({
    required super.args,
  });

  @override
  NeoCategoryItemWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
