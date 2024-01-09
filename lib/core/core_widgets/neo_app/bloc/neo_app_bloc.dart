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

part 'neo_app_event.dart';
part 'neo_app_state.dart';

class NeoAppBloc extends Bloc<NeoAppEvent, NeoAppState> {
  late bool _isLoggedIn;

  bool get isLoggedIn => _isLoggedIn;

  NeoAppBloc({required bool isLoggedIn}) : super(NeoAppState(isLoggedIn: isLoggedIn)) {
    _isLoggedIn = isLoggedIn;

    on<NeoAppEventUpdateLoggedInStatus>((event, emit) {
      _isLoggedIn = event.isLoggedIn;
    });
  }
}
