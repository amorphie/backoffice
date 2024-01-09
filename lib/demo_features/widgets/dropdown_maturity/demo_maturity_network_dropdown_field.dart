import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/demo_features/widgets/dropdown_maturity/bloc/demo_maturity_dropdown_field_bloc.dart';
import 'package:backoffice/demo_features/widgets/dropdown_maturity/data/dropdown_maturity_field_network_manager.dart';
import 'package:backoffice/demo_features/widgets/dropdown_maturity/model/demo_maturity_models.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class DemoMaturityNetworkDropdownField extends StatefulWidget {
  final String endpoint;
  final String dataKey;
  final String? labelText;

  const DemoMaturityNetworkDropdownField({
    required this.endpoint,
    required this.dataKey,
    this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  State<DemoMaturityNetworkDropdownField> createState() => _DemoMaturityNetworkDropdownFieldState();
}

class _DemoMaturityNetworkDropdownFieldState extends State<DemoMaturityNetworkDropdownField> {
  _DemoMaturityNetworkDropdownFieldState();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DemoMaturityDropdownFieldBloc(networkManager: DropdownMaturityFieldNetworkManager())..add(DemoMaturityNetworkDropdownFieldEventInitialGet(widget.endpoint)),
      child: BlocBuilder<DemoMaturityDropdownFieldBloc, DemoMaturityDropdownFieldState>(
        builder: (context, state) {
          return StreamBuilder<List<DemoMaturity>>(
            stream: context.read<DemoMaturityDropdownFieldBloc>().demoMap,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CupertinoActivityIndicator());
              }

              final itemMap = snapshot.data!;
              return DropdownButtonFormField<String>(
                items: itemMap
                    .mapIndexed(
                      (index, e) => DropdownMenuItem<String>(value: e.maturity, child: Text(e.text ?? "")),
                    )
                    .toList(),
                onChanged: (String? text) {
                  debugPrint("Selected Value $text");
                  context.read<WorkflowFormBloc>().add(WorkflowFormEventUpdateTextFormField(key: widget.dataKey, value: text.orEmpty));
                  context.read<WorkflowFormBloc>().add(const WorkflowFormEventUpdateTextFormField(key: "productCode", value: "VDLMEVD"));
                  context.read<WorkflowFormBloc>().add(const WorkflowFormEventUpdateTextFormField(key: "subProductCode", value: "VDLMINT"));
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
