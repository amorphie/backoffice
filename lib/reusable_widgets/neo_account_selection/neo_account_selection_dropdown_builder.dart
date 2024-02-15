/*
 * 
 * Neobank.Client
 * 
 * Created on 23/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_account_selection/neo_account_selection_dropdown.dart';

part 'neo_account_selection_dropdown_builder.g.dart';

@JsonWidget(type: 'neo_account_selection_dropdown')
abstract class _NeoAccountSelectionDropdownBuilder extends JsonWidgetBuilder {
  const _NeoAccountSelectionDropdownBuilder({
    required super.args,
  });

  @override
  NeoAccountSelectionDropdown buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
