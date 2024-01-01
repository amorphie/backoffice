/*
 * 
 * Neobank.Client
 * 
 * Created on 14/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/core/models/brg_phone_number.dart';
import 'package:admin/core/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

abstract class _Constants {
  static const inputLength = 10;
}

class NeoPhoneNumberFormField extends StatefulWidget {
  final String? dataKey;
  final String? labelText;
  final EdgeInsetsDirectional? padding;

  const NeoPhoneNumberFormField({
    this.labelText,
    this.dataKey,
    this.padding,
    super.key,
  });

  @override
  State<NeoPhoneNumberFormField> createState() => _NeoPhoneNumberFormFieldState();
}

class _NeoPhoneNumberFormFieldState extends State<NeoPhoneNumberFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextFormField(context),
        ],
      ),
    );
  }

  Widget _buildTextFormField(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      maxLength: 10,
      style: NeoTextStyles.labelFourteenMedium,
      onChanged: (text) {
        if (widget.dataKey.isNotNull) {
          if (text.length != _Constants.inputLength) {
            return;
          }
          final prefix = text.substring(0, 3);
          final number = text.substring(3, text.length);
          context.read<WorkflowFormBloc>().add(
                WorkflowFormEventAddAllParameters(
                  {
                    widget.dataKey.orEmpty: BrgPhoneNumber(
                      countryCode: "90", // STOPSHIP: Update here
                      number: number,
                      prefix: prefix,
                    ).toJson(),
                  },
                ),
              );
        }
      },
      decoration: _buildInputDecoration(),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      border: _borderBuilder(),
      disabledBorder: _borderBuilder(),
      focusedBorder: _borderBuilder(),
      enabledBorder: _borderBuilder(),
      labelText: widget.labelText,
      labelStyle: NeoTextStyles.labelFourteenMedium.apply(color: NeoColors.textPlaceholder),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.symmetric(horizontal: NeoDimens.px16, vertical: 18),
      counterText: '',
      filled: true,
      fillColor: NeoColors.colorBaseWhite,
    );
  }

  InputBorder _borderBuilder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(NeoRadius.px8),
      borderSide: const BorderSide(color: NeoColors.borderMediumDark),
    );
  }
}
