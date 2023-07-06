import 'package:admin/ui/components/formio/transition_widget.dart';
import 'package:admin/ui/controllers/workflow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/workflow/altmodels/transitions.dart';
import '../../style/colors.dart';
import '../custom_button.dart';

class FormioPage extends StatefulWidget {
  const FormioPage({
    Key? key,
  }) : super(key: key);

  @override
  _FormioPageState createState() => _FormioPageState();
}

class _FormioPageState extends State<FormioPage> {
  WorkflowController controller = Get.find<WorkflowController>();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<TransitionsModel> transitions = controller.workflow.stateManager.transitions!;
      bool loading = controller.loading;
      return Container(
        padding: const EdgeInsets.all(10.0),
        height: transitions.length > 1 ? 200 : null,
        child: Builder(builder: (context) {
          if (transitions.length == 1) {
            return TransitionWidget(
              data: transitions.first,
              getData: (data) async {
                controller.postTransition(transition: transitions.first, entityData: data);
              },
              loading: loading,
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ...transitions
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          title: e.title!,
                          tooltip: e.name,
                          onPressed: () async {
                            formioDialog(context, e);
                          },
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          );
        }),
      );
    });
  }

  Future<void> formioDialog(BuildContext context, TransitionsModel transition) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transition.title ?? "",
                  style: TextStyle(color: KC.primary, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      color: KC.primary,
                    ))
              ],
            ),
          ),
          content: Obx(() {
            return TransitionWidget(
              data: transition,
              isBack: true,
              loading: controller.loading,
              getData: (val) async {
                await controller.postTransition(transition: transition, entityData: val);
                Navigator.pop(context);
              },
            );
          }),
        );
      },
    );
  }
}
