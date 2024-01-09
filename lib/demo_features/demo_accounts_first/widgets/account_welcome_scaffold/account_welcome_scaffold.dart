import 'package:flutter/material.dart';
import 'package:backoffice/util/neo_util.dart';

class AccountWelcomeScaffold extends StatelessWidget {
  const AccountWelcomeScaffold({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.white,
            ],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomLeft,
            stops: [0.0, 1.0],
          ),
        ),
        child: Center(
          child: child.paddingSymmetric(horizontal: 32),
        ),
      ),
    );
  }
}
