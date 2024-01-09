import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/features/splash/bloc/splash_bloc.dart';
import 'package:backoffice/features/splash/splash_page.dart';

class SplashPageRoute extends StatelessWidget {
  const SplashPageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SplashEventInitProject()),
      child: const SplashPage(),
    );
  }
}
