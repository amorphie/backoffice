// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:admin/data/models/workflow/altmodels/transitions.dart';
import 'package:admin/data/models/workflow/workflow_model.dart';
import 'package:admin/ui/components/formio/transition_widget.dart';
import 'package:admin/ui/controllers/workflow_controller.dart';
import 'package:admin/ui/style/colors.dart';

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
  WorkflowController get workflowController => Get.find<WorkflowController>(tag: widget.id);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return workflowArea(workflowController.workflow);
    });
  }

  Widget workflowArea(WorkflowModel workflow) {
    return Container(
      color: KC.primary,
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          workflowRow(workflow.stateManager.title! + " : ", workflow.stateManager.transitions!),
          ...workflow.availableWorkflows!.map((e) => workflowRow(e.title! + " : ", e.transitions!)).toList()
        ],
      ),
    );
  }

  Widget workflowRow(String title, List<TransitionsModel> transitions) {
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
                    onTap: () {
                      _showDetailFormio(e);
                    },
                    child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: Text(e.title ?? e.name!, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: KC.primary))),
                  ))
              .toList()
        ],
      ),
    );
  }

  Future<void> _showDetailFormio(TransitionsModel data) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: AlertDialog(
              actionsPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              title: Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.title ?? "",
                      style: TextStyle(color: KC.primary, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          //TODO  entityController.getDataList(); getById Eklenecek
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: KC.primary,
                        ))
                  ],
                ),
              ),
              content: Obx(() {
                WorkflowController controller = Get.find<WorkflowController>(tag: widget.id);
                return TransitionWidget(
                  data: data,
                  loading: controller.loading,
                  getData: (val) async {
                    await workflowController.postTransition(transition: data, entityData: val);
                    Navigator.pop(context);
                  },
                );
              })),
        );
      },
    );
  }
}
