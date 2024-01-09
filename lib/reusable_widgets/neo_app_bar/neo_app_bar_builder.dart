import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/model/neo_app_bar_action_model.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/model/neo_app_bar_left_widget_type.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/neo_app_bar.dart';

part 'neo_app_bar_builder.g.dart';

abstract class _Constants {
  static const actionListKey = 'actionList';
}

@JsonWidget(type: 'neo_app_bar')
abstract class _NeoAppBarBuilder extends JsonWidgetBuilder {
  const _NeoAppBarBuilder({required super.args});

  @JsonArgDecoder(_Constants.actionListKey)
  List<NeoAppBarActionModel> _decodeActions({required JsonWidgetData data}) {
    return List<Map<String, dynamic>>.from(data.jsonWidgetArgs[_Constants.actionListKey] ?? []).map(NeoAppBarActionModel.fromJson).toList();
  }

  @override
  NeoAppBar buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
