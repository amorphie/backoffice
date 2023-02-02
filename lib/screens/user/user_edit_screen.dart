import 'package:admin/screens/widgets/common_button.dart';
import 'package:admin/screens/widgets/common_textfield.dart';
import 'package:admin/style/colors.dart';
import 'package:flutter/material.dart';

import '../../style/paddings.dart';

class UserEditScreen extends StatefulWidget {
  @override
  State<UserEditScreen> createState() => _UserEditScreenState();
}

class _UserEditScreenState extends State<UserEditScreen> {
  List<String> tags = <String>[
    'bank-staff',
    'potential-customer',
    'retail-customer',
    'corporate-customer',
    'loan-partner'
  ];
  List<String> status = <String>['New', 'Ready', 'Active', 'InProgress'];
  // bool durum = true;
  @override
  Widget build(BuildContext context) {
    String tagsValue = tags.first;
    String statusValue = status.first;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25),
              Text(
                "Edit User",
                style: TextStyle(
                    color: KC.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              SizedBox(height: defaultPadding),
              SizedBox(height: 30),
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    color: KC.background,
                    elevation: 2,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
                      child: DropdownButton<String>(
                        value: tagsValue,
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
                            tagsValue = value!;
                          });
                        },
                        items:
                            tags.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Card(
                    color: KC.background,
                    elevation: 2,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
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
                        items: status
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  // CupertinoSwitch(
                  //   value: durum,
                  //   thumbColor: KC.primary,
                  //   trackColor: Colors.grey[400],
                  //   activeColor: KC.secondary.withOpacity(0.64),
                  //   onChanged: (bool? value) {
                  //     // This is called when the user toggles the switch.
                  //     setState(() {
                  //       durum = value!;
                  //     });
                  //   },
                  // ),
                  // durum == true
                  //     ? Text(
                  //         "Active",
                  //         style: TextStyle(
                  //             color: KC.primary,
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 15),
                  //       )
                  //     : Text(
                  //         "Passive",
                  //         style: TextStyle(
                  //             color: Colors.redAccent,
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 15),
                  //       ),
                ],
              ),
              SizedBox(height: 70),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Expanded(
                    child: CommonButton(
                        title: "Reset Password",
                        onPressed: () {},
                        color: KC.primary),
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Expanded(
                    child: CommonButton(
                        title: "Save", onPressed: () {}, color: KC.primary),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
