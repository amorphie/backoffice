import 'package:admin/core/mocks/resource_mock.dart';
import 'package:admin/core/models/resource.dart';

import '../../core/export/_.dart';

class ResourceTable extends StatefulWidget {
  const ResourceTable({
    Key? key,
  }) : super(key: key);

  @override
  State<ResourceTable> createState() => _ResourceTableState();
}

class _ResourceTableState extends State<ResourceTable> {
  int currentSortColumn = 0;
  bool _isAscending = true;
  bool sort = true;
  List<ResourceModel>? filterData;
  late List<ResourceModel> resources;

  void sortTableName(int columnIndex) {
    return setState(() {
      currentSortColumn = columnIndex;
      if (_isAscending) {
        _isAscending = false;
        filterData!.sort((a, b) => a.displayName!.compareTo(b.displayName!));
      } else {
        _isAscending = true;
        filterData!.sort((a, b) => b.displayName!.compareTo(a.displayName!));
      }
    });
  }

  @override
  void initState() {
    resources = resourceMockList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tags",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(
              width: double.infinity,
              child: PaginatedDataTable(
                sortColumnIndex: 0,
                sortAscending: sort,
                header: Row(
                  children: [
                    // search(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_alt_rounded,
                          color: KC.primary,
                          size: 32,
                        )),
                    IconButton(
                        onPressed: () {
                          addUser(context);
                        },
                        icon: Icon(
                          Icons.add_circle_outlined,
                          color: KC.primary,
                          size: 32,
                        ))
                  ],
                ),
                source: RowSource(
                  resources: resources,
                  count: resources.length,
                  context: context,
                  // onClick: (index) {},
                  // isSelected: (index) =>
                  //     selectedUsers.firstWhereOrNull(
                  //         (element) => users[index] == element) !=
                  //     null,
                  // onSelect: (index) {
                  //   TagModel? u = selectedUsers
                  //       .firstWhereOrNull((element) => users[index] == element);
                  //   if (u != null) {
                  //     selectedUsers.remove(users[index]);
                  //   } else {
                  //     selectedUsers.add(users[index]);
                  //   }
                  //   setState(() {});
                  // },
                ),
                rowsPerPage: 8,
                columnSpacing: 3,
                columns: [
                  DataColumn(
                    label: Text("ID",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)),
                  ),
                  DataColumn(
                    label: Text("Display Name",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)),
                    onSort: (columnIndex, _) {
                      sortTableName(columnIndex);
                    },
                  ),
                  DataColumn(
                    label: Text("Url",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)),
                  ),
                  DataColumn(
                    label: Text("Type",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)),
                  ),
                  DataColumn(
                    label: Text("Statu",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)),
                  ),
                  DataColumn(
                    label: Text("Tag",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)),
                  ),
                  DataColumn(
                    label: Text("Description",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class RowSource extends DataTableSource {
  final int count;
  final List<ResourceModel> resources;
  final BuildContext context;
  // final bool Function(int index) isSelected;
  // final Function(int index) onClick;
  RowSource({
    required this.count,
    required this.resources,
    required this.context,
    // required this.isSelected,
    // required this.onClick,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(
        context: context,
        index: index,
        // isSelected: isSelected,
        model: resources[index],
        // onClick: onClick,
      );
    } else
      return null;
  }

  DataRow recentFileDataRow({
    required BuildContext context,
    required ResourceModel model,
    required int index,
    // required Function(int index) onClick,
    // required bool Function(int index) isSelected,
  }) {
    return DataRow.byIndex(
      index: index,
      // selected: isSelected(index),
      // onSelectChanged: (value) {
      //   if (value != null) {
      //     onClick(index);
      //   }
      // },
      cells: [
        DataCell(
          Text(model.id,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.w400)),
        ),
        DataCell(Text(model.displayName!,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
        DataCell(Text(model.url!,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
        DataCell(Text(model.type!,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
        DataCell(Text(model.status!,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
        DataCell(Text(model.tags!.toString(),
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
        DataCell(Text(model.description!,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}
