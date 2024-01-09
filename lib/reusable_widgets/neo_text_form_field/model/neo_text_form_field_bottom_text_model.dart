/*
 * 
 * neo_ui
 * 
 * Created on 20/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_annotation/json_annotation.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_form_field_bottom_text_message_type.dart';

part 'neo_text_form_field_bottom_text_model.g.dart';

@JsonSerializable()
class NeoTextFormFieldBottomTextModel {
  @JsonKey(name: 'messageType')
  final NeoTextFormFieldBottomTextMessageType? messageType;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'iconUrn')
  final String? iconUrn;

  NeoTextFormFieldBottomTextModel({this.messageType, this.message, this.iconUrn});

  factory NeoTextFormFieldBottomTextModel.fromJson(Map<String, dynamic> json) => _$NeoTextFormFieldBottomTextModelFromJson(json);

  Map<String, dynamic> toJson() => _$NeoTextFormFieldBottomTextModelToJson(this);
}
