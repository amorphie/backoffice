// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/ui/widgets/data_table/datatable.dart';
import 'package:admin/ui/widgets/data_table/datatable_type.dart';

import '../../helpers/exporter.dart';

class AppDataTable extends StatelessWidget {
  final Function(String val) onSearch;
  final bool withSearch;

  final Function(String val) onEndpointSuffix;
  final bool withEndpointSuffix;

  final Function addPressed;

  final Function filterPressed;
  final bool hasFilter;
  final bool filterView;

  final bool loading;
  final bool entityLoading;

  final int rowsPerPage;
  final Function(int perPage) onRowsPerPageChanged;

  final List<SearchColumn> columns;
  final List<Map<String, dynamic>> data;
  final Function(Map<String, dynamic> data) onPressed;
  final Function onFinish;

  const AppDataTable({
    Key? key,
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
        Column(
          children: [
            Row(
              children: [
                if (withSearch) SerachTextfield(flex: 4, onSearch: onSearch),
                if (withEndpointSuffix)
                  SerachTextfield(
                    onSearch: onEndpointSuffix,
                    hintText: "Suffix",
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
              Expanded(
                child: CustomDataTable(
                    type: DatatableType.paginated,
                    rowsPerPage: rowsPerPage,
                    onRowsPerPageChanged: onRowsPerPageChanged,
                    onFinish: () {
                      onFinish();
                    },
                    data: data,
                    columns: columns,
                    onPressed: onPressed),
              ),
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
