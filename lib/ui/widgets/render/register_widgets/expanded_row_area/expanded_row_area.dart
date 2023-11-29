import '../../../../../helpers/exporter.dart';

part 'expanded_row_area.g.dart';

@jsonWidget
abstract class _ExpandedRowArea extends JsonWidgetBuilder {
  const _ExpandedRowArea({
    required super.args,
  });

  @override
  ExpandedRowAreaWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return ExpandedRowAreaWidget(
      data: args["data"],
    );
  }
}
