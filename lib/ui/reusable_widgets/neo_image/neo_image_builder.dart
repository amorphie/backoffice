import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:admin/ui/reusable_widgets/neo_image/neo_image.dart';

part 'neo_image_builder.g.dart';

@JsonWidget(type: 'neo_image')
abstract class _NeoImageBuilder extends JsonWidgetBuilder {
  const _NeoImageBuilder({required super.args});

  @override
  NeoImage buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
