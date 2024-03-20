import '../../helpers/exporter.dart';
import 'menu_item.dart';

class AppMenu extends StatelessWidget {
  AppMenu({super.key});
  final AppUiController c = Get.find<AppUiController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      backgroundColor: KC.primary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 30,
                    child: Image.asset(
                      "assets/icons/burganlogo.png",
                    )),
                Icon(
                  Icons.language_outlined,
                  color: KC.secondary,
                ),
                //  Text(
                //    "English",
                //    style: TextStyle(color: Colors.deepOrangeAccent),
                //  )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ...c.menu.value.items.map((e) => MenuItem(model: e)).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
