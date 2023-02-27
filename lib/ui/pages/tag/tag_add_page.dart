import 'package:admin/core/export/_.dart';
import 'package:admin/ui/screens/tag/tag_add_screen.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TagAddPage extends StatefulWidget {
  const TagAddPage({Key? key}) : super(key: key);

  @override
  State<TagAddPage> createState() => _TagAddPageState();
}

class _TagAddPageState extends State<TagAddPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        init: (c) async {
          await c.tag.getTags();
        },
        builder: (context, c) => Obx(() => TagAddScreen(
            model: c.tag.tagModel,
            tagAddPressed: (model) async {
              await c.tag.addTag(model);
            },
            tagList: c.tag.tagList)));
  }
}
