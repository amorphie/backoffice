/*
 * 
 * Neobank.Client
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

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_customer_name/models/neo_customer_name_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_customer_name/neo_customer_name_widget.dart';

part 'neo_customer_name_widget_builder.g.dart';

@JsonWidget(type: 'neo_customer_name_widget')
abstract class _NeoCustomerNameWidgetBuilder extends JsonWidgetBuilder {
  const _NeoCustomerNameWidgetBuilder({
    required super.args,
  });

  @override
  NeoCustomerNameWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
