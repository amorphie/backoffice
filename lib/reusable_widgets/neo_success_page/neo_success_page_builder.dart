import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_success_page/neo_success_page.dart';

part 'neo_success_page_builder.g.dart';

@JsonWidget(type: 'neo_success_page')
abstract class _NeoSuccessPageBuilder extends JsonWidgetBuilder {
  const _NeoSuccessPageBuilder({required super.args});

  @override
  NeoSuccessPage buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
