import 'dart:developer';

import 'package:admin/data/services/services.dart';
import 'package:admin/ui/widgets/formio/formio_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webviewx/webviewx.dart';

import '../data/models/history/history_model.dart';
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
                    controller.workflow.stateManager?.title ?? "",
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

Future<void> showHistoryWidget(BuildContext context, HistoryModel data) async {
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
            content: FormioWidget(
              schema: data.formSchema ?? "",
            )),
      );
    },
  );
}

showTag(String tag) async {
  // var tagResponse = await Services().getTag(tag);
// tagResponse.data["url"]??""
  return showDialog<void>(
    context: Get.context!,
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
          title: Text(tag),
          content: _buildWebViewX(""), //TODO url null control eklenecek
        ),
      );
    },
  );
}

Widget _buildWebViewX(String data) {
  return WebViewX(
    key: const ValueKey('urldata'),
    initialContent: "https://google.com.tr",
    initialSourceType: SourceType.url,
    height: double.maxFinite,
    width: MediaQuery.of(Get.context!).size.width * 0.7,

    // height: screenSize.height / 1.3,
    // width: min(screenSize.width * 0.8, 1024),
    onWebViewCreated: (controller) {},
  );
}
