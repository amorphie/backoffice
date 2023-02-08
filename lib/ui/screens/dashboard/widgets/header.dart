import 'package:admin/core/controllers/MenuController.dart';
import 'package:admin/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../style/colors.dart';
import '../../../style/paddings.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SearchField(),
        )),
        // if (!Responsive.isMobile(context))
        //   Text("Admin Panel",
        //       style: TextStyle(
        //           color: Colors.black54,
        //           fontWeight: FontWeight.w900,
        //           fontSize: 23)),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),

        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: KC.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Monkey D. Luffy",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400)),
            ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: KC.secondary,
        hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
