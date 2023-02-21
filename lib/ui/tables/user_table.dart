// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import '../../core/export/_.dart';

class UserTable extends StatefulWidget {
  final Function(UserModel user) select;
  const UserTable({
    Key? key,
    required this.select,
  }) : super(key: key);

  @override
  State<UserTable> createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
// List<UserModel> users = [];
  late List<UserModel> selectedUsers;
  bool sort = true;
  List<UserModel>? filterData;
  late List<UserModel> users;

  void sortTableName(int columnIndex) {
    return setState(() {
      currentSortColumn = columnIndex;
      if (_isAscending) {
        _isAscending = false;
        filterData!.sort((a, b) => a.firstName.compareTo(b.firstName));
      } else {
        _isAscending = true;
        filterData!.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    });
  }

  void sortTablelastName(int columnIndex) {
    return setState(() {
      currentSortColumn = columnIndex;
      if (_isAscending) {
        _isAscending = false;
        filterData!.sort((a, b) => a.lastName.compareTo(b.lastName));
      } else {
        _isAscending = true;
        filterData!.sort((a, b) => b.lastName.compareTo(a.lastName));
      }
    });
  }

  int currentSortColumn = 0;
  bool _isAscending = true;

  @override
  void initState() {
    users = [];
    filterData = users;
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
              sortAscending: sort,
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
                users: users,
                count: users.length,
                context: context,
                onClick: (index) {
                  widget.select(users[index]);
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
                DataColumn(
                  label: Text("Reference", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                    label: const Text(
                      "Name",
                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                    onSort: (columnIndex, _) {
                      sortTableName(columnIndex);
                    }),
                DataColumn(
                  onSort: (columnIndex, _) {
                    sortTablelastName(columnIndex);
                  },
                  label: Text("Surname", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                  label: Text("Status", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                  label: Text("Tags", textAlign: TextAlign.end, style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
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
            setState(() {
              users = filterData!.where((element) => element.firstName.contains(value)).toList();
              //TODO ana liste üzerinden değişiklik uygulandığı için değiştirilecek
            });
          },
        ),
      ),
    );
  }
}

class RowSource extends DataTableSource {
  final int count;
  final List<UserModel> users;
  final BuildContext context;
  //final bool Function(int index)? isSelected;
  //final Function(int index) onSelect;
  final Function(int index) onClick;
  RowSource({
    required this.count,
    required this.users,
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
        model: users[index],
        //onSelect: onSelect,
        onClick: onClick,
      );
    } else
      return null;
  }

  DataRow recentFileDataRow({
    required BuildContext context,
    required UserModel model,
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
        DataCell(
          Text(model.reference, textAlign: TextAlign.start, style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400)),
        ),
        DataCell(Text(model.firstName, style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
        DataCell(Text(model.lastName, style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
        DataCell(Icon(
          Icons.accessibility,
          color: Colors.black54,
        )),
        DataCell(
          HoverWidget(
            onHover: (a) {},
            hoverChild: GestureDetector(
              onTap: (() {
                tagPopUp(context);
              }),
              child: GestureDetector(child: Text(model.tags.toString(), style: TextStyle(color: KC.primary, fontWeight: FontWeight.w400))),
            ),
            child: GestureDetector(child: Text(model.tags.toString(), style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
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
