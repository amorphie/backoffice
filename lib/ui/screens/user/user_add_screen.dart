// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/core/models/common/user_phone_model.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:admin/core/export/_.dart';

class UserAddScreen extends StatefulWidget {
  final UserModel model;
  final Future Function(UserModel model) userAddPressed;
  const UserAddScreen({
    Key? key,
    required this.model,
    required this.userAddPressed,
  }) : super(key: key);
  @override
  State<UserAddScreen> createState() => _UserAddScreenState();
}

class _UserAddScreenState extends State<UserAddScreen> {
  final _items = tagsMockList
      .map((tag) => MultiSelectItem<TagModel>(tag, tag.tagName))
      .toList();

  List<String> selectedtags = [];
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
    phone = TextEditingController(text: widget.model.phone.phoneNumber);
    eMail = TextEditingController(text: widget.model.eMail);
  }

  @override
  Widget build(BuildContext context) {
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
          ),
        ),
        SizedBox(height: 30),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            children: [
              Expanded(
                  child: CommonTextField(
                labelText: "First Name",
                keyboardType: TextInputType.name,
                controller: firstName,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp("[a-zA-Z]", unicode: true)),
                ],
              )),
              SizedBox(width: 10),
              Expanded(
                  child: CommonTextField(
                labelText: "Surname",
                controller: lastName,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp("[a-zA-Z]", unicode: true)),
                ],
                keyboardType: TextInputType.name,
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
                controller: phone,
                keyboardType: TextInputType.phone,
              )),
              SizedBox(width: 10),
              Expanded(
                  child: CommonTextField(
                labelText: "E-mail",
                controller: eMail,
                keyboardType: TextInputType.emailAddress,
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
                title: Text(
                  "Tags",
                  style: TextStyle(color: Colors.white),
                ),
                headerColor: KC.primary,
                initialValue: [_items[1]],
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: KC.primary, width: 0.6),
                ),
                selectedChipColor: KC.primary,
                selectedTextStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Expanded(
                    child: CommonButton(
                        title: "Save",
                        onPressed: () async {
                          UserModel user = UserModel(
                              firstName: firstName.text,
                              lastName: lastName.text,
                              reference: ref.text,
                              password: 'password',
                              phone: PhoneModel.init(),
                              eMail: eMail.text,
                              state: 'state',
                              tags: ['user-list-get']);
                          await widget.userAddPressed(user);
                        },
                        color: KC.primary),
                  )),
            ),
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
