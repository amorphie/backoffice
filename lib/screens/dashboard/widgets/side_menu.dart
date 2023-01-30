// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../core/export/_exporter.dart';

class SideMenu extends StatelessWidget {
  final Function(int) setIndex;
  const SideMenu({
    Key? key,
    required this.setIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // DrawerHeader(
          //   child: Image.asset("assets/images/logo.png"),
          // ),
          SizedBox(height: 120),
          DrawerListTile(
            icon: Icons.transform_outlined,
            title: "Home",
            press: () {
              setIndex(0);
            },
          ),
          ExpansionTile(
            initiallyExpanded: false,
            textColor: Colors.white54,
            iconColor: Colors.white,
            title: Row(
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text("Users"),
              ],
            ),
            children: <Widget>[
              hoverTile('Create', () {
                setIndex(1);
              }),
              hoverTile('History', () {
                setIndex(2);
              }),
            ],
          ),
          ExpansionTile(
            textColor: Colors.white54,
            iconColor: Colors.white,
            initiallyExpanded: false,
            title: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text("Consent"),
              ],
            ),
            children: <Widget>[
              hoverTile('Consents', () {
                setIndex(3);
              }),
              hoverTile('History', () {}),
            ],
          ),
          DrawerListTile(
            icon: Icons.transform_outlined,
            title: "Client",
            press: () {
              setIndex(2);
            },
          ),
          DrawerListTile(
            icon: Icons.task,
            title: "Scope",
            press: () {
              setIndex(3);
            },
          ),

          ExpansionTile(
            textColor: Colors.white54,
            iconColor: Colors.white,
            initiallyExpanded: false,
            title: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text("Resources"),
              ],
            ),
            children: <Widget>[
              hoverTile('Resources', () {}),
              hoverTile('Role Group', () {}),
              hoverTile('Roles', () {}),
              hoverTile('Privilages', () {}),
            ],
          ),

          DrawerListTile(
            icon: Icons.edit,
            title: "Tag",
            press: () {
              setIndex(4);
            },
          ),
          SizedBox(height: 50),
          DrawerListTile(
            icon: Icons.exit_to_app,
            title: "Exit",
            press: () {},
          ),
        ],
      ),
    );
  }

  HoverWidget hoverTile(String title, Function onPress) {
    return HoverWidget(
      onHover: (a) {},
      hoverChild: GestureDetector(
        onTap: (() {
          onPress();
        }),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: KC.primary),
          ),
        ),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: Colors.white,
        size: 23,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
