import 'dart:js';

import 'package:data_table_2/data_table_2.dart';

import '../../../core/export/_exporter.dart';

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
                  label: Text("ID",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                  label: Text("Name",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                  label: Text("Surname",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
                DataColumn(
                  label: Text("Case",
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
                (index) => recentFileDataRow(context, users[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(BuildContext context, UserModel fileInfo) {
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
      DataCell(
        HoverWidget(
          onHover: (a) {},
          hoverChild: GestureDetector(
            onTap: (() {
              _tagPopUp(context);
            }),
            child: GestureDetector(
                child: Text(fileInfo.tags,
                    style: TextStyle(
                        color: KC.primary, fontWeight: FontWeight.w400))),
          ),
          child: GestureDetector(
              child: Text(fileInfo.tags,
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w400))),
        ),
      ),
    ],
  );
}

Future<void> _tagPopUp(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit User', style: TextStyle(color: Colors.black)),
        content: const Text(
            'Ozan Deniz Demirtaş\n'
            'retail-customer, bank-staff\n',
            style: TextStyle(color: Colors.black87, fontSize: 13)),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Save',
                style: TextStyle(color: KC.secondary, fontSize: 13)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Close',
                style: TextStyle(color: Colors.redAccent, fontSize: 13)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
