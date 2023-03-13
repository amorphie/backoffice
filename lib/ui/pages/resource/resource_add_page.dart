import 'package:admin/core/export/_.dart';
import 'package:admin/ui/screens/resource/resource_add_screen.dart';
import 'package:get/get.dart';

class ResourceAddPage extends StatefulWidget {
  const ResourceAddPage({Key? key}) : super(key: key);

  @override
  State<ResourceAddPage> createState() => _ResourceAddPageState();
}

class _ResourceAddPageState extends State<ResourceAddPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      init: (c) async {
        await c.resource.getAllResources();
      },
      builder: (context, c) => Obx(() {
        return ResourceAddScreen(
            model: c.resource.resource,
            addPressed: (model) async {
              bool result = await c.resource.addResource(model);
              if (result) {
                setState(() {
                  c.resource.getAllResources();
                });
                Get.snackbar("Başarılı", "Başardık",
                    backgroundColor: Colors.green);
              } else {
                Get.snackbar("Sıkıntı", "Başaramadı",
                    backgroundColor: Colors.red);
              }
            },
            list: c.resource.resourceList);
      }),
    );
  }
}
