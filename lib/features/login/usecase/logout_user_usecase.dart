/*
 * 
 * neo_bank
 * 
 * Created on 27/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/core_widgets/neo_app/bloc/neo_app_bloc.dart';
import 'package:backoffice/core/navigation/navigation_helper.dart';
import 'package:backoffice/core/pages/neo_page_id.dart';
import 'package:backoffice/features/login/data/login_network_manager.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';
import 'package:neo_core/core/storage/neo_core_secure_storage.dart';

class LogoutUserUsecase {
  void call(BuildContext context) {
    context.read<NeoAppBloc>().add(const NeoAppEventUpdateLoggedInStatus(isLoggedIn: false));
    LoginNetworkManager().tokenRevoke();
    _deleteTokens();
    _navigateToWelcomePage(context);
  }

  void _navigateToWelcomePage(BuildContext context) {
    unawaited(
      NeoNavigationHelper().navigate(
        context: context,
        navigationType: NeoNavigationType.pushAsRoot,
        navigationPath: NeoPageId.welcome,
      ),
    );
  }

  void _deleteTokens() {
    unawaited(NeoCoreSecureStorage().deleteTokens());
  }
}
