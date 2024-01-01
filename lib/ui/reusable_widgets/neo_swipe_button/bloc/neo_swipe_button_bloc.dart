/*
 * Neobank.Client
 *
 * Created on 23/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'neo_swipe_button_event.dart';
part 'neo_swipe_button_state.dart';

class NeoSwipeButtonBloc extends Bloc<NeoSwipeButtonEvent, NeoSwipeButtonState> {
  NeoSwipeButtonBloc() : super(const NeoSwipeButtonState(isLoading: false)) {
    on<NeoSwipeButtonEventStopLoading>((event, emit) {
      emit(const NeoSwipeButtonState(isLoading: false));
    });
    on<NeoSwipeButtonEventStartTransaction>((event, emit) {
      emit(const NeoSwipeButtonState(isLoading: true));
    });
    on<NeoSwipeButtonEventShowError>((event, emit) {
      emit(NeoSwipeButtonState(isLoading: false, errorMessage: event.message));
    });
  }
}
