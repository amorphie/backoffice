import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_divider/neo_divider.dart';

part 'neo_divider_builder.g.dart';

@JsonWidget(type: 'neo_divider')
abstract class _NeoDividerBuilder extends JsonWidgetBuilder {
  const _NeoDividerBuilder({
    required super.args,
  });

  @override
  NeoDivider buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
