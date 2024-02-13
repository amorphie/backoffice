import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../core/navigation/models/neo_navigation_group_config.dart';
import '../../widgets/neo_bo_menu/neo_bo_navigation_group_widget.dart';

class BackofficeHomePage extends StatelessWidget {
  const BackofficeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
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
          const Spacer(),
        ],
      ),
    );
  }
}
