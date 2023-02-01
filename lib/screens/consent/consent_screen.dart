import 'package:admin/core/utils/responsive.dart';
import 'package:admin/screens/consent/widgets/consent_table.dart';
import 'package:flutter/material.dart';

import '../../style/paddings.dart';
import '../dashboard/widgets/header.dart';
import '../dashboard/tabs/controller_screen.dart';

class ConsentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      ConsentTable(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      // if (Responsive.isMobile(context)) StarageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: WorkflowScreen(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
