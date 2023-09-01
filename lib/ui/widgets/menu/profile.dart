import 'package:admin/ui/style/colors.dart';
import 'package:admin/ui/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuProfileItem extends StatelessWidget {
  const MenuProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Icon(
            Icons.person_4,
            size: 150,
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
          Searchtf(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
            ],
            labelText: "TCKN",
            hintText: "TR00 0000 0000 0000 0000 00",
            textInputType: TextInputType.number,
          )
        ],
      ),
    );
  }
}
