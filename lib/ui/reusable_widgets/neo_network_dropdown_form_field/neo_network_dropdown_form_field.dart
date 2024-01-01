import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/ui/reusable_widgets/neo_network_dropdown_form_field/bloc/neo_network_dropdown_form_field_bloc.dart';
import 'package:admin/ui/reusable_widgets/neo_network_dropdown_form_field/network/neo_network_dropdown_form_field_network_manager.dart';
import 'package:admin/core/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class NeoNetworkDropdownFormField extends StatefulWidget {
  final String endpoint;
  final String dataKey;
  final String? labelText;

  const NeoNetworkDropdownFormField({
    required this.endpoint,
    required this.dataKey,
    this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  State<NeoNetworkDropdownFormField> createState() => _NeoNetworkDropdownFormFieldState();
}

class _NeoNetworkDropdownFormFieldState extends State<NeoNetworkDropdownFormField> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoNetworkDropdownFormFieldBloc(networkManager: NeoNetworkDropdownFormFieldNetworkManager())..add(NeoNetworkDropdownFormFieldEventFetchItemList(widget.endpoint)),
      child: BlocBuilder<NeoNetworkDropdownFormFieldBloc, NeoNetworkDropdownFormFieldState>(
        builder: (context, state) {
          return StreamBuilder<List<String>>(
            stream: context.read<NeoNetworkDropdownFormFieldBloc>().itemListStream,
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
