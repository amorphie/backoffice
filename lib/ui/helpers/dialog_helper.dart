import 'package:admin/ui/widgets/workflow_instance/instance_transition_view.dart';

import 'exporter.dart';

Future<void> instanceDialog(BuildContext context, {String? recordId, String? workflow, String? transition}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return InstanceTransitionView(id: recordId);
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
