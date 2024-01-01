import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:admin/ui/reusable_widgets/neo_avatar/neo_avatar.dart';

part 'neo_avatar_builder.g.dart';

@JsonWidget(type: 'neo_avatar')
abstract class _NeoAvatarBuilder extends JsonWidgetBuilder {
  const _NeoAvatarBuilder({
    required super.args,
  });

  @override
  NeoAvatar buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
