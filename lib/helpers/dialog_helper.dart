import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/widgets/formio/formio_page.dart';
import '../ui/widgets/indicator.dart';
import '../ui/controllers/entity_controller.dart';
import '../ui/controllers/workflow_controller.dart';
import '../ui/style/colors.dart';

Future<void> formioDialog(BuildContext context, [String? entity, String? recordId]) async {
  WorkflowController controller = Get.put<WorkflowController>(WorkflowController());
  final EntityController entityController = Get.find<EntityController>();

  await controller.startTransition(
    entity: entity ?? entityController.entity.workflow,
    recordId: recordId,
  );

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Obx(() {
        if (controller.loading) return AppIndicator();
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
                    controller.workflow.stateManager.title ?? "",
                    style: TextStyle(color: KC.primary, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        entityController.getDataList();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: KC.primary,
                      ))
                ],
              ),
            ),
            content: FormioPage(),
          ),
        );
      });
    },
  );
}
