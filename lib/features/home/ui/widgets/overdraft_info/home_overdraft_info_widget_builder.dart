import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/home/ui/widgets/overdraft_info/home_overdraft_info_widget.dart';

part 'home_overdraft_info_widget_builder.g.dart';

@JsonWidget(type: 'home_overdraft_info_widget')
abstract class _HomeOverdraftInfoWidgetBuilder extends JsonWidgetBuilder {
  const _HomeOverdraftInfoWidgetBuilder({
    required super.args,
  });

  @override
  HomeOverdraftInfoWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
