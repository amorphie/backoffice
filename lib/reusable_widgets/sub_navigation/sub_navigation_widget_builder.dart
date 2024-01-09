import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/sub_navigation/models/sub_navigation_component_details.dart';
import 'package:backoffice/reusable_widgets/sub_navigation/sub_navigation_widget.dart';

part 'sub_navigation_widget_builder.g.dart';

@JsonWidget(type: 'sub_navigation_widget')
abstract class _SubNavigationWidgetBuilder extends JsonWidgetBuilder {
  const _SubNavigationWidgetBuilder({
    required super.args,
  });

  @JsonArgDecoder('componentDetailsList')
  List<SubNavigationComponentDetails> _decodeComponentDetailsList({required JsonWidgetData data}) =>
      (data.jsonWidgetArgs["items"] as List<dynamic>).map((e) => SubNavigationComponentDetails.fromJson(e)).toList();

  @override
  SubNavigationWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
