/*
 * neo_bank
 *
 * Created on 20/02/2024.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/features/security_question_update/models/old_security_question_response_data.dart';
import 'package:backoffice/features/security_question_update/network/old_security_question_network_manager.dart';
import 'package:neo_core/core/network/models/neo_response.dart';

part 'old_security_question_field_event.dart';
part 'old_security_question_field_state.dart';

class OldSecurityQuestionFieldBloc extends Bloc<OldSecurityQuestionFieldEvent, OldSecurityQuestionFieldState> {
  final OldSecurityQuestionNetworkManager networkManager;

  OldSecurityQuestionFieldBloc({required this.networkManager}) : super(OldSecurityQuestionFieldStateLoading()) {
    on<OldSecurityQuestionFetchQuestion>(_onFetchOldQuestion);
  }

  Future<void> _onFetchOldQuestion(
    OldSecurityQuestionFetchQuestion event,
    Emitter<OldSecurityQuestionFieldState> emit,
  ) async {
    emit(OldSecurityQuestionFieldStateLoading());
    try {
      final response = await networkManager.fetchOldQuestion();
      if (response.isSuccess) {
        final oldQuestion = OldSecurityQuestionResponseData.fromJson((response as NeoSuccessResponse).data);
        emit(OldSecurityQuestionFieldStateLoaded(oldQuestion));
      }
    } on Exception catch (e) {
      // TODO: Handle error if necessary
      emit(OldSecurityQuestionFieldStateError(e.toString()));
    }
  }
}
