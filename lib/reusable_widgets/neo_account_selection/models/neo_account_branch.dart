import 'package:json_annotation/json_annotation.dart';

part 'neo_account_branch.g.dart';

@JsonSerializable()
class NeoAccountBranch {
  NeoAccountBranch({this.code, this.name});

  @JsonKey(name: "code")
  final String? code;

  @JsonKey(name: "name")
  final String? name;

  factory NeoAccountBranch.fromJson(Map<String, dynamic> json) => _$NeoAccountBranchFromJson(json);
}
