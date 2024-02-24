// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:backoffice/backoffice/features/bo_detail_page/bloc/bo_detail_page_bloc.dart';
import 'package:backoffice/backoffice/features/bo_detail_page/bloc/bo_detail_page_event.dart';
import 'package:backoffice/backoffice/features/bo_detail_page/network/neo_detail_network_manager.dart';
import 'package:backoffice/backoffice/widgets/render_widget.dart';

import '../../widgets/test_render_template.dart';
import 'bloc/bo_detail_page_state.dart';

class BoDetailPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const BoDetailPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BoDetailPageBloc>(
      create: (ct) => BoDetailPageBloc(networkManager: NeoDetailNetworkManager(), data: data)..add(const BoDetailPageEventSetItem()),
      child: BlocBuilder<BoDetailPageBloc, BoDetailPageState>(builder: (context, state) {
        switch (state) {
          case BoDetailPageStateViewLoading _:
            return const Center(child: CircularProgressIndicator());
          case BoDetailPageStateViewLoaded _:
            return _buildWidget(context, state.item ?? {});
          case BoDetailPageStateViewError _:
            return const Center(child: Text("Error"));
          default:
            return const Center(child: Text("Verileri yüklerken bir hata oluştu. Lütfen tekrar deneyin."));
        }
      }),
    );
  }

  Widget _buildWidget(BuildContext context, Map<String, dynamic> item) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: RenderWidget(
              template: item["body"].isNotEmpty ? item["body"] : testRenderTemplateData,
            ),
          ),
        ],
      ),
    );
  }
}
