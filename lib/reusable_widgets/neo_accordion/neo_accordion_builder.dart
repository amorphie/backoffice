import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_accordion/neo_accordion.dart';

part 'neo_accordion_builder.g.dart';

@JsonWidget(type: 'neo_accordion')
abstract class _NeoAccordionBuilder extends JsonWidgetBuilder {
  const _NeoAccordionBuilder({required super.args});

  @override
  NeoAccordion buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
