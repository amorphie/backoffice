// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:admin/data/models/workflow/instance/workflow_instance_transition_model.dart';

class InstanceMultiForwardTransitionsView extends StatelessWidget {
  final List<WorkflowInstanceTransitionModel> transitions;
  final Function(WorkflowInstanceTransitionModel) onSelect;
  const InstanceMultiForwardTransitionsView({
    Key? key,
    required this.transitions,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ...transitions
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    title: e.transition,
                    tooltip: e.transition,
                    onPressed: () async {
                      onSelect(e);
                    },
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
