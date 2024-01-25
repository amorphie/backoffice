import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../backoffice_widgets/neo_bo_menu/neo_bo_navigation_group_widget.dart';
import '../../core/navigation/models/neo_navigation_group_config.dart';

class BackofficeHomePage extends StatelessWidget {
  const BackofficeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 250,
            child: Column(
              children: [
                ...GetIt.I<NeoNavigationGroupConfig>()
                    .groupList
                    .map((e) => NeoBackofficeNavigationGroupWidget(
                          navigationGroupKey: e.key,
                          titleText: e.key,
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
