import 'package:backoffice/backoffice/widgets/neo_bo_datatable/neo_bo_datatable.dart';
import 'package:backoffice/backoffice/widgets/neo_bo_listview/neo_bo_listview.dart';
import 'package:backoffice/backoffice/widgets/neo_bo_pdf_view/neo_bo_pdf_view.dart';
import 'package:backoffice/backoffice/widgets/neo_detail_page/neo_detail_page.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'neo_bo_tabview/neo_bo_tabview.dart';
import 'neo_bo_webview/neo_bo_webview.dart';

JsonWidgetRegistry jsonWidgetRegistry = JsonWidgetRegistry.instance;
appRenderInit() {
  jsonWidgetRegistry
    ..registerCustomBuilder(
      JsonNeoBoTabviewBuilder.kType,
      JsonWidgetBuilderContainer(builder: JsonNeoBoTabviewBuilder.fromDynamic),
    )
    ..registerCustomBuilder(
      NeoBoWebview.kType,
      JsonWidgetBuilderContainer(builder: NeoBoWebview.fromDynamic),
    )
    ..registerCustomBuilder(
      NeoBoDatatable.kType,
      JsonWidgetBuilderContainer(builder: NeoBoDatatable.fromDynamic),
    )
    ..registerCustomBuilder(
      JsonNeoDetailPageBuilder.kType,
      JsonWidgetBuilderContainer(builder: JsonNeoDetailPageBuilder.fromDynamic),
    )
    ..registerCustomBuilder(
      NeoBoListview.kType,
      JsonWidgetBuilderContainer(builder: NeoBoListview.fromDynamic),
    )
    ..registerCustomBuilder(
      NeoBoPdfView.kType,
      JsonWidgetBuilderContainer(builder: NeoBoPdfView.fromDynamic),
    );
}
