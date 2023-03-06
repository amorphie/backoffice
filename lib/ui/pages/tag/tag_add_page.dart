import 'package:admin/core/export/_.dart';
import 'package:admin/ui/screens/tag/tag_add_screen.dart';
import 'package:get/get.dart';

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
              bool result = await c.tag.addTag(model);
              if (result) {
                c.tag.getTags();
                Get.snackbar("Başarılı", "Başardık",
                    backgroundColor: Colors.green);
                Navigator.pop(context);
              } else {
                Get.snackbar("Sıkıntı", "Başaramadı",
                    backgroundColor: Colors.red);
              }
            },
            tagList: c.tag.tagList)));
  }
}
