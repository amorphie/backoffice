import 'package:admin/ui/controllers/workflow_instance/workflow_instance_controller.dart';
import 'package:admin/ui/helpers/exporter.dart';
import 'package:admin/ui/widgets/popup_template.dart';
import 'package:admin/ui/widgets/workflow_instance/transition_widget.dart';

class InstanceTransitionView extends StatelessWidget {
  final String? id;
  const InstanceTransitionView({super.key, this.id});
  WorkflowInstanceController get controller => Get.find<WorkflowInstanceController>(tag: id);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PopupTemplate(
        loading: controller.loading,
        child: InstanceTransitionWidget(
          view: controller.view,
          back: controller.hasBackTransition ? controller.back : null,
          getData: (val) {
            controller.postData(entityData: val);
            Navigator.pop(context);
          },
          loading: controller.loading,
        ),
        close: () async {
          if (controller.hasCancelTransition) controller.cancel();
          Navigator.pop(context);
        },
      );
    });
  }
}
