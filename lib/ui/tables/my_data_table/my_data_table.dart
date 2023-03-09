// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../core/export/_.dart';
import 'my_data_table_row.dart';
import 'my_row_source.dart';

export 'my_data_table_row.dart';
export 'my_row_source.dart';

class MyDataTable<T> extends StatefulWidget {
  final List<MyDataTableRow<T>> items;
  final Function addPress;
  final Function(T item) onSelect;
  final Function(String item) onSearch;
  const MyDataTable({
    Key? key,
    required this.items,
    required this.addPress,
    required this.onSelect,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<MyDataTable<T>> createState() => _MyDataTableState<T>();
}

class _MyDataTableState<T> extends State<MyDataTable<T>> {
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
                        Icons.refresh,
                        color: KC.primary,
                        size: 32,
                      )),
                  IconButton(
                      onPressed: () {
                        widget.addPress();
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
                  widget.onSelect(widget.items[index].item);
                },
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
            setState(() {});
            widget.onSearch(value);
          },
        ),
      ),
    );
  }
}
