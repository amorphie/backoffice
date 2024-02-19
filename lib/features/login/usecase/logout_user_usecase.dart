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
import 'package:backoffice/features/login/data/login_network_manager.dart';
import 'package:backoffice/features/login/data/neo_auth_status.dart';
import 'package:backoffice/features/login/usecase/navigate_to_welcome_page_usecase.dart';
import 'package:neo_core/core/storage/neo_core_secure_storage.dart';

class LogoutUserUsecase {
  Future<void> call(BuildContext context) async {
    context.read<NeoAppBloc>().add(const NeoAppEventUpdateAuthStatus(authStatus: NeoAuthStatus.notLoggedIn));
    await LoginNetworkManager().tokenRevoke();
    _deleteTokens();
    if (context.mounted) {
      await NavigateToWelcomePageUsecase()(context);
    }
  }

  void _deleteTokens() {
    unawaited(NeoCoreSecureStorage().deleteTokens());
  }
}
