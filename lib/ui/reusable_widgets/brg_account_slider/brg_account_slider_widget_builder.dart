import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:admin/ui/reusable_widgets/brg_account_slider/brg_account_slider_widget.dart';

part 'brg_account_slider_widget_builder.g.dart';

@JsonWidget(type: 'brg_account_slider_widget')
abstract class _BrgAccountSliderWidgetBuilder extends JsonWidgetBuilder {
  const _BrgAccountSliderWidgetBuilder({
    required super.args,
  });

  @override
  BrgAccountSliderWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
