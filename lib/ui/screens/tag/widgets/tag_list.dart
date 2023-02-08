import 'package:data_table_2/data_table_2.dart';
import '../../../../core/export/_.dart';

class TagList extends StatelessWidget {
  const TagList({
    Key? key,
  }) : super(key: key);

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
          Text("Tags",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              dataRowColor: MaterialStateProperty.all(Colors.white),
              dividerThickness: 2,

              // headingRowColor: MaterialStateProperty.all(Colors.blueGrey),
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Ad",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                  label: Text("Soyad",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                // DataColumn(
                //   label: Text("Durum",
                //       style: TextStyle(
                //           color: Colors.black54, fontWeight: FontWeight.w500)),
                // ),
                DataColumn(
                  label: Text("Tags",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                  label: Text("Edit",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
              ],

              rows: List.generate(
                tagsMockList.length,
                (index) => recentFileDataRow(tagsMockList[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(TagModel model) {
  return DataRow(
    cells: [
      DataCell(Text(model.firstName,
          style:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
      DataCell(Text(model.lastName,
          style:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
      // DataCell(fileInfo.durum),
      DataCell(Text(model.tags,
          style:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
      DataCell(Icon(
        model.edit,
        color: Colors.black54,
      ))
    ],
  );
}
