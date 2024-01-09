import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/network/components_network_manager.dart';
import 'package:backoffice/features/home/bloc/home_page_bloc.dart';
import 'package:backoffice/features/home/ui/home_page.dart';

@immutable
class HomePageRoute extends StatelessWidget {
  const HomePageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(componentsNetworkManager: ComponentsNetworkManager()),
      child: const HomePage(),
    );
  }
}
