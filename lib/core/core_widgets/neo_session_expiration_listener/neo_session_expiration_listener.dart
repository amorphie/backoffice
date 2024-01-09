/*
 * neo_bank
 *
 * Created on 2/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/core_widgets/neo_app/bloc/neo_app_bloc.dart';
import 'package:backoffice/core/core_widgets/neo_session_expiration_listener/util/neo_session_timer.dart';
import 'package:backoffice/features/login/usecase/logout_user_usecase.dart';
import 'package:backoffice/reusable_widgets/neo_popup/usecases/show_session_timeout_popup_usecase.dart';

class NeoSessionExpirationListener extends StatefulWidget {
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  const NeoSessionExpirationListener({required this.child, required this.navigatorKey, Key? key}) : super(key: key);

  @override
  State<NeoSessionExpirationListener> createState() => _NeoSessionExpirationListenerState();
}

class _NeoSessionExpirationListenerState extends State<NeoSessionExpirationListener> {
  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        final isLoggedIn = context.read<NeoAppBloc>().isLoggedIn;
        if (isLoggedIn) {
          NeoSessionTimer().resetTimer();
        }
      },
      child: widget.child,
    );
  }

  void _initTimer() {
    NeoSessionTimer.setTimeOutCallback(() => _onSessionTimedOut());
  }

  void _onSessionTimedOut() {
    final context = widget.navigatorKey.currentContext ?? this.context;
    LogoutUserUsecase().call(context);
    ShowSessionTimeoutPopupUseCase().call(context);
  }
}
