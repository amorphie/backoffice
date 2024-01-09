import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_hypertext/model/neo_hypertext_highlighted_item.dart';
import 'package:backoffice/reusable_widgets/neo_hypertext/neo_hypertext.dart';

part 'neo_hypertext_builder.g.dart';

abstract class _Constants {
  static const highlightedItemKey = 'highlightedItems';
}

@JsonWidget(type: 'neo_hypertext')
abstract class _NeoHypertextWidgetBuilder extends JsonWidgetBuilder {
  @JsonArgDecoder(_Constants.highlightedItemKey)
  List<NeoHypertextHighlightedItem> _decodeHighlightedItemtList({required JsonWidgetData data}) => data.jsonWidgetArgs[_Constants.highlightedItemKey] == null
      ? []
      : List.castFrom(data.jsonWidgetArgs[_Constants.highlightedItemKey] as List<dynamic>? ?? []).map((e) => NeoHypertextHighlightedItem.fromJson(e)).toList();
  const _NeoHypertextWidgetBuilder({
    required super.args,
  });

  @override
  NeoHypertext buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
