import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/demo_features/widgets/dropdown_maturity_renewal/bloc/dropdown_maturity_renewal_field_bloc.dart';
import 'package:backoffice/demo_features/widgets/dropdown_maturity_renewal/data/dropdown_maturity_renewal_field_network_manager.dart';
import 'package:backoffice/demo_features/widgets/dropdown_maturity_renewal/model/demo_maturity_renewal_models.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class DemoMaturiytRenewalNetworkDropdownField extends StatefulWidget {
  final String endpoint;
  final String dataKey;
  final String? labelText;

  const DemoMaturiytRenewalNetworkDropdownField({
    required this.endpoint,
    required this.dataKey,
    this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  State<DemoMaturiytRenewalNetworkDropdownField> createState() => _DemoMaturiytRenewalNetworkDropdownFieldState();
}

class _DemoMaturiytRenewalNetworkDropdownFieldState extends State<DemoMaturiytRenewalNetworkDropdownField> {
  _DemoMaturiytRenewalNetworkDropdownFieldState();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DropdownMaturityRenewalFieldBloc(networkManager: DropdownMaturityRenewalFieldNetworkManager())..add(DemoMaturityRenewalNetworkDropdownFieldEventInitialGet(widget.endpoint)),
      child: BlocBuilder<DropdownMaturityRenewalFieldBloc, DropdownMaturityRenewalFieldState>(
        builder: (context, state) {
          return StreamBuilder<List<DemoMaturityRenewal>>(
            stream: context.read<DropdownMaturityRenewalFieldBloc>().demoMap,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CupertinoActivityIndicator());
              }

              final itemMap = snapshot.data!;
              return DropdownButtonFormField<String>(
                items: itemMap
                    .mapIndexed(
                      (index, e) => DropdownMenuItem<String>(value: e.renewal, child: Text(e.text ?? "")),
                    )
                    .toList(),
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
