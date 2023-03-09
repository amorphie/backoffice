import 'package:admin/core/export/_.dart';

import 'my_data_table_row.dart';

class MyRowSource<T> extends DataTableSource {
  final int count;
  final List<MyDataTableRow<T>> items;
  final BuildContext context;
  //final bool Function(int index)? isSelected;
  //final Function(int index) onSelect;
  final Function(int index) onClick;
  MyRowSource({
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
    required MyDataTableRow<T> model,
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
        ...model.cells.map(
          (e) => DataCell(
            Text(e.text,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w400)),
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
