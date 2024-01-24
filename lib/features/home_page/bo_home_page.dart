import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../backoffice_widgets/neo_bo_menu/neo_bo_navigation_group_widget.dart';
import '../../core/navigation/models/neo_navigation_group_config.dart';

class BackofficeHomePage extends StatelessWidget {
  BackofficeHomePage({super.key});

  var a = GetIt.I<NeoNavigationGroupConfig>().groupList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 200,
            child: Column(
              children: [
                ...a
                    .map((e) => NeoBackofficeNavigationGroupWidget(
                          navigationGroupKey: e.key,
                          titleText: "sadasd",
                        ))
                    .toList(),
              ],
            ),
          ),
          Expanded(child: Text("data"))
        ],
      ),
    );
  }
}
