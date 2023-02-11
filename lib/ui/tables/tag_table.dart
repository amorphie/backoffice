import '../../core/export/_.dart';

class TagTable extends StatefulWidget {
  const TagTable({
    Key? key,
  }) : super(key: key);

  @override
  State<TagTable> createState() => _TagTableState();
}

class _TagTableState extends State<TagTable> {
  int currentSortColumn = 0;
  bool _isAscending = true;
  bool sort = true;
  List<TagModel>? filterData;
  late List<TagModel> tags;

  void sortTableName(int columnIndex) {
    return setState(() {
      currentSortColumn = columnIndex;
      if (_isAscending) {
        _isAscending = false;
        filterData!.sort((a, b) => a.tagName.compareTo(b.tagName));
      } else {
        _isAscending = true;
        filterData!.sort((a, b) => b.tagName.compareTo(a.tagName));
      }
    });
  }

  @override
  void initState() {
    tags = tagsMockList;
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
                  tags: tags,
                  count: tags.length,
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
                columnSpacing: 8,
                columns: [
                  DataColumn(
                    label: Text("ID",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)),
                  ),
                  DataColumn(
                    label: Text("Tag Name",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)),
                  ),
                  DataColumn(
                    label: Text("Edit",
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
  final List<TagModel> tags;
  final BuildContext context;
  // final bool Function(int index) isSelected;
  // final Function(int index) onClick;
  RowSource({
    required this.count,
    required this.tags,
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
        model: tags[index],
        // onClick: onClick,
      );
    } else
      return null;
  }

  DataRow recentFileDataRow({
    required BuildContext context,
    required TagModel model,
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
        DataCell(Text(model.tagName,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
        DataCell(Icon(model.edit)),
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
