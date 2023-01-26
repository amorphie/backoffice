import 'package:admin/core/utils/responsive.dart';
import 'package:admin/screens/home/widgets/header.dart';
import 'package:admin/screens/widgets/common_button.dart';
import 'package:admin/style/colors.dart';
import 'package:flutter/material.dart';

import '../../style/paddings.dart';
import '../home/widgets/user_table.dart';

class UserHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: CommonButton(
                      title: "Add User", onPressed: () {}, color: KC.primary)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        SizedBox(height: defaultPadding),
                        UserList(),
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
