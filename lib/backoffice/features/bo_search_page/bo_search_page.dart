import 'bloc/neo_search_page_state.dart';
import 'network/neo_search_network_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/neo_search_page_bloc.dart';
import 'bloc/neo_search_page_event.dart';

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
    return BlocProvider(
        create: (ctx) => NeoSearchPageViewBloc(networkManager: NeoSearchNetworkManager(), workflowName: workflow)..add(const NeoSearchPageListViewEventFetchItemList()),
        child: BlocBuilder<NeoSearchPageViewBloc, NeoSearchPageState>(
          builder: (context, state) {
            return StreamBuilder<List>(
                stream: context.read<NeoSearchPageViewBloc>().itemListStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return _buildWidget(snapshot.data);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                });
          },
        ));
  }

  Widget _buildWidget(data) => Scaffold(
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
            Expanded(child: Text(data.toString()))
          ],
        ),
      );
}
