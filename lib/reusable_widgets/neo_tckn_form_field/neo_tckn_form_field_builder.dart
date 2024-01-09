/*
 * 
 * neo_bank
 * 
 * Created on 19/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_tckn_form_field/neo_tckn_form_field.dart';

part 'neo_tckn_form_field_builder.g.dart';

@JsonWidget(type: 'neo_tckn_form_field')
abstract class _NeoTcknFormFieldBuilder extends JsonWidgetBuilder {
  const _NeoTcknFormFieldBuilder({required super.args});

  @override
  NeoTcknFormField buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
