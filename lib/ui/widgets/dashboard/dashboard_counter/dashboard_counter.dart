// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../helpers/exporter.dart';

class DashboardCounter extends StatelessWidget {
  final DashboardItemModel item;
  const DashboardCounter({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: item.data!.list.map((e) => DashboardCounterItem(title: e.title, value: e.value.toString())).toList(),
    );
  }
}
