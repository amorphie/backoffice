import 'package:admin/core/export/_.dart';
import 'package:admin/ui/screens/domain/domain_screen.dart';
import 'package:get/get.dart';

class DomainPage extends StatefulWidget {
  const DomainPage({Key? key}) : super(key: key);

  @override
  State<DomainPage> createState() => _DomainPageState();
}

class _DomainPageState extends State<DomainPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      init: (c) async {
        await c.privilege.getPrivileges();
      },
      builder: (context, c) => Obx(() {
        return DomainScreen(
            model: c.domain.domainModel,
            list: c.domain.domainList,
            selectModel: (a) {});
      }),
    );
  }
}
