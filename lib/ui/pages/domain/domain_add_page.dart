import 'package:admin/core/export/_.dart';
import 'package:admin/ui/screens/domain/domain_add_screen.dart';
import 'package:admin/ui/screens/privilege/privilege_add_screen.dart';
import 'package:admin/ui/screens/resource/resource_add_screen.dart';
import 'package:get/get.dart';

class DomainAddPage extends StatefulWidget {
  const DomainAddPage({Key? key}) : super(key: key);

  @override
  State<DomainAddPage> createState() => _DomainAddPageState();
}

class _DomainAddPageState extends State<DomainAddPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      init: (c) async {
        await c.domain.getDomains();
      },
      builder: (context, c) => Obx(() {
        return DomainAddScreen(
            model: c.domain.domainModel,
            addPressed: (model) async {
              bool result = await c.domain.addDomain(model);
              if (result) {
                c.domain.getDomains();
                Get.snackbar("Başarılı", "Başardık",
                    backgroundColor: Colors.green);
                Navigator.pop(context);
              } else {
                Get.snackbar("Sıkıntı", "Başaramadı",
                    backgroundColor: Colors.red);
              }
            },
            tagList: c.tag.tagList);
      }),
    );
  }
}
