import 'exporter.dart';

Future<void> formioDialog(BuildContext context, [String? entity, String? recordId, String? stateManager, String? transition]) async {
  WorkflowController controller = Get.put<WorkflowController>(WorkflowController());
  final EntityController entityController = Get.find<EntityController>();

  await controller.startTransition(
    entity: entity ?? entityController.entity.workflow.entity,
    recordId: recordId,
    stateManager: stateManager,
    transition: transition,
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
                    controller.selectedStateManager?.title ?? "",
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
            content: TransitionPage(),
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
