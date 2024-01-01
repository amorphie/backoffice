import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'spacer_builder.g.dart';

@JsonWidget(type: 'spacer')
abstract class _SpacerBuilder extends JsonWidgetBuilder {
  const _SpacerBuilder({
    required super.args,
  });

  @override
  Spacer buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
