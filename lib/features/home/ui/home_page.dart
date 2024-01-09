import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/core_widgets/neo_component_tree_builder/neo_component_tree_builder.dart';
import 'package:backoffice/core/pages/neo_page_id.dart';
import 'package:backoffice/features/home/bloc/home_page_bloc.dart';
import 'package:backoffice/features/login/usecase/logout_user_usecase.dart';
import 'package:backoffice/reusable_widgets/neo_popup/usecases/show_logout_confirmation_popup_usecase.dart';
import 'package:backoffice/util/dialog/language_selection_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (BuildContext context, HomePageState state) {
          if (state is HomePageStateLoggedOut) {
            LogoutUserUsecase().call(context);
          }
        },
        builder: (context, state) {
          return NeoComponentTreeBuilder(
            componentsNetworkManager: context.read<HomePageBloc>().componentsNetworkManager,
            pageId: NeoPageId.home,
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Home Page'),
      automaticallyImplyLeading: false, // TODO: Delete it after updating navigation tree
      actions: [
        IconButton(
          onPressed: () => _onLogoutButtonPressed(context),
          icon: const Icon(Icons.logout),
        ),
        IconButton(
          onPressed: () => LanguageSelectionDialog().show(context),
          icon: const Icon(Icons.language),
        ),
      ],
    );
  }

  _onLogoutButtonPressed(BuildContext context) {
    ShowLogoutConfirmationPopupUseCase().call(context);
  }
}
