import '../../helpers/exporter.dart';

class GenericDetailWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final EntityModel entity;
  const GenericDetailWidget({super.key, required this.data, required this.entity});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: entity.search.columns.map((e) {
      try {
        return TitleDescriptionAreaWidget(
          title: e.title.print(),
          text: _print(e.data.jsWithData(data)),
        );
      } catch (err) {
        print(e);
        print(data);
        print(err);
        return Container();
      }
    }).toList());
  }

  String _print(dynamic item) {
    if (item is List)
      return item.join(", ");
    else
      return item.toString();
  }
}
