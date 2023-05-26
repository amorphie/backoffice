import 'package:flutter/material.dart';

import '../style/colors.dart';

class UserEditPage extends StatefulWidget {
  const UserEditPage({super.key});

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> with TickerProviderStateMixin {
  List<String> list = <String>['Active', 'Deactive', 'Suspended', 'Pending'];
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              workflowWidgets(dropdownValue, "State"),
              workflowWidgets(dropdownValue, "Available Workflows"),
              workflowWidgets(dropdownValue, "Reset Password"),
            ],
          )),
        ],
      ),
    ));
  }

  Row workflowWidgets(String dropdownValue, String title) {
    return Row(
      children: [
        Text(
          "$title : ",
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black87, fontSize: 15),
        ),
        SizedBox(
          width: 10,
        ),
        DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward),
          elevation: 1,
          style: TextStyle(color: Colors.black87),
          underline: Container(
            height: 2,
            color: KC.primary,
          ),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }
}
