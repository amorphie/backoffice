import 'package:admin/core/models/user.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../style/paddings.dart';

class UserList extends StatelessWidget {
  const UserList({
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
          Text("Users",
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
                  label: Text("T.C.",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
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
                DataColumn(
                  label: Text("Durum",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                  label: Text("Tags",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                // DataColumn(
                //   label: Text("İşlem",
                //       textAlign: TextAlign.end,
                //       style: TextStyle(
                //           color: Colors.black54, fontWeight: FontWeight.w500)),
                // ),
              ],

              rows: List.generate(
                users.length,
                (index) => recentFileDataRow(users[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(UserModel fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Text(fileInfo.tc,
            textAlign: TextAlign.start,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w400)),
      ),
      DataCell(Text(fileInfo.isim,
          style:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
      DataCell(Text(fileInfo.soyIsim,
          style:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
      DataCell(fileInfo.durum),
      DataCell(Text(fileInfo.tags,
          style:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))),
      // DataCell(Icon(
      //   fileInfo.islem,
      //   color: Colors.black54,
      // ))
    ],
  );
}
