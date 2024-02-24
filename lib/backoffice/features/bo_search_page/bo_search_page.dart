import 'dart:convert';

import 'package:backoffice/backoffice/features/bo_detail_page/bo_detail_page.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';

import '../../../core/dependency_injection/dependency_injection.dart';
import '../../../core/navigation/neo_navigation_helper.dart';
import '../../core/neo_bo_page_id.dart';
import '../../models/config/neo_navigation_config_model.dart';
import '../../widgets/neo_bo_search_datatable/neo_bo_search_datatable.dart';
import '../../widgets/neo_bo_searchbar/neo_bo_searchbar.dart';
import '../bo_detail_page/bloc/bo_detail_page_bloc.dart';
import '../bo_detail_page/bloc/bo_detail_page_event.dart';
import '../bo_detail_page/network/neo_detail_network_manager.dart';
import 'bloc/neo_search_page_state.dart';
import 'network/neo_search_network_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/neo_search_page_bloc.dart';
import 'bloc/neo_search_page_event.dart';

class _Constants {
  static const String dataKey = "key";
  static const String dataValue = "value";
  static const String data = "recordId";
}

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
    return BlocProvider<NeoSearchPageViewBloc>(
        create: (ctx) => NeoSearchPageViewBloc(networkManager: NeoSearchNetworkManager(), workflowName: workflow)..add(const NeoSearchPageListViewEventFetchItemList()),
        child: BlocBuilder<NeoSearchPageViewBloc, NeoSearchPageState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case NeoSearchPageListViewStateLoaded:
                return _buildWidget(context, (state as NeoSearchPageListViewStateLoaded).itemList);
              case NeoSearchPageListViewStateLoading:
                return const Center(child: CircularProgressIndicator());
              case NeoSearchPageListViewStateError:
                return const Center(child: Text("Error"));
              default:
                return Center(child: Container());
            }
          },
        ));
  }

  Widget _buildWidget(BuildContext context, data) {
    return Scaffold(
      body: Column(
        children: [
          NeoBoSearchbar(
            workflow: workflow,
            config: config,
          ).paddingAll(NeoDimens.px12),
          Expanded(
            child: NeoSearchDataTable(
              data: data,
              navigationConfig: config,
              sortAscending: true,
              sortableColumns: const [],
              isSelected: false,
              onSelect: (item) async {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => BoDetailPage(data: item)));
                // _handleNavigation(context,
                //     navigationPath: NeoBoPageId.boDetail.formatWithQueryParams({
                //       "data": json.encode({_Constants.dataKey: _Constants.data, _Constants.dataValue: item[_Constants.data]}),
                //     }));
              },
            ),
          ),
        ],
      ),
    );
  }

  _handleNavigation(BuildContext context, {required String navigationPath}) {
    getIt.get<NeoNavigationHelper>().navigate(
          navigationType: NeoNavigationType.push,
          navigationPath: navigationPath,
        );
  }
}
