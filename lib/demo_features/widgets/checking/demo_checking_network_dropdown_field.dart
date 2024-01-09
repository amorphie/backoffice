import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/demo_features/widgets/checking/bloc/demo_checking_network_dropdown_field_bloc.dart';
import 'package:backoffice/demo_features/widgets/checking/data/demo_checking_network_dropdown_field_network_manager.dart';
import 'package:backoffice/demo_features/widgets/checking/model/demo_checking_account_models.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class DemoCheckingNetworkDropdownField extends StatefulWidget {
  final String endpoint;
  final String dataKey;
  final String? labelText;

  const DemoCheckingNetworkDropdownField({
    required this.endpoint,
    required this.dataKey,
    this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  State<DemoCheckingNetworkDropdownField> createState() => _DemoCheckingNetworkDropdownFieldState();
}

class _DemoCheckingNetworkDropdownFieldState extends State<DemoCheckingNetworkDropdownField> {
  _DemoCheckingNetworkDropdownFieldState();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DemoCheckingNetworkDropdownFieldBloc(networkManager: DemoCheckingNetworkDropdownFieldNetworkManager())..add(DemoCheckingNetworkDropdownFieldEventInitialGet(widget.endpoint)),
      child: BlocBuilder<DemoCheckingNetworkDropdownFieldBloc, DemoCheckingNetworkDropdownFieldState>(
        builder: (context, state) {
          return StreamBuilder<List<DemoChecking>>(
            stream: context.read<DemoCheckingNetworkDropdownFieldBloc>().demoMap,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CupertinoActivityIndicator());
              }

              final itemMap = snapshot.data!;
              return DropdownButtonFormField<String>(
                items: itemMap.mapIndexed((index, e) {
                  return DropdownMenuItem<String>(value: index.toString(), child: Text(e.name ?? ""));
                }).toList(),
                onChanged: (String? text) {
                  debugPrint("Selected Value $text");
                  context.read<WorkflowFormBloc>().add(
                        WorkflowFormEventUpdateTextFormField(
                          key: widget.dataKey,
                          value: itemMap[int.parse(text!)].iban.orEmpty,
                        ),
                      );
                  context.read<WorkflowFormBloc>().add(
                        WorkflowFormEventUpdateTextFormField(
                          key: "targetIBAN",
                          value: itemMap[int.parse(text)].iban.orEmpty,
                        ),
                      );
                  context.read<WorkflowFormBloc>().add(
                        WorkflowFormEventUpdateTextFormField(
                          key: "branchCode",
                          value: itemMap[int.parse(text)].branch?.code ?? "",
                        ),
                      );
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
