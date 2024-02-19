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

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/neo_secure_storage/neo_secure_storage.dart';
import 'package:backoffice/features/login/data/neo_auth_status.dart';
import 'package:backoffice/reusable_widgets/neo_theme_selector/neo_theme_selector.dart';

part 'neo_app_event.dart';
part 'neo_app_state.dart';

class NeoAppBloc extends Bloc<NeoAppEvent, NeoAppState> {
  final NeoSecureStorage _neoSecureStorage;
  late NeoAuthStatus authStatus;

  NeoAppBloc({required this.authStatus})
      : _neoSecureStorage = NeoSecureStorage(),
        super(NeoAppState(authStatus: authStatus)) {
    on<NeoAppEventInit>((event, emit) async {
      final String? savedTheme = await _neoSecureStorage.getCurrentTheme();
      emit(NeoAppState(authStatus: authStatus, appTheme: savedTheme ?? ThemeMode.light.name));
    });

    on<NeoAppEventUpdateAuthStatus>((event, emit) async {
      authStatus = event.authStatus;
      await _neoSecureStorage.setAuthStatus(authStatus);
      emit(NeoAppState(authStatus: authStatus));
    });

    on<NeoAppEventChangeAppTheme>((NeoAppEventChangeAppTheme event, Emitter<NeoAppState> emit) async {
      await _neoSecureStorage.setCurrentTheme(event.selectedTheme);
      emit(NeoAppState(authStatus: authStatus, appTheme: event.selectedTheme));
    });
  }
}
