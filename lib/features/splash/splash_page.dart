import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/localization/bloc/localization_bloc.dart';
import 'package:backoffice/core/navigation/navigation_helper.dart';
import 'package:backoffice/core/pages/neo_page_id.dart';
import 'package:backoffice/features/splash/bloc/splash_bloc.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';
import 'package:neo_core/neo_core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listenWhen: (previousState, newState) => previousState != newState,
      buildWhen: (previousState, newState) => previousState != newState,
      listener: (context, state) {
        switch (state) {
          case SplashStateSuccess _:
            _navigateToWelcomePage();
            break;

          case SplashStateError _:
            _displayErrorMessage(context, state.error);
            break;

          case SplashStateLoading _:
            // No-op
            break;
        }
      },
      builder: (context, state) {
        if (state is SplashStateError) {
          return _buildErrorState(state.error);
        }
        return const Scaffold(body: Center(child: Text("LOADING...", style: TextStyle(fontSize: 40))));
      },
    );
  }

  Widget _buildErrorState(NeoError neoError) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("INITIALIZATION ERROR", style: TextStyle(fontSize: 24)),
            OutlinedButton(
              onPressed: () => context.read<SplashBloc>().add(SplashEventInitProject()),
              child: const Text("Retry Initialization"),
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }

  _navigateToWelcomePage() async {
    unawaited(
      NeoNavigationHelper().navigate(
        context: context,
        navigationType: NeoNavigationType.pushReplacement,
        navigationPath: NeoPageId.boHome,
        //TODO değişiklik yapılacak
      ),
    );
  }

  _displayErrorMessage(BuildContext context, NeoError neoError) async {
    final languageCode = LocalizationBloc.currentLanguage?.languageCode;
    if (languageCode != null) {
      DisplayNeoErrorUseCase().call(neoError, context, languageCode);
    }
  }
}
