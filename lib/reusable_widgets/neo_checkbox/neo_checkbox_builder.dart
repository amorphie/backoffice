import 'package:backoffice/reusable_widgets/neo_checkbox/model/neo_checkbox_item_model.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_checkbox/neo_checkbox.dart';
import 'package:backoffice/util/neo_util.dart';

part 'neo_checkbox_builder.g.dart';

@JsonWidget(type: 'neo_checkbox')
abstract class _NeoCheckboxBuilder extends JsonWidgetBuilder {
  const _NeoCheckboxBuilder({
    required super.args,
  });

  @override
  NeoCheckbox buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
