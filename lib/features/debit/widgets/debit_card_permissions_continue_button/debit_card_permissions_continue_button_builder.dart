/*
 * 
 * Neobank.Client
 * 
 * Created on 07/02/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/debit/widgets/debit_card_permissions_continue_button/debit_card_permissions_continue_button.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_size.dart';

part 'debit_card_permissions_continue_button_builder.g.dart';

@JsonWidget(type: 'debit_card_permissions_continue_button')
abstract class _DebitCardPermissionsContinueButtonBuilder extends JsonWidgetBuilder {
  const _DebitCardPermissionsContinueButtonBuilder({required super.args});

  @override
  DebitCardPermissionsContinueButton buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
