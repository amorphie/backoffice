import 'package:admin/core/export/_.dart';
import 'package:admin/ui/pages/resource/resource_add_page.dart';
import 'package:admin/ui/screens/resource/resource_edit_screen.dart';
import 'package:get/get.dart';

import '../../screens/resource/resource_screen.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      init: (c) async {
        await c.resource.getAllResources();
      },
      builder: (context, c) => Obx(() {
        return ResourceScreen(
          model: c.resource.resource,
          list: c.resource.resourceList,
          addPressed: () {
            addItemPopUp(context, child: ResourceAddPage());
          },
          selectModel: (model) {
            c.resource.resource = model;
            editPopUp(context,
                child: ResourceEditScreen(
                  model: model,
                  editPressed: (r) async {
                    bool result = await c.resource.editResource(r.id!, r);
                    if (result) {
                      await c.resource.getAllResources();
                      setState(() {});
                      Get.snackbar("Başarılı", "Başardık",
                          backgroundColor: Colors.green);
                    } else {
                      Get.snackbar("Sıkıntı", "Başaramadı",
                          backgroundColor: Colors.red);
                    }
                  },
                ));
          },
          onSearch: (value) {
            c.resource.getResourceById(value);
          },
        );
      }),
    );
  }
}
