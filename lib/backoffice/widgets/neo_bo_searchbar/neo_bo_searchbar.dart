// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:backoffice/backoffice/features/bo_search_page/bloc/neo_search_page_event.dart';
import 'package:backoffice/backoffice/widgets/neo_button/neo_bo_button.dart';
import 'package:backoffice/reusable_widgets/neo_button/neo_button.dart';
import 'package:flutter/material.dart';

import 'package:backoffice/backoffice/models/config/neo_navigation_config_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/bo_search_page/bloc/neo_search_page_bloc.dart';
import 'neo_bo_textfield.dart';

class NeoSearchbar extends StatelessWidget {
  final String workflow;
  final NeoNavigationConfigModel config;
  const NeoSearchbar({
    Key? key,
    required this.workflow,
    required this.config,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Expanded(
          child: NeoBoSearchTextfield(
            onSearch: (val) async {
              context.read<NeoSearchPageViewBloc>().add(NeoSearchPageListViewSearchEvent(val));
            },
          ),
        ),
        NeoBoButton(
          labelText: 'Add',
          transitionId: workflow,
          startWorkflow: true,
        )
      ]),
    );
  }
}
