import 'package:admin/core/export/_.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TagPage extends StatefulWidget {
  const TagPage({Key? key}) : super(key: key);

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        init: (c) async {
          await c.tag.getTags();
        },
        builder: (context, c) => Obx(
              () => TagScreen(
                tag: c.tag.tagModel,
                tagList: c.tag.tagList.value,
              ),
            ));
  }
}
