// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:admin/core/export/_.dart';

class UserAddScreen extends StatefulWidget {
  final UserModel model;
  const UserAddScreen({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  State<UserAddScreen> createState() => _UserAddScreenState();
}

class Tags {
  final int id;
  final String name;

  Tags({
    required this.id,
    required this.name,
  });
}

class _UserAddScreenState extends State<UserAddScreen> {
  static List<Tags?> _tags = [
    Tags(id: 1, name: "bank-staff"),
    Tags(id: 2, name: "potential-customer"),
    Tags(id: 3, name: "retail-customer"),
    Tags(id: 4, name: "corporate-customer"),
    Tags(id: 5, name: "loan-partner"),
  ];
  final _items =
      _tags.map((tag) => MultiSelectItem<Tags>(tag!, tag.name)).toList();

  List<Object?> selectedtags = [];
  List<String> status = <String>['New', 'InProgress', 'Ready', 'Active'];
  // bool durum = true;
  @override
  Widget build(BuildContext context) {
    String statusValue = status.first;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 25),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Add User",
              style: TextStyle(
                  color: KC.primary, fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ),
        Divider(
          color: KC.primary,
          height: 30,
        ),
        SizedBox(height: defaultPadding),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: CommonTextField(
            labelText: "Reference",
          ),
        ),
        SizedBox(height: 30),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            children: [
              Expanded(child: CommonTextField(labelText: "Name")),
              SizedBox(width: 10),
              Expanded(child: CommonTextField(labelText: "Surname"))
            ],
          ),
        ),
        SizedBox(height: 30),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            children: [
              Expanded(child: CommonTextField(labelText: "Phone")),
              SizedBox(width: 10),
              Expanded(child: CommonTextField(labelText: "E-mail"))
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          width: MediaQuery.of(context).size.width / 2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: MultiSelectChipField(
                textStyle: TextStyle(color: Colors.black),
                chipColor: Colors.white,
                items: _items,
                initialValue: [_tags[0], _tags[1]],
                title: Text("Tags"),
                headerColor: KC.primary,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: KC.primary, width: 0.6),
                ),
                selectedChipColor: KC.primary,
                selectedTextStyle: TextStyle(color: Colors.white),
                onTap: (values) {
                  selectedtags = values;
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "User Statu",
            style: TextStyle(
                color: KC.primary, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Card(
          color: KC.background,
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
            child: DropdownButton<String>(
              value: statusValue,
              dropdownColor: KC.background,
              icon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.arrow_downward,
                  color: KC.primary,
                ),
              ),
              elevation: 16,
              style: TextStyle(color: KC.primary),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  statusValue = value!;
                });
              },
              items: status.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(height: 70),
        SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: Expanded(
              child: CommonButton(
                  title: "Save", onPressed: () {}, color: KC.primary),
            )),
        SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: Expanded(
              child: CommonButton(
                  title: "Close",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: KC.primary),
            )),
      ],
    );
  }
}
