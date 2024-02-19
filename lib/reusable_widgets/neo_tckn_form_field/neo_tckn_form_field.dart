/*
 * 
 * neo_bank
 * 
 * Created on 19/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/localization/bloc/localization_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_tckn_form_field/bloc/neo_tckn_form_field_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_validation_model.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class NeoTcknFormField extends StatefulWidget {
  final String? dataKey;
  final String? labelText;
  final EdgeInsetsDirectional padding;
  final String? errorText;
  final bool enabled;
  final FocusNode? focusNode;
  final List<NeoTextValidationModel>? validations;

  const NeoTcknFormField({
    super.key,
    this.dataKey,
    this.labelText,
    this.padding = EdgeInsetsDirectional.zero,
    this.errorText,
    this.enabled = true,
    this.focusNode,
    this.validations,
  });

  @override
  State<NeoTcknFormField> createState() => _NeoTcknFormFieldState();
}

class _NeoTcknFormFieldState extends State<NeoTcknFormField> {
  bool hasError = false;
  bool _isEditingComplete = false;
  FocusNode? _focusNode;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _addFocusNodeListener();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoTcknFormFieldBloc(),
      child: BlocConsumer<NeoTcknFormFieldBloc, NeoTcknFormFieldState>(
        listener: (context, state) {
          if (!state.hasFocus) {
            FocusScope.of(context).unfocus();
          }

          hasError = state.hasError;
        },
        builder: (context, state) {
          return _buildTextFormField(context, state).padding(widget.padding);
        },
      ),
    );
  }

  Widget _buildTextFormField(BuildContext context, NeoTcknFormFieldState state) {
    // STOPSHIP: Add validator
    return TextFormField(
      enabled: widget.enabled,
      autovalidateMode: _isEditingComplete ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
      onTap: () => _setFocus(context, true),
      keyboardType: TextInputType.number,
      maxLength: 11,
      onEditingComplete: () {
        _setFocus(context, false);
        _setEditingComplete(state.hasFocus);
      },
      onTapOutside: (event) {
        _setFocus(context, false);
        _setEditingComplete(state.hasFocus);
      },
      validator: (text) => _inputValidator(text, context),
      style: NeoTextStyles.labelFourteenMedium,
      decoration: _buildInputDecoration(state),
      focusNode: widget.focusNode,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (text) {
        if (widget.dataKey.isNotNull) {
          context.read<WorkflowFormBloc>().add(WorkflowFormEventUpdateTextFormField(key: widget.dataKey.orEmpty, value: text));
        }
        context.read<NeoTcknFormFieldBloc>().add(NeoTcknFormFieldEventUpdateTcknFormField(value: text));
      },
    );
  }

  void _addFocusNodeListener() {
    _focusNode!.addListener(() {
      if (!_focusNode!.hasFocus) {
        _setEditingComplete(true);
      }
    });
  }

  void _setEditingComplete(bool hasFocus) {
    if (hasFocus) {
      setState(() {
        _isEditingComplete = true;
      });
    }
  }

  InputDecoration _buildInputDecoration(NeoTcknFormFieldState state) {
    return InputDecoration(
      border: _borderBuilder(state),
      disabledBorder: _borderBuilder(state),
      focusedBorder: _borderBuilder(state),
      enabledBorder: _borderBuilder(state),
      labelText: _loc(widget.labelText),
      labelStyle: NeoTextStyles.labelFourteenMedium.apply(color: !widget.enabled ? NeoColors.textDisabled : NeoColors.textPlaceholder),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(NeoDimens.px16),
      counterText: '',
      filled: true,
      fillColor: !widget.enabled ? NeoColors.bgMediumDark : NeoColors.baseWhite,
    );
  }

  InputBorder _borderBuilder(NeoTcknFormFieldState state) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(NeoRadius.px8),
      borderSide: BorderSide(color: NeoColors.borderMediumDark),
    );
  }

  void _setFocus(BuildContext context, bool focus) {
    context.read<NeoTcknFormFieldBloc>().add(NeoTcknFormFieldEventUpdateFocus(focus: focus));
  }

  String? _inputValidator(String? text, BuildContext context) {
    final invalidValidationModel = widget.validations?.where((e) => !RegExp(e.regex).hasMatch(text.orEmpty)).firstOrNull;
    if (invalidValidationModel != null) {
      return _loc(invalidValidationModel.message);
    }

    final isValid = context.read<NeoTcknFormFieldBloc>().isValidTcknOrVkn(text.orEmpty);
    if (!isValid) {
      return _loc(widget.errorText);
    }

    return null;
  }

  String? _loc(String? data) => data.orEmpty.isNotEmpty ? localize(data!) : data;
}
