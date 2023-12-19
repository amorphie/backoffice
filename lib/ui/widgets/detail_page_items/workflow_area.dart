// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/data/models/workflow/instance/workflow_instance_model.dart';
import 'package:admin/data/models/workflow/instance/workflow_instance_transition_model.dart';
import 'package:admin/ui/controllers/workflow_instance/workflow_instance_controller.dart';

import '../../helpers/exporter.dart';

class WorkflowArea extends StatefulWidget {
  final String id;
  const WorkflowArea({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<WorkflowArea> createState() => _WorkflowAreaState();
}

class _WorkflowAreaState extends State<WorkflowArea> {
  WorkflowInstanceController get c => Get.find<WorkflowInstanceController>(tag: widget.id);
  DisplayController get display => Get.find<DisplayController>(tag: widget.id);

  @override
  Widget build(BuildContext context) {
    if (c.model.transition.isEmpty) return Container();
    return Obx(() {
      return workflowArea(c.model);
    });
  }

  Widget workflowArea(WorkflowInstanceModel workflow) {
    return Container(
      color: KC.primary,
      padding: EdgeInsets.only(left: 12, top: 8),
      child: Column(
        children: [
          if (display.entity.workflow.stateManager) workflowRow(c.model.state + " : ", c.model.transition),
        ],
      ),
    );
  }

  Widget workflowRow(String title, List<WorkflowInstanceTransitionModel> transitions) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          ...transitions
              .map((e) => GestureDetector(
                    onTap: () async {
                      await c.viewTransition(e);
                    },
                    child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                        decoration: BoxDecoration(color: KC.secondary, borderRadius: BorderRadius.circular(20)),
                        child: Text(e.transition, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white))),
                  ))
              .toList()
        ],
      ),
    );
  }
}
