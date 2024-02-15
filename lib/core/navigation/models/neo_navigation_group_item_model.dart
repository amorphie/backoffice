/*
 * neo_ui
 *
 * Created on 22/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:expressions/expressions.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_manager.dart';
import 'package:backoffice/features/login/data/neo_auth_status.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/storage/neo_core_secure_storage.dart';

part 'neo_navigation_group_item_model.g.dart';

abstract class _Constant {
  static const navigationParameterDataKey = "dataKey";
  static const navigationParameterSourceKey = "source";
  static const navigationFilterExpressionKey = "expression";
}

@JsonSerializable(createToJson: false)
class NeoNavigationGroupItemModel {
  @JsonKey(name: "display", defaultValue: "")
  final String displayName;

  @JsonKey(name: "icon", defaultValue: "")
  final String iconUrn;

  @JsonKey(name: "priority", defaultValue: 0)
  final int priority;

  @JsonKey(name: "key", defaultValue: "")
  final String key;

  @JsonKey(name: "navigation-path", defaultValue: "")
  final String navigationPath;

  @JsonKey(name: "action", defaultValue: "")
  final String action;

  @JsonKey(name: "audience", defaultValue: [], fromJson: parseAudienceFromJson)
  final List<NeoAuthStatus> audience;

  @JsonKey(name: "is-new", defaultValue: false)
  final bool isNew;

  @JsonKey(name: "filter", defaultValue: {})
  final Map<String, dynamic> filter;

  @JsonKey(name: "parameters", defaultValue: [])
  final List<Map<String, dynamic>> parameters;

  NeoNavigationGroupItemModel({
    required this.displayName,
    required this.iconUrn,
    required this.priority,
    required this.key,
    required this.action,
    required this.navigationPath,
    required this.audience,
    required this.isNew,
    required this.filter,
    required this.parameters,
  });

  factory NeoNavigationGroupItemModel.fromJson(Map<String, dynamic> json) => _$NeoNavigationGroupItemModelFromJson(json);
}

List<NeoAuthStatus> parseAudienceFromJson(List<dynamic> audienceMap) {
  final audienceList = audienceMap.map((e) => e as String).toList();
  return audienceList.map((e) => NeoAuthStatus.values.firstWhere((element) => element.key == e)).toList();
}

extension NeoNavigationGroupItemModelExtension on NeoNavigationGroupItemModel {
  Future<bool> get isAvailableByAudience async {
    final authToken = await NeoCoreSecureStorage().getAuthToken();
    final notLoggedInRequirement = audience.contains(NeoAuthStatus.notLoggedIn);
    final oneFactorAuthStatus = authToken.isNotNull && authToken!.isNotEmpty;
    final onFactorAuthRequirement = audience.contains(NeoAuthStatus.oneFactorAuth);
    return notLoggedInRequirement || (oneFactorAuthStatus && onFactorAuthRequirement);
  }

  Future<bool> get isAvailableBy2FA async {
    final authToken = await NeoCoreSecureStorage().getAuthToken();
    final oneFactorAuthStatus = authToken.isNotNull && authToken!.isNotEmpty;

    // STOPSHIP: Read 2FA status from secure storage and update this condition
    const twoFactorAuthStatus = true;
    return oneFactorAuthStatus && twoFactorAuthStatus;
  }

  Future<bool> get isAvailableByFilter async {
    if (filter[_Constant.navigationFilterExpressionKey] == null) {
      return true;
    }

    final source = await getTransitionParameters();
    if (source.isNotEmpty && source.values.every((element) => element != null)) {
      final Expression expression = Expression.parse(filter[_Constant.navigationFilterExpressionKey].toString());
      return const ExpressionEvaluator().eval(expression, source);
    } else {
      return false;
    }
  }

  Future<Map<String, dynamic>> getTransitionParameters() async {
    final Map<String, dynamic> result = {};

    for (final parameter in parameters) {
      result[parameter[_Constant.navigationParameterDataKey]] = await getIt.get<NeoParameterManager>().read(
            keyUrn: parameter[_Constant.navigationParameterSourceKey],
          );
    }
    return result;
  }
}
