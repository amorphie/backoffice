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
import 'package:admin/ui/reusable_widgets/neo_tckn_form_field/bloc/neo_tckn_form_field_bloc.dart';
import 'package:admin/core/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class NeoTcknFormField extends StatefulWidget {
  final String? dataKey;
  final String? labelText;
  final EdgeInsetsDirectional padding;
  final String? errorText;
  final bool enabled;
  final FocusNode? focusNode;

  const NeoTcknFormField({
    super.key,
    this.dataKey,
    this.labelText,
    this.padding = EdgeInsetsDirectional.zero,
    this.errorText,
    this.enabled = true,
    this.focusNode,
  });

  @override
  State<NeoTcknFormField> createState() => _NeoTcknFormFieldState();
}

class _NeoTcknFormFieldState extends State<NeoTcknFormField> {
  bool hasError = false;

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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: () => _setFocus(context, true),
      keyboardType: TextInputType.number,
      maxLength: 11,
      onEditingComplete: () => _setFocus(context, false),
      onTapOutside: (event) => _setFocus(context, false),
      validator: _inputValidator,
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

  InputDecoration _buildInputDecoration(NeoTcknFormFieldState state) {
    return InputDecoration(
      border: _borderBuilder(state),
      disabledBorder: _borderBuilder(state),
      focusedBorder: _borderBuilder(state),
      enabledBorder: _borderBuilder(state),
      labelText: widget.labelText,
      labelStyle: NeoTextStyles.labelFourteenMedium.apply(color: !widget.enabled ? NeoColors.textDisabled : NeoColors.textPlaceholder),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.symmetric(horizontal: NeoDimens.px16, vertical: 18),
      counterText: '',
      filled: true,
      fillColor: !widget.enabled ? NeoColors.bgMediumDark : NeoColors.colorBaseWhite,
    );
  }

  InputBorder _borderBuilder(NeoTcknFormFieldState state) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(NeoRadius.px8),
      borderSide: BorderSide(color: state.hasError ? NeoColors.textDanger : NeoColors.borderMediumDark),
    );
  }

  void _setFocus(BuildContext context, bool focus) {
    context.read<NeoTcknFormFieldBloc>().add(NeoTcknFormFieldEventUpdateFocus(focus: focus));
  }

  String? _inputValidator(String? text) {
    if (!hasError) {
      return null;
    } else {
      return widget.errorText;
    }
  }
}
