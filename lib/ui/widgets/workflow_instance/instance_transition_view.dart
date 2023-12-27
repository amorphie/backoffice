import 'package:admin/ui/controllers/workflow_instance/workflow_instance_controller.dart';
import 'package:admin/ui/helpers/exporter.dart';
import 'package:admin/ui/widgets/popup_template.dart';
import 'package:admin/ui/widgets/workflow_instance/transition_widget.dart';

import 'instance_multi_forward_view.dart';
import 'state_widget.dart';

class InstanceTransitionView extends StatelessWidget {
  final String? id;
  const InstanceTransitionView({super.key, this.id});
  WorkflowInstanceController get controller => Get.find<WorkflowInstanceController>(tag: id);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PopupTemplate(
        loading: controller.loading,
        child: Builder(builder: (context) {
          switch (controller.model.viewSource) {
            case "transition":
              if (controller.hasMultiForwardTransition) {
                return InstanceMultiForwardTransitionsView(
                    transitions: controller.forwardTransitions,
                    onSelect: (val) {
                      controller.viewTransition(val);
                    });
              } else
                return InstanceTransitionWidget(
                  view: controller.view,
                  back: controller.hasBackTransition ? controller.back : null,
                  data: controller.getDataString,
                  getData: (val) {
                    controller.postData(entityData: val);
                    Navigator.pop(context);
                  },
                  loading: controller.loading,
                );
            case "state":
              return InstanceStateWidget(
                transitions: controller.forwardTransitions,
                view: controller.view,
                back: controller.hasBackTransition ? controller.back : null,
                data: controller.getDataString,
                getData: (transition, val) {
                  controller.postData(entityData: val, transition: transition);
                  Navigator.pop(context);
                },
                loading: controller.loading,
              );
            default:
              return Container();
          }
        }),
        close: () async {
          if (controller.hasCancelTransition) controller.cancel();
          Navigator.pop(context);
        },
      );
    });
  }
}
