import 'package:admin/core/controllers/app_controller.dart';
import 'package:get/get.dart';

import '../export/_.dart';

class BaseView extends StatefulWidget {
  final Widget Function(BuildContext context, AppController c) builder;
  final Future Function(AppController c)? init;
  final Function(AppController c)? initSync;
  const BaseView({
    Key? key,
    required this.builder,
    this.initSync,
    this.init,
  }) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  AppController controller = Get.find<AppController>();
  late bool init;
  @override
  void initState() {
    super.initState();
    init = false;
    if (widget.initSync != null) widget.initSync!(controller);
    _future();
  }

  Future _future() async {
    init = false;

    if (widget.init != null) {
      await widget.init!(controller);
    } else {
      await Future.delayed(Duration());
    }
    init = true;
    Future.microtask(
      () {
        if (mounted) setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(children: [
        widget.builder(context, controller),
        if (!init)
          Center(
            child: CircularProgressIndicator(),
          ),
      ]),
    );
  }
}
