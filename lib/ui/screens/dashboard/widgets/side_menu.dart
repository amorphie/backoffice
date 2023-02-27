// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../core/export/_.dart';

class SideMenu extends StatelessWidget {
  final Function(int) setIndex;
  const SideMenu({
    Key? key,
    required this.setIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: KC.primary,
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 25),
              CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage('assets/images/pp.jpeg'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 3),
                child: Text('Ozan Deniz Demirtaş',
                    style: TextStyle(fontSize: 14, color: Colors.white)),
              ),
              Text('Software Specialist',
                  style: TextStyle(fontSize: 11, color: Colors.white60)),
            ],
          ),
          SizedBox(height: 10),
          Divider(
            endIndent: 5,
            indent: 5,
            color: Colors.white,
            thickness: 0.5,
          ),
          SizedBox(height: 20),
          DrawerListTile(
            icon: Icons.transform_outlined,
            title: "Users",
            press: () {
              setIndex(0);
            },
          ),
          ExpansionTile(
            textColor: Colors.white54,
            iconColor: Colors.white54,
            collapsedIconColor: Colors.white,
            collapsedTextColor: Colors.white,
            initiallyExpanded: false,
            title: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Consent",
                  // style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            children: <Widget>[
              hoverTile('Local', () {
                setIndex(3);
              }),
              hoverTile('Remote', () {}),
              hoverTile('API Key', () {}),
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
            press: () {},
          ),
          ExpansionTile(
            textColor: Colors.white54,
            iconColor: Colors.white54,
            collapsedIconColor: Colors.white,
            collapsedTextColor: Colors.white,
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
              hoverTile('Resources', () {
                setIndex(4);
              }),
              hoverTile('Role Group', () {
                setIndex(6);
              }),
              hoverTile('Roles', () {
                setIndex(7);
              }),
              hoverTile('Privilages', () {
                setIndex(5);
              }),
            ],
          ),
          ExpansionTile(
            textColor: Colors.white54,
            iconColor: Colors.white54,
            collapsedIconColor: Colors.white,
            collapsedTextColor: Colors.white,
            initiallyExpanded: false,
            title: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text("Admin"),
              ],
            ),
            children: <Widget>[
              hoverTile('Tag', () {
                setIndex(3);
              }),
              hoverTile('Domain', () {}),
              hoverTile('Entity List', () {}),
            ],
          ),
          SizedBox(height: 150),
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
            style: TextStyle(color: Colors.white54),
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
