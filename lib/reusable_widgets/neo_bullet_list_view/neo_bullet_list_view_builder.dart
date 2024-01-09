import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_bullet_list_view/neo_bullet_list_view.dart';

part 'neo_bullet_list_view_builder.g.dart';

// STOPSHIP: Delete this ignore
// ignore_for_file: deprecated_member_use_from_same_package
@JsonWidget(type: 'neo_bullet_list_view')
abstract class _NeoBulletListViewBuilder extends JsonWidgetBuilder {
  const _NeoBulletListViewBuilder({
    required super.args,
  });

  @JsonArgDecoder('bulletList')
  List<String> _decodeBulletList({required JsonWidgetData data}) => List.castFrom(data.jsonWidgetArgs["bulletList"]);

  @override
  NeoBulletListView buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
