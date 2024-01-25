import 'package:flutter/material.dart';

class BackofficeSearchPage extends StatelessWidget {
  final String workflow;
  final dynamic config;
  const BackofficeSearchPage({
    required this.workflow,
    required this.config,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 250,
            child: Column(
              children: [
                Text(workflow),
                Text(config),
              ],
            ),
          ),
          Expanded(child: Text("data"))
        ],
      ),
    );
  }
}
