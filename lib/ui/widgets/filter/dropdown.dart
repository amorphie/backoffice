// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../helpers/exporter.dart';

class FilterDropdown extends StatelessWidget {
  final FilterLayout filter;
  final dynamic value;
  final Function(dynamic val) onSelected;
  FilterDropdown({
    Key? key,
    required this.filter,
    this.value,
    required this.onSelected,
  }) : super(key: key);
  final FilterController filterController = Get.find<FilterController>();
  final EntityController entityController = Get.find<EntityController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          filter.title.enEN,
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<dynamic>(
              isExpanded: true,
              value: value,
              items: [
                DropdownMenuItem<dynamic>(value: null, child: Text("All")),
                ...filterController.filterDataList[filter.entity]!
                    .map((e) => DropdownMenuItem<dynamic>(
                        value: e,
                        child: Text(
                          entityController.entities[filter.entity]!.search.titleTemplate.templateWithData(e),
                        )))
                    .toList()
              ],
              onChanged: (val) {
                onSelected(val);
              },
            ),
          ),
        ),
      ],
    );
  }
}
