import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'neo_bo_pdf_view_widget.dart';

part 'neo_bo_pdf_view.g.dart';

@jsonWidget
abstract class _NeoBoPdfView extends JsonWidgetBuilder {
  const _NeoBoPdfView({
    required super.args,
  });

  @override
  NeoBoPdfViewWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return NeoBoPdfViewWidget(
      bytes: args["bytes"],
    );
  }
}
