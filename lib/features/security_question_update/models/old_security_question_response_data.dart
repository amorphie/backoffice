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

import 'package:json_annotation/json_annotation.dart';

part 'old_security_question_response_data.g.dart';

@JsonSerializable(createToJson: false)
class OldSecurityQuestionResponseData {
  @JsonKey(name: "Question")
  final String? question;
  @JsonKey(name: "QuestionDefinitionId")
  final String? questionDefinitionId;

  OldSecurityQuestionResponseData({this.question, this.questionDefinitionId});

  factory OldSecurityQuestionResponseData.fromJson(Map<String, dynamic> json) =>
      _$OldSecurityQuestionResponseDataFromJson(json);
}
