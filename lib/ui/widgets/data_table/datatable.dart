// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/ui/helpers/exporter.dart';
import 'package:admin/ui/widgets/data_table/datatable_type.dart';
import 'package:admin/ui/widgets/data_table/normal_datatable/normal_datatable.dart';

class CustomDataTable extends StatelessWidget {
  final DatatableType type;
  final int rowsPerPage;
  final Function(int) onRowsPerPageChanged;
  final Function() onFinish;
  final List<Map<String, dynamic>> data;
  final List<SearchColumn> columns;
  final Function(Map<String, dynamic>) onPressed;

  const CustomDataTable({
    Key? key,
    required this.type,
    required this.rowsPerPage,
    required this.onRowsPerPageChanged,
    required this.onFinish,
    required this.data,
    required this.columns,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case DatatableType.paginated:
        return NormalDataTable(
          rowsPerPage: rowsPerPage,
          onRowsPerPageChanged: onRowsPerPageChanged,
          onFinish: onFinish,
          data: data,
          columns: columns,
          onPressed: onPressed,
        );
      default:
        return Container();
    }
  }
}
