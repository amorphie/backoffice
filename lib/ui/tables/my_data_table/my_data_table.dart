// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../core/export/_.dart';
import 'my_data_table_row.dart';
import 'my_row_source.dart';
export 'my_data_table_row.dart';
export 'my_row_source.dart';

class MyDataTable<T> extends StatefulWidget {
  final List<MyDataTableRow<T>> items;

  final Function(T item) onSelect;
  final Function(String item) onFilter;
  const MyDataTable({
    Key? key,
    required this.items,
    required this.onSelect,
    required this.onFilter,
  }) : super(key: key);

  @override
  State<MyDataTable> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
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
              source: MyRowSource(
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
                ...widget.items.first.cells.map(
                  (e) {
                    return DataColumn(
                      label: Text(e.title, style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500)),
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
