import 'package:admin/core/export/_.dart';
import 'package:admin/ui/screens/resource/resource_edit_screen.dart';
import 'package:get/get.dart';

class ResourceEditPage extends StatefulWidget {
  const ResourceEditPage({Key? key}) : super(key: key);

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
          model: c.resource.resource,
          editPressed: (model) async {
            bool result = await c.resource.addResource(model);
            if (result) {
              c.resource.getAllResources();
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
