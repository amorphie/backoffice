import 'package:admin/screens/user/user_screen.dart';
import 'package:admin/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
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
            press: () {},
          ),
          DrawerListTile(
            title: "Users",
            icon: Icons.group,
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserScreen()));
            },
          ),
          DrawerListTile(
            icon: Icons.transform_outlined,
            title: "Client",
            press: () {},
          ),
          DrawerListTile(
            icon: Icons.task,
            title: "Scope",
            press: () {},
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
                Text("Consent"),
              ],
            ),
            children: <Widget>[
              hoverTile('Local'),
              hoverTile('Remote'),
              hoverTile('Api Key'),
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
                Text("Resources"),
              ],
            ),
            children: <Widget>[
              hoverTile('Resources'),
              hoverTile('Role Group'),
              hoverTile('Roles'),
              hoverTile('Privilages'),
            ],
          ),

          DrawerListTile(
            icon: Icons.edit,
            title: "Tag",
            press: () {},
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

  HoverWidget hoverTile(String title) {
    return HoverWidget(
      onHover: (a) {},
      hoverChild: ListTile(
        title: Text(
          title,
          style: TextStyle(color: KC.primary),
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
