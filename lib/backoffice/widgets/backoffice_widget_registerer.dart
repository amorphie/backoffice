import 'package:backoffice/backoffice/widgets/neo_bo_listview/neo_bo_listview.dart';
import 'package:backoffice/backoffice/widgets/neo_bo_pdf_view/neo_bo_pdf_view.dart';
import 'package:backoffice/backoffice/widgets/neo_detail_page/neo_detail_page.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'neo_bo_datagrid/neo_bo_datagrid.dart';
import 'neo_bo_detail_item/neo_bo_detail_item.dart';
import 'neo_bo_detail_item_title/neo_bo_detail_item_title.dart';
import 'neo_bo_expanded_row/neo_bo_expanded_row.dart';
import 'neo_bo_summary/neo_bo_summary.dart';
import 'neo_bo_tabview/neo_bo_tabview.dart';
import 'neo_bo_webview/neo_bo_webview.dart';

typedef JsonWidgetBuilderPair = ({
  String type,
  JsonWidgetBuilder Function(dynamic, {JsonWidgetRegistry? registry}) func,
});

class BackofficeWidgetRegisterer {
  static final registry = JsonWidgetRegistry.instance;

  static final List<JsonWidgetBuilderPair> _backofficeWidgetBuilderPairs = [
    (type: NeoBoDatagrid.kType, func: NeoBoDatagrid.fromDynamic),
    (type: NeoBoExpandedRow.kType, func: NeoBoExpandedRow.fromDynamic),
    (type: JsonNeoBoTabviewBuilder.kType, func: JsonNeoBoTabviewBuilder.fromDynamic),
    (type: NeoBoWebview.kType, func: NeoBoWebview.fromDynamic),
    (type: JsonNeoDetailPageBuilder.kType, func: JsonNeoDetailPageBuilder.fromDynamic),
    (type: NeoBoListview.kType, func: NeoBoListview.fromDynamic),
    (type: NeoBoPdfView.kType, func: NeoBoPdfView.fromDynamic),
    (type: NeoBoSummary.kType, func: NeoBoSummary.fromDynamic),
    (type: NeoBoDetailItemTitle.kType, func: NeoBoDetailItemTitle.fromDynamic),
    (type: NeoBoDetailItem.kType, func: NeoBoDetailItem.fromDynamic),
  ];

  void init() {
    final Map<String, JsonWidgetBuilderContainer> buildersMap = {};

    for (final pair in _backofficeWidgetBuilderPairs) {
      buildersMap[pair.type] = JsonWidgetBuilderContainer(builder: pair.func);
    }
    registry.registerCustomBuilders(buildersMap);
  }
}
