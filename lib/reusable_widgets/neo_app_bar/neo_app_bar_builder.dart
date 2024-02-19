import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/model/neo_app_bar_left_widget_type.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/neo_app_bar.dart';

part 'neo_app_bar_builder.g.dart';

@JsonWidget(type: 'neo_app_bar')
abstract class _NeoAppBarBuilder extends JsonWidgetBuilder {
  const _NeoAppBarBuilder({required super.args});

  @override
  NeoAppBar buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
