/*
 * neo_bank
 *
 * Created on 29/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_annotation/json_annotation.dart';

part 'neo_terms_and_conditions_item_data.g.dart';

@JsonSerializable(createToJson: false)
class NeoTermsAndConditionsItemData {
  @JsonKey(name: "id", includeFromJson: false)
  final String? id;

  @JsonKey(name: "filePath")
  final String filePath;

  @JsonKey(name: "fileType")
  final String fileType;

  @JsonKey(name: "fileContextType")
  final String fileContextType;

  @JsonKey(name: "fileName")
  final String fileName;

  @JsonKey(name: "documentCode")
  final String documentCode;

  @JsonKey(name: "documentVersion")
  final String documentVersion;

  @JsonKey(name: "reference")
  final String reference;

  @JsonKey(name: "owner")
  final String owner;

  @JsonKey(name: "fileContext")
  final String fileContext;

  NeoTermsAndConditionsItemData({
    required this.filePath,
    required this.fileType,
    required this.fileContextType,
    required this.fileName,
    required this.documentCode,
    required this.documentVersion,
    required this.reference,
    required this.owner,
    required this.fileContext,
    this.id,
  });

  factory NeoTermsAndConditionsItemData.fromJson(Map<String, dynamic> json) =>
      _$NeoTermsAndConditionsItemDataFromJson(json);

  /// Some of the keys are different for toJson method
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'filePath': filePath,
        'file-type': fileType,
        'fileContextType': fileContextType,
        'file-name': fileName,
        'documentCode': documentCode,
        'documentVersion': documentVersion,
        'reference': reference,
        'owner': owner,
        'fileContext': fileContext,
      };

  NeoTermsAndConditionsItemData copyWith({String? id, String? fileContext}) {
    return NeoTermsAndConditionsItemData(
      id: id ?? this.id,
      filePath: filePath,
      fileType: fileType,
      fileContextType: fileContextType,
      fileName: fileName,
      documentCode: documentCode,
      documentVersion: documentVersion,
      reference: reference,
      owner: owner,
      fileContext: fileContext ?? this.fileContext,
    );
  }
}
