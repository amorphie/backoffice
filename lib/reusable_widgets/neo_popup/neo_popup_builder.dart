/*
 * Neobank.Client
 *
 * Created on 29/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_popup/model/neo_popup_action_model.dart';
import 'package:backoffice/reusable_widgets/neo_popup/model/neo_popup_type.dart';
import 'package:backoffice/reusable_widgets/neo_popup/neo_popup.dart';

part 'neo_popup_builder.g.dart';

class _Constants {
  static const neoPopupKey = 'neo_popup';
  static const actionsKey = 'actions';
}

@JsonWidget(type: _Constants.neoPopupKey)
abstract class _NeoPopupBuilder extends JsonWidgetBuilder {
  const _NeoPopupBuilder({
    required super.args,
  });

  @JsonArgDecoder(_Constants.actionsKey)
  List<NeoPopupActionModel> _decodeActions({required JsonWidgetData data}) {
    return List<Map<String, dynamic>>.from(data.jsonWidgetArgs[_Constants.actionsKey] ?? []).map(NeoPopupActionModel.fromJson).toList();
  }

  @override
  NeoPopup buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
