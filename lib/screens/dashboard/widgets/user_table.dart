// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../core/export/_.dart';
import '../../../core/helpers/dialogs.dart';

class UserList extends StatefulWidget {
  final UserModel model;
  const UserList({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  bool sort = true;
  List<UserModel>? filterData;

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData!.sort((a, b) => a.firstName.compareTo(b.firstName));
      } else {
        filterData!.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
  }

  @override
  void initState() {
    filterData = users;
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
                    onSort: (columnIndex, ascending) {
                      setState(() {
                        sort = !sort;
                      });

                      onsortColum(columnIndex, ascending);
                    }),
                DataColumn(
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
              users = filterData!
                  .where((element) => element.firstName.contains(value))
                  .toList();
            });
          },
        ),
      ),
    );
  }
}

DataRow recentFileDataRow(BuildContext context, UserModel model) {
  return DataRow(
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
  List<UserModel> users;
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
      return recentFileDataRow(context, users[index]);
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
