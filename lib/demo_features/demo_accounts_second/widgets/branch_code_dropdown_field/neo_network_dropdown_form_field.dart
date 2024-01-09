import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/demo_features/demo_accounts_second/widgets/branch_code_dropdown_field/bloc/neo_network_dropdown_form_field_bloc.dart';
import 'package:backoffice/demo_features/demo_accounts_second/widgets/branch_code_dropdown_field/network/neo_network_dropdown_form_field_network_manager.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class NeoNetworkDropdownFormField2 extends StatefulWidget {
  final String endpoint;
  final String dataKey;
  final String? labelText;

  const NeoNetworkDropdownFormField2({
    required this.endpoint,
    required this.dataKey,
    this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  State<NeoNetworkDropdownFormField2> createState() => _NeoNetworkDropdownFormField2State();
}

class _NeoNetworkDropdownFormField2State extends State<NeoNetworkDropdownFormField2> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NeoNetworkDropdownFormFieldBloc2(networkManager: NeoNetworkDropdownFormFieldNetworkManager2())..add(NeoNetworkDropdownFormFieldEventFetchItemList2(widget.endpoint)),
      child: BlocBuilder<NeoNetworkDropdownFormFieldBloc2, NeoNetworkDropdownFormFieldState2>(
        builder: (context, state) {
          return StreamBuilder<List<String>>(
            stream: context.read<NeoNetworkDropdownFormFieldBloc2>().itemListStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final itemList = snapshot.data!;
              return DropdownButtonFormField<String>(
                items: itemList.map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
                onChanged: (String? text) {
                  context.read<WorkflowFormBloc>().add(WorkflowFormEventUpdateTextFormField(key: widget.dataKey, value: text.orEmpty));
                },
                icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 24),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: widget.labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ).paddingAll(16);
            },
          );
        },
      ),
    );
  }
}
