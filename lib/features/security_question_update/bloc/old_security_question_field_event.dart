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
part of 'old_security_question_field_bloc.dart';

sealed class OldSecurityQuestionFieldEvent extends Equatable {
  const OldSecurityQuestionFieldEvent();
}

class OldSecurityQuestionFetchQuestion extends OldSecurityQuestionFieldEvent {
  const OldSecurityQuestionFetchQuestion();

  @override
  List<Object?> get props => [];
}
