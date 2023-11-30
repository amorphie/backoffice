import '../../../helpers/exporter.dart';

class TransitionPage extends StatefulWidget {
  const TransitionPage({
    Key? key,
  }) : super(key: key);

  @override
  _TransitionPageState createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage> {
  WorkflowController controller = Get.find<WorkflowController>();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      StateManager stateManager = controller.selectedStateManager!;
      List<TransitionModel> transitions = stateManager.transitions!;
      bool loading = controller.loading;
      return Container(
        padding: const EdgeInsets.all(10.0),
        height: !stateManager.isPublicForm && transitions.length > 1 ? 200 : null,
        child: Builder(builder: (context) {
          if (stateManager.isPublicForm) {
            return MultiTransitionWidget(
                data: stateManager,
                getData: (val, transition) {
                  controller.postTransition(transition: transitions.first, entityData: val);
                  Navigator.pop(context);
                },
                loading: loading);
          } else if (controller.selectedTransition != null) {
            return TransitionWidget(
              data: controller.selectedTransition!,
              getData: (data) async {
                controller.postTransition(transition: controller.selectedTransition!, entityData: data);
                Navigator.pop(context);
              },
              loading: loading,
            );
          } else if (transitions.length == 1) {
            return TransitionWidget(
              data: transitions.first,
              getData: (data) async {
                controller.postTransition(transition: transitions.first, entityData: data);
                Navigator.pop(context);
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
                          title: e.title,
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

  Future<void> formioDialog(BuildContext context, TransitionModel transition) async {
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
                  transition.title,
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
                Navigator.pop(context);
              },
            );
          }),
        );
      },
    );
  }
}
