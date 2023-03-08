import 'package:admin/core/export/_.dart';
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
          selectModel: (model) {},
          onSearch: (value) {
            c.resource.getResourceById(value);
          },
        );
      }),
    );
  }
}
