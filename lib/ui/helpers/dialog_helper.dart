import 'package:admin/ui/controllers/workflow_instance/workflow_instance_controller.dart';
import 'package:admin/ui/widgets/workflow_instance/transition_widget.dart';

import 'exporter.dart';

Future<void> instanceDialog(BuildContext context, {String? recordId, String? workflow, String? transition}) async {
  WorkflowInstanceController controller = Get.find<WorkflowInstanceController>();

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
                  SizedBox(),
                  // Text(
                  //   controller.model.?.title ?? "",
                  //   style: TextStyle(color: KC.primary, fontWeight: FontWeight.bold),
                  // ),
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
            content: InstanceTransitionWidget(
              data: controller.view,
              getData: (val) {
                controller.postData(entityData: val);
              },
              loading: controller.loading,
            ),
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
              schema: data.formSchema ?? "{}",
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
          content: WebViewWidget(source: WebViewSource.url("data")), //TODO url null control eklenecek
        ),
      );
    },
  );
}
