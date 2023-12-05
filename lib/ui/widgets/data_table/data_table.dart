// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../helpers/exporter.dart';

class AppDataTable extends StatelessWidget {
  final TitleModel title;
  final Function(String val) onSearch;
  final Function(String val) onEndpointSuffix;
  final Function addPressed;
  final Function filterPressed;
  final bool loading;
  final bool entityLoading;
  final bool withSearch;
  final bool withEndpointSuffix;
  final bool hasFilter;
  final bool filterView;
  final List<SearchColumn> columns;
  final List<Map<String, dynamic>> data;
  final Function(Map<String, dynamic> data) onPressed;
  final int rowsPerPage;
  final Function(int perPage) onRowsPerPageChanged;
  final Function onFinish;

  const AppDataTable({
    Key? key,
    required this.title,
    required this.withSearch,
    required this.withEndpointSuffix,
    required this.onSearch,
    required this.onEndpointSuffix,
    required this.addPressed,
    required this.filterPressed,
    this.loading = false,
    this.entityLoading = false,
    this.hasFilter = false,
    this.filterView = false,
    required this.columns,
    required this.data,
    required this.onPressed,
    required this.rowsPerPage,
    required this.onRowsPerPageChanged,
    required this.onFinish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 16.0, top: 10, bottom: 14),
            //   child: Text(
            //     title.print(),
            //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black54),
            //   ),
            // ),
            Builder(builder: (context) {
              return Column(
                children: [
                  Row(
                    children: [
                      if (withSearch) SerachTextfield(flex: 4, onSearch: onSearch),
                      if (withEndpointSuffix)
                        SerachTextfield(
                          onSearch: onEndpointSuffix,
                          hintText: "Identity Number",
                          defaultValue: "15059003384",
                        ),
                      if (hasFilter)
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: IconButton(
                              onPressed: () {
                                filterPressed();
                              },
                              icon: Icon(
                                Icons.filter_alt_rounded,
                                color: KC.primary,
                                size: 32,
                              )),
                        ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: IconButton(
                            onPressed: () {
                              addPressed();
                            },
                            icon: Icon(
                              Icons.add_circle_outlined,
                              color: KC.primary,
                              size: 32,
                            )),
                      )
                    ],
                  ),
                  if (filterView) FilterArea(),
                  if (data.length > 0)
                    PaginatedDataTable(
                      rowsPerPage: rowsPerPage,
                      availableRowsPerPage: [10, 20, 50],
                      onRowsPerPageChanged: (value) {
                        if (value != null) {
                          onRowsPerPageChanged(value);
                        }
                      },
                      onPageChanged: (value) {
                        if (value + rowsPerPage == data.length) {
                          onFinish();
                        }
                      },
                      columns: columns
                          .map((e) => DataColumn(
                                  label: Text(
                                e.title.print(),
                                style: TextStyle(color: Colors.black87),
                                overflow: TextOverflow.ellipsis,
                              )))
                          .toList(),
                      source: AppDataTableSource(data: data, columns: columns, onPressed: onPressed),
                    ),
                ],
              );
            }),
          ],
        ),
        if (loading) AppIndicator(),
        if (entityLoading) AbsorbPointer(child: AppIndicator()),
      ],
    );
  }
}

class SerachTextfield extends StatelessWidget {
  final String? hintText;
  final int flex;
  final String? defaultValue;
  const SerachTextfield({
    Key? key,
    this.hintText = "Search",
    this.flex = 1,
    this.defaultValue,
    required this.onSearch,
  }) : super(key: key);

  final Function(String val) onSearch;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: TextField(
          controller: TextEditingController(text: defaultValue),
          cursorColor: KC.secondary,
          onSubmitted: onSearch,
          inputFormatters: [],
          // onChanged: (value) {
          //   onSearch(value);
          // },
          decoration: InputDecoration(
            hintText: hintText,
            prefixIconColor: KC.primary,
            prefixIcon: Icon(Icons.search),
            iconColor: KC.primary,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: KC.secondary, width: 1.5),
            ),
            focusColor: Colors.redAccent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
