// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/export/_.dart';

class UserList extends StatefulWidget {
  final UserModel model;
  const UserList({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

List<UserModel> users = [];
List<UserModel> selectedUsers = [];

class _UserListState extends State<UserList> {
  bool sort = true;
  List<UserModel>? filterData;

  void sortTableName(int columnIndex) {
    return setState(() {
      _currentSortColumn = columnIndex;
      if (_isAscending == true) {
        _isAscending = false;
        filterData!.sort((a, b) => a.lastName.compareTo(b.lastName));
      } else {
        _isAscending = true;
        filterData!.sort((a, b) => b.lastName.compareTo(a.lastName));
      }
    });
  }

  void sortTablelastName(int columnIndex) {
    return setState(() {
      _currentSortColumn = columnIndex;
      if (_isAscending == true) {
        _isAscending = false;
        filterData!.sort((a, b) => a.lastName.compareTo(b.lastName));
      } else {
        _isAscending = true;
        filterData!.sort((a, b) => b.lastName.compareTo(a.lastName));
      }
    });
  }

  int _currentSortColumn = 0;
  bool _isAscending = true;

  @override
  void initState() {
    filterData = usersMockList;
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
                users: usersMockList,
                count: usersMockList.length,
                context: context,
              ),
              rowsPerPage: 8,
              columnSpacing: 8,
              columns: [
                DataColumn(
                  label: Text("Reference",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                    label: const Text(
                      "Name",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                    onSort: (columnIndex, _) {
                      sortTableName(columnIndex);
                    }),
                DataColumn(
                  onSort: (columnIndex, _) {
                    sortTablelastName(columnIndex);
                  },
                  label: Text("Surname",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                  label: Text("Status",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                  label: Text("Tags",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
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
          decoration: const InputDecoration(
              labelStyle: TextStyle(color: KC.primary),
              icon: Icon(Icons.search),
              hintText: "Search"),
          onChanged: (value) {
            setState(() {
              usersMockList = filterData!
                  .where((element) => element.firstName.contains(value))
                  .toList();
            });
          },
        ),
      ),
    );
  }
}

DataRow recentFileDataRow(
  BuildContext context,
  UserModel model,
  List<UserModel> userList,
  int index,
  int selectedCount,
  // final Function(bool selected) onRowSelected,
) {
  return DataRow.byIndex(
    index: index,
    selected: userList[index].isSelected,
    onSelectChanged: (value) {
      if (userList.contains(model) != value) {
        selectedCount += value! ? 1 : -1;
        assert(selectedCount >= 0);
        userList[index].isSelected = value;
        // notifyListeners();
        // onRowSelected();
        //print('selected rows: $selectedRowCount');
      }
    },
    cells: [
      DataCell(
        Text(model.reference,
            textAlign: TextAlign.start,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w400)),
      ),
      DataCell(Text(model.firstName,
          style:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
      DataCell(Text(model.lastName,
          style:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
      DataCell(Icon(
        model.status,
        color: Colors.black54,
      )),
      DataCell(
        HoverWidget(
          onHover: (a) {},
          hoverChild: GestureDetector(
            onTap: (() {
              tagPopUp(context);
            }),
            child: GestureDetector(
                child: Text(model.tags,
                    style: TextStyle(
                        color: KC.primary, fontWeight: FontWeight.w400))),
          ),
          child: GestureDetector(
              child: Text(model.tags,
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w400))),
        ),
      ),
    ],
  );
}

class RowSource extends DataTableSource {
  final List<UserModel> users;
  final count;
  final BuildContext context;
  RowSource({
    required this.users,
    required this.count,
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(
          context, users[index], users, index, selectedRowCount);
    } else
      return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}
