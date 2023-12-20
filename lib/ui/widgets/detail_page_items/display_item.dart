// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../helpers/exporter.dart';

class DisplayTabItemWidget extends StatelessWidget {
  final DisplayTabModel value;
  final String id;
  const DisplayTabItemWidget({
    Key? key,
    required this.value,
    required this.id,
  }) : super(key: key);
  HomeController get homeController => Get.find<HomeController>();

  DisplayController get displayController => Get.find<DisplayController>(tag: id);

  @override
  Widget build(BuildContext context) {
    switch (value.type) {
      case DisplayTabType.render:
        return Obx(() {
          var t = displayController.templates[value.template!.print()];
          return RenderWidget(template: t);
        });
      case DisplayTabType.search:
        return Obx(
          () => TabDataTable(
            withSearch: displayController.searchModels[value.entity]!.entity.search.search,
            onSearch: (val) {
              displayController.search(tab: value, keyword: val);
            },
            columns: displayController.searchModels[value.entity]!.entity.search.columns,
            data: displayController.searchModels[value.entity]!.data,
            onPressed: (data) {},
          ),
        );
      case DisplayTabType.splitRow:
        return Row(
          children: value.items!
              .map(
                (e) => Expanded(
                  child: splitItem(e),
                ),
              )
              .toList(),
        );
      case DisplayTabType.splitColumn:
        return Column(
          children: value.items!
              .map(
                (e) => Expanded(
                  child: splitItem(e),
                ),
              )
              .toList(),
        );
      case DisplayTabType.formio:
        return FormioWidget(
          schema: formioTestJson,
          withBackButton: false,
        );
      case DisplayTabType.pdf:
        Uint8List? bytes;
        if (value.source == "data") {
          String? data = value.data?.jsWithData(displayController.displayData);
          if (data != null) bytes = getPdfFile(data);
        }
        return PdfWidget(
          bytes: bytes,
        );
      default:
        return Container();
    }
  }

  Widget splitItem(DisplayTabModel item) {
    if (item.type.isSplit) return DisplayTabItemWidget(value: item, id: id);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
          color: Colors.grey[200]),
      margin: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          Text(item.title.print()),
          Divider(),
          Expanded(child: DisplayTabItemWidget(value: item, id: id)),
        ],
      ),
    );
  }
}
