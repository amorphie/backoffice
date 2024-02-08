import '../../models/config/neo_navigation_config_model.dart';
import '../../widgets/neo_bo_search_datatable/neo_bo_search_datatable.dart';
import '../../widgets/neo_bo_searchbar/neo_bo_searchbar.dart';
import 'bloc/neo_search_page_state.dart';
import 'network/neo_search_network_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/neo_search_page_bloc.dart';
import 'bloc/neo_search_page_event.dart';

class BackofficeSearchPage extends StatelessWidget {
  final String workflow;
  final NeoNavigationConfigModel config;
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
            return StreamBuilder<List<Map<String, dynamic>>>(
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

  Widget _buildWidget(data) {
    return Scaffold(
      body: Column(
        children: [
          NeoSearchbar(
            workflow: workflow,
            config: config,
          ),
          Expanded(
            child: NeoSearchDataTable(
              data: data,
              navigationConfig: config,
              sortAscending: true,
              columns: [],
              sortableColumns: [],
            ),
          ),
        ],
      ),
    );
  }
}
