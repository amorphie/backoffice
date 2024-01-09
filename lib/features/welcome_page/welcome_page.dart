import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_size.dart';
import 'package:backoffice/reusable_widgets/neo_button/neo_button.dart';
import 'package:backoffice/util/neo_util.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              NeoColors.borderDarker,
              NeoColors.textSuccess,
            ],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            stops: [0.0, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to\nON Mobil",
                style: TextStyle(fontSize: 40, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const NeoButton(
                transitionId: "amorphie-mobile-login",
                startWorkflow: true,
                labelText: "New Login Flow",
                size: NeoButtonSize.large,
              ).paddingOnly(top: 200),
              const NeoButton(
                transitionId: "login",
                startWorkflow: true,
                labelText: "Old Login Flow",
                size: NeoButtonSize.large,
              ).paddingOnly(top: 24),
              const NeoButton(
                transitionId: "OpenBanking-Register",
                startWorkflow: true,
                labelText: "Register Flow",
                size: NeoButtonSize.large,
                displayMode: NeoButtonDisplayMode.line,
              ).paddingOnly(top: 24),
              const NeoButton(
                transitionId: "create-saving-account-workflow",
                startWorkflow: true,
                labelText: "Open Saving Account Flow",
                size: NeoButtonSize.large,
                displayMode: NeoButtonDisplayMode.secondary,
              ).paddingOnly(top: 24),
            ],
          ).paddingSymmetric(horizontal: 32),
        ),
      ),
    );
  }
}
