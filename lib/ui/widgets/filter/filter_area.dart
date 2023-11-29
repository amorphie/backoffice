import '../../../helpers/exporter.dart';

class FilterArea extends StatefulWidget {
  FilterArea({Key? key}) : super(key: key);

  @override
  State<FilterArea> createState() => _FilterAreaState();
}

class _FilterAreaState extends State<FilterArea> {
  EntityController entityController = Get.find<EntityController>();

  List<FilterLayout> get filters => entityController.entity.search!.filter ?? [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(children: [
        ...filters.map((e) => FilterItem(filter: e)).toList(),
        Container(
          decoration: BoxDecoration(color: KC.primary, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
            child: TextButton(
              child: Tooltip(
                  message: "Ara",
                  child: Text(
                    "Ara",
                    style: TextStyle(color: Colors.white),
                  )),
              onPressed: () async {
                final FilterController filterController = Get.find<FilterController>();
                await filterController.onFilter();
              },
            ),
          ),
        ),
      ]),
    );
  }
}
