import 'package:admin/screens/widgets/common_button.dart';
import 'package:admin/screens/widgets/common_textfield.dart';
import 'package:admin/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/paddings.dart';
import '../home/widgets/header.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<String> list = <String>['Customer', 'Staff', 'Admin', 'User'];
  bool durum = true;
  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              SizedBox(height: defaultPadding),
              SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: CommonTextField(
                  labelText: "T.C.",
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Row(
                  children: [
                    Expanded(child: CommonTextField(labelText: "Ad")),
                    SizedBox(width: 10),
                    Expanded(child: CommonTextField(labelText: "Soyad"))
                  ],
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Row(
                  children: [
                    Expanded(child: CommonTextField(labelText: "Telefon")),
                    SizedBox(width: 10),
                    Expanded(child: CommonTextField(labelText: "E-posta"))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Card(
                    color: KC.background,
                    elevation: 2,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
                      child: DropdownButton<String>(
                        value: dropdownValue,
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
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  CupertinoSwitch(
                    // This bool value toggles the switch.
                    value: durum,
                    thumbColor: KC.primary,
                    trackColor: Colors.grey[400],
                    activeColor: KC.secondary.withOpacity(0.64),
                    onChanged: (bool? value) {
                      // This is called when the user toggles the switch.
                      setState(() {
                        durum = value!;
                      });
                    },
                  ),
                  durum == true
                      ? Text(
                          "Active",
                          style: TextStyle(
                              color: KC.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        )
                      : Text(
                          "Passive",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                ],
              ),
              SizedBox(height: 70),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: CommonButton(
                      title: "Save", onPressed: () {}, color: KC.primary))
            ],
          ),
        ),
      ),
    );
  }
}
