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
    );
  // ..registerCustomBuilder(
  //   JsonNeoDetailPageBuilder.kType,
  //   JsonWidgetBuilderContainer(builder: JsonNeoDetailPageBuilder.fromDynamic),
  // )
  // ..registerCustomBuilder(
  //   TitleDescriptionArea.kType,
  //   JsonWidgetBuilderContainer(builder: TitleDescriptionArea.fromDynamic),
  // )
  // ..registerCustomBuilder(
  //   NameTemplate.kType,
  //   JsonWidgetBuilderContainer(
  //     builder: NameTemplate.fromDynamic,
  //   ),
  // )
  // ..registerCustomBuilder(
  //   ExpandedRowArea.kType,
  //   JsonWidgetBuilderContainer(
  //     builder: ExpandedRowArea.fromDynamic,
  //   ),
  // )
  // ..registerCustomBuilder(
  //   JsonExpansionTileBuilder.kType,
  //   JsonWidgetBuilderContainer(
  //     builder: JsonExpansionTileBuilder.fromDynamic,
  //   ),
  // )
  // ..registerCustomBuilder(
  //   DetailTitle.kType,
  //   JsonWidgetBuilderContainer(
  //     builder: DetailTitle.fromDynamic,
  //   ),
  // );
}
