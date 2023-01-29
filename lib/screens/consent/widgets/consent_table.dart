import 'package:admin/core/models/consent.dart';
import 'package:admin/core/models/user.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../style/paddings.dart';

class ConsentTable extends StatelessWidget {
  const ConsentTable({
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
          Text("Consents",
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
                  label: Text("Bank",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                  label: Text("File",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                  label: Text("Date",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                  label: Text("Status",
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
                consents.length,
                (index) => recentFileDataRow(consents[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(ConsentModel model) {
  return DataRow(
    cells: [
      DataCell(
        Text(model.bankName,
            textAlign: TextAlign.start,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w400)),
      ),
      DataCell(Text(model.file,
          style:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
      DataCell(Text(model.date,
          style:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
      DataCell(model.edit),
      DataCell(Icon(
        model.status,
        color: Colors.black54,
      ))
    ],
  );
}
