import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_checkbox/model/neo_checkbox_item_model.dart';
import 'package:backoffice/reusable_widgets/neo_checkbox_group/neo_checkbox_group_widget.dart';

part 'neo_checkbox_group_widget_builder.g.dart';

abstract class _Constants {
  static const itemModelsKey = "items";
}

@JsonWidget(type: 'neo_checkbox_group_widget')
abstract class _NeoCheckboxGroupWidgetBuilder extends JsonWidgetBuilder {
  const _NeoCheckboxGroupWidgetBuilder({
    required super.args,
  });

  @JsonArgDecoder(_Constants.itemModelsKey)
  List<NeoCheckboxItemModel> _decodeBottomNavigationModelList({required JsonWidgetData data}) {
    final listJson = data.jsonWidgetArgs[_Constants.itemModelsKey];
    return listJson != null ? List<Map<String, dynamic>>.from(listJson).map(NeoCheckboxItemModel.fromJson).toList() : [];
  }

  @override
  NeoCheckboxGroupWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
