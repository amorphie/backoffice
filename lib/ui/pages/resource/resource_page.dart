import 'package:admin/core/export/_.dart';
import 'package:admin/core/models/resource.dart';
import 'package:admin/ui/pages/resource/resource_edit_page.dart';
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
          selectModel: (model) {
            c.resource.resource = model;
            print(model.id);
          },
          onSearch: (value) {
            c.resource.getResourceById(value);
          },
        );
      }),
    );
  }
}
