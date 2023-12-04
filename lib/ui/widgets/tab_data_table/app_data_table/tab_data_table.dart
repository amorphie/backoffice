import '../../../helpers/exporter.dart';

class TabDataTable extends StatelessWidget {
  final Function(String val) onSearch;
  final bool loading;
  final bool withSearch;
  final List<SearchColumn> columns;
  final List data;
  final Function(Map<String, dynamic> data) onPressed;

  const TabDataTable({
    Key? key,
    required this.withSearch,
    required this.onSearch,
    this.loading = false,
    required this.columns,
    required this.data,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) return AppIndicator();

    return ListView(
      children: [
        if (withSearch) search(),
        DataTable(
          rows: data
              .map((c) => DataRow(
                    cells: columns
                        .map((e) => DataCell(
                              c[e.data] is bool
                                  ? _icon(c[e.data] as bool)
                                  : Text(
                                      _print(c[e.data]),
                                      style: TextStyle(color: Colors.black54),
                                    ),
                              onTap: () {
                                onPressed(c);
                              },
                            ))
                        .toList(),
                  ))
              .toList(),
          columns: columns
              .map((e) => DataColumn(
                      label: Text(
                    e.title.enEN,
                    style: TextStyle(color: Colors.black87),
                  )))
              .toList(),
        ),
      ],
    );
  }

  Widget search() {
    return TextField(
      onSubmitted: onSearch,
      decoration: InputDecoration(hintText: "Search", prefixIconColor: KC.primary, prefixIcon: Icon(Icons.search), iconColor: KC.primary),
    );
  }

  String _print(dynamic item) {
    if (item is List)
      return item.join(", ");
    else {
      try {
        DateTime? dt = DateTime.tryParse(item);
        if (dt != null) {
          return dt.showDateTime;
        }
      } catch (e) {}
    }
    return item.toString();
  }

  Widget _icon(bool value) => Icon(value ? Icons.check_circle_rounded : Icons.close, color: value ? Colors.green : Colors.red);
}
