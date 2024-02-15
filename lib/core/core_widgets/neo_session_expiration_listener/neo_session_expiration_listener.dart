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
import 'package:backoffice/core/core_widgets/neo_session_expiration_listener/util/neo_background_timer.dart';
import 'package:backoffice/features/login/data/neo_auth_status.dart';
import 'package:backoffice/features/login/usecase/logout_user_usecase.dart';
import 'package:backoffice/reusable_widgets/neo_popup/usecases/show_session_timeout_popup_usecase.dart';

abstract class _Constant {
  static const totalDuration = Duration(seconds: 300);
}

class NeoSessionExpirationListener extends StatefulWidget {
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  const NeoSessionExpirationListener({required this.child, required this.navigatorKey, Key? key}) : super(key: key);

  @override
  State<NeoSessionExpirationListener> createState() => _NeoSessionExpirationListenerState();
}

class _NeoSessionExpirationListenerState extends State<NeoSessionExpirationListener> {
  late NeoBackgroundTimer _sessionTimer;

  bool get isLoggedIn => context.read<NeoAppBloc>().authStatus.isTwoFactorAuth;

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NeoAppBloc, NeoAppState>(
      listener: (context, state) {
        if (state.authStatus.isTwoFactorAuth) {
          _sessionTimer
            ..stop()
            ..start(durationInSeconds: _Constant.totalDuration.inSeconds);
        }
      },
      child: Listener(
        onPointerDown: (_) {
          if (isLoggedIn) {
            _sessionTimer
              ..stop()
              ..start(durationInSeconds: _Constant.totalDuration.inSeconds);
          } else {
            _sessionTimer.stop();
          }
        },
        child: widget.child,
      ),
    );
  }

  void _initTimer() {
    _sessionTimer = NeoBackgroundTimer(
      seconds: _Constant.totalDuration.inSeconds,
      onFinished: _onSessionTimedOut,
      onResumed: _onResumed,
      onPaused: _onPaused,
    )..init();
  }

  void _onResumed() {
    if (isLoggedIn) {
      _sessionTimer.resume();
    }
  }

  void _onPaused() {
    _sessionTimer.pause();
  }

  Future<void> _onSessionTimedOut() async {
    final context = widget.navigatorKey.currentContext ?? this.context;
    await LogoutUserUsecase().call(context);
    if (context.mounted) {
      await ShowSessionTimeoutPopupUseCase().call(context);
    }
  }
}
