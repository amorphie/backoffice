// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/core/base/base_model.dart';

import '../../core/export/_.dart';

class TableBase extends StatefulWidget {
  final List<BaseModel> items;
  final Function(BaseModel item) onSelect;
  final Function(String item) onFilter;
  const TableBase({
    Key? key,
    required this.items,
    required this.onSelect,
    required this.onFilter,
  }) : super(key: key);

  @override
  State<TableBase> createState() => _TableBaseState();
}

class _TableBaseState extends State<TableBase> {
// List<UserModel> users = [];
  late List<UserModel> selectedUsers;

  @override
  void initState() {
    selectedUsers = [];

    super.initState();
  }

  TextEditingController controller = TextEditingController();

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
          SizedBox(
            width: double.infinity,
            child: PaginatedDataTable(
              sortColumnIndex: 0,
              // sortAscending: sort,
              header: Row(
                children: [
                  search(),
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
                items: widget.items,
                count: widget.items.length,
                context: context,
                onClick: (index) {
                  widget.onSelect(widget.items[index]);
                },
                // isSelected: (index) =>
                // selectedUsers.firstWhereOrNull(
                //      (element) => users[index] == element) !=
                //    null,
                //    onSelect: (index) {
                //    UserModel? u = selectedUsers
                //        .firstWhereOrNull((element) => users[index] == element);
                //    if (u != null) {
                //      selectedUsers.remove(users[index]);
                //    } else {
                //      selectedUsers.add(users[index]);
                //    }
                //    setState(() {});
                //  },
              ),
              rowsPerPage: 8,
              columnSpacing: 8,
              showCheckboxColumn: false,
              columns: [
                ...widget.items.first.columns.map(
                  (e) {
                    return DataColumn(
                      label: Text(e, style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500)),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded search() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: TextField(
          controller: controller,
          style: TextStyle(color: Colors.black87),
          decoration: const InputDecoration(labelStyle: TextStyle(color: KC.primary), icon: Icon(Icons.search), hintText: "Search"),
          onChanged: (value) {
            widget.onFilter(value);
          },
        ),
      ),
    );
  }
}

class RowSource extends DataTableSource {
  final int count;
  final List<BaseModel> items;
  final BuildContext context;
  //final bool Function(int index)? isSelected;
  //final Function(int index) onSelect;
  final Function(int index) onClick;
  RowSource({
    required this.count,
    required this.items,
    required this.context,
    //this.isSelected,
    // required this.onSelect,
    required this.onClick,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(
        context: context,
        index: index,
        //isSelected: isSelected!,
        model: items[index],
        //onSelect: onSelect,
        onClick: onClick,
      );
    } else
      return null;
  }

  DataRow recentFileDataRow({
    required BuildContext context,
    required BaseModel model,
    required int index,
    // required Function(int index) onSelect,
    required Function(int index) onClick,
    //required bool Function(int index) isSelected,
  }) {
    return DataRow.byIndex(
      index: index,
      //selected: isSelected(index),
      onSelectChanged: (value) {
        if (value != null) {
          // onSelect(index);
          onClick(index);
        }
      },
      cells: [
        ...model.columns.map(
          (e) => DataCell(
            Text(model.toMap()[e].toString(), textAlign: TextAlign.start, style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400)),
          ),
        ),
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
