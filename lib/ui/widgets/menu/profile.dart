// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../helpers/exporter.dart';

class MenuProfileItem extends StatelessWidget {
  final Function logoPressed;
  const MenuProfileItem({
    Key? key,
    required this.logoPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              logoPressed();
            },
            child: Icon(
              Icons.person_4,
              size: 150,
            ),
          ),
          // Container(
          //   width: 150,
          //   height: 150,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(100),
          //     image: DecorationImage(
          //       image: NetworkImage("https://picsum.photos/200"),
          //     ),
          //   ),
          // ),
          Text(
            "username",
            style: TextStyle(color: KC.secondary, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
