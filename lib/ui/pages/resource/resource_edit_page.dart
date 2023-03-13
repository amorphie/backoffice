// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:admin/core/export/_.dart';
import 'package:admin/core/models/resource.dart';
import 'package:admin/ui/screens/resource/resource_edit_screen.dart';

class ResourceEditPage extends StatefulWidget {
  final ResourceModel model;
  const ResourceEditPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<ResourceEditPage> createState() => _ResourceEditPageState();
}

class _ResourceEditPageState extends State<ResourceEditPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      init: (c) async {
        await c.resource.getAllResources();
      },
      builder: (context, c) => Obx(() {
        return ResourceEditScreen(
          model: widget.model,
          editPressed: (r) async {
            bool result = await c.resource.addResource(r);
            if (result) {
              await c.resource.getAllResources();
              setState(() {});
              Get.snackbar("Başarılı", "Başardık",
                  backgroundColor: Colors.green);
              Navigator.pop(context);
            } else {
              Get.snackbar("Sıkıntı", "Başaramadı",
                  backgroundColor: Colors.red);
            }
          },
        );
      }),
    );
  }
}
