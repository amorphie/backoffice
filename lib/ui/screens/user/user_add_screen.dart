// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:admin/core/export/_.dart';

class UserAddScreen extends StatefulWidget {
  final UserModel model;
  final Future Function(String ref, String firstName, String? lastName,
      String? phone, String eMail) userAddPressed;
  const UserAddScreen({
    Key? key,
    required this.model,
    required this.userAddPressed,
  }) : super(key: key);
  @override
  State<UserAddScreen> createState() => _UserAddScreenState();
}

class _UserAddScreenState extends State<UserAddScreen> {
  static List<TagsPageModel?> _tags = [
    TagsPageModel(id: 1, name: "bank-staff"),
    TagsPageModel(id: 2, name: "potential-customer"),
    TagsPageModel(id: 3, name: "retail-customer"),
    TagsPageModel(id: 4, name: "corporate-customer"),
    TagsPageModel(id: 5, name: "loan-partner"),
  ];
  final _items = _tags
      .map((tag) => MultiSelectItem<TagsPageModel>(tag!, tag.name))
      .toList();

  List<Object?> selectedtags = [];
  List<String> status = <String>['New', 'InProgress', 'Ready', 'Active'];

  late TextEditingController ref;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController phone;
  late TextEditingController eMail;

  @override
  void initState() {
    super.initState();
    ref = TextEditingController(text: widget.model.reference);
    firstName = TextEditingController(text: widget.model.firstName);
    lastName = TextEditingController(text: widget.model.lastName);
    phone = TextEditingController(text: widget.model.phone);
    eMail = TextEditingController(text: widget.model.eMail);
  }

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
            keyboardType: TextInputType.number,
            controller: ref,
            onChanged: (val) {
              ref.text = val;
            },
          ),
        ),
        SizedBox(height: 30),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            children: [
              Expanded(
                  child: CommonTextField(
                labelText: "Name",
                keyboardType: TextInputType.name,
                controller: firstName,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp("[a-zA-Z]", unicode: true)),
                ],
                onChanged: (val) {
                  setState(() {
                    firstName.text = val;
                  });
                },
              )),
              SizedBox(width: 10),
              Expanded(
                  child: CommonTextField(
                labelText: "Surname",
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp("[a-zA-Z]", unicode: true)),
                ],
                keyboardType: TextInputType.name,
                controller: lastName,
                onChanged: (val) {
                  lastName.text = val;
                },
              ))
            ],
          ),
        ),
        SizedBox(height: 30),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            children: [
              Expanded(
                  child: CommonTextField(
                labelText: "Phone",
                keyboardType: TextInputType.phone,
                controller: phone,
                onChanged: (val) {
                  phone.text = val;
                },
              )),
              SizedBox(width: 10),
              Expanded(
                  child: CommonTextField(
                labelText: "E-mail",
                keyboardType: TextInputType.emailAddress,
                controller: eMail,
                onChanged: (val) {
                  eMail.text = val;
                },
              ))
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: Expanded(
                  child: CommonButton(
                      title: "Save",
                      onPressed: () async {
                        await widget.userAddPressed(ref.text, firstName.text,
                            lastName.text, phone.text, eMail.text);
                      },
                      color: KC.primary),
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: Expanded(
                  child: CommonButton(
                      title: "Close",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: KC.primary),
                )),
          ],
        ),
      ],
    );
  }
}

class TagsPageModel {
  final int id;
  final String name;

  TagsPageModel({
    required this.id,
    required this.name,
  });
}
