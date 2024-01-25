/*
 * neo_ui
 *
 * Created on 17/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/util/extensions/nullable_extensions.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

extension NullableStringExtensions on String? {
  String get orEmpty => this ?? "";

  bool get isNullOrBlank => isNull || this!.isBlank;
}

extension StringExtensions on String {
  bool get isBlank => trim().isEmpty;

  /// Returns formatted navigation path with query parameters
  String formatWithQueryParams(Map<String, dynamic> queryParams) {
    if (isEmpty) {
      return this;
    }

    final nonEmptyEntries = queryParams.entries.where((entry) {
      final value = entry.value;
      return value != null && (value is! String || value.isNotEmpty);
    });

    if (nonEmptyEntries.isEmpty) {
      return this;
    }

    final nonEmptyQueryParams = nonEmptyEntries.map((entry) => '${entry.key}=${entry.value}');
    return '$this?${nonEmptyQueryParams.join('&')}';
  }

  String formatDataWithDataKey(BuildContext context, String? dataKey) {
    WorkflowFormBloc? workflowFormBloc;
    try {
      workflowFormBloc = context.read<WorkflowFormBloc>();
    } catch (e) {
      // No-op
    }
    final patternToReplace = "{$dataKey}";
    if (dataKey != null && dataKey.isNotEmpty && contains(patternToReplace)) {
      final dataValue = workflowFormBloc?.formData[dataKey];
      if (dataValue is String && dataValue.isNotEmpty) {
        return replaceAll(patternToReplace, dataValue);
      }
    }
    return this;
  }
}
