/*
 * 
 * Neobank.Client
 * 
 * Created on 30/11/2023.
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
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/localization/bloc/localization_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_button/neo_button.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/bloc/neo_text_form_field_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_button_data_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_keyboard_type.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_form_field_bottom_text_message_type.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_form_field_bottom_text_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_validation_model.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/bus/neo_bus.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class NeoTextFormField extends StatefulWidget {
  final String titleText;
  final String? titleIconUrn;
  final String? dataKey;
  final String? widgetEventKey;
  final String subtitleText;
  final String? labelText;
  final String labelInitialText;
  final int? maxLength;
  final NeoTextFormFieldBottomTextModel? bottomText;
  final bool enabled;
  final bool obscureText;
  final bool showObscureStatusChangeButton;
  final EdgeInsetsDirectional? padding;
  final String? iconLeftUrn;
  final String? iconRightUrn;
  final NeoKeyboardType? keyboardType;
  final NeoButtonDataModel? buttonRight;
  final FocusNode? focusNode;
  final List<NeoTextValidationModel>? validations;

  // STOPSHIP: Create a model for backend
  final List<TextInputFormatter>? inputFormatters;
  final bool? enableInteractiveSelection;

  const NeoTextFormField({
    this.labelText,
    this.titleIconUrn,
    this.titleText = '',
    this.dataKey,
    this.subtitleText = '',
    this.labelInitialText = '',
    this.maxLength,
    this.bottomText,
    this.enabled = true,
    this.obscureText = false,
    this.showObscureStatusChangeButton = false,
    this.padding,
    this.iconLeftUrn,
    this.iconRightUrn,
    this.keyboardType,
    this.buttonRight,
    this.widgetEventKey,
    this.focusNode,
    this.validations,
    this.inputFormatters,
    this.enableInteractiveSelection,
    super.key,
  });

  @override
  State<NeoTextFormField> createState() => _NeoTextFormFieldState();
}

class _NeoTextFormFieldState extends State<NeoTextFormField> {
  bool _isEditingComplete = false;
  FocusNode? _focusNode;
  late final String _initialLabelText;

  @override
  void initState() {
    super.initState();
    _setInitialLabelTextIfExist();
    _focusNode = widget.focusNode ?? FocusNode();
    _addFocusNodeListener();
    _initialLabelText = _getInitialLabelText(context, context.read<WorkflowFormBloc>().formData);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoTextFormFieldBloc(obscureText: widget.obscureText, widgetEventKey: widget.widgetEventKey),
      child: BlocConsumer<NeoTextFormFieldBloc, NeoTextFormFieldState>(
        builder: (context, state) {
          return Padding(
            padding: widget.padding ?? EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!widget.titleText.isNullOrBlank) _buildTitleRow(),
                if (!widget.subtitleText.isNullOrBlank) _buildSubtitle().paddingOnly(bottom: NeoDimens.px4),
                _buildTextFormField(context, state),
                if (widget.bottomText.isNotNull && widget.bottomText!.messageType != NeoTextFormFieldBottomTextMessageType.error) _buildBottomTextRow(state).paddingOnly(top: NeoDimens.px4),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (!state.hasFocus) {
            FocusScope.of(context).unfocus();
          }
        },
      ),
    );
  }

  Widget _buildTextFormField(BuildContext context, NeoTextFormFieldState state) {
    return TextFormField(
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      autovalidateMode: _isEditingComplete ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
      initialValue: _initialLabelText,
      onTap: () => _setFocus(context, true),
      keyboardType: widget.keyboardType?.mapToTextInputType(),
      validator: (text) => _inputValidator(text, state.error),
      maxLength: widget.maxLength,
      onEditingComplete: () {
        _setFocus(context, false);
        _setEditingComplete(state.hasFocus);
      },
      onTapOutside: (event) {
        _setFocus(context, false);
        _setEditingComplete(state.hasFocus);
      },
      obscureText: state.obscureText!,
      style: NeoTextStyles.labelFourteenMedium,
      inputFormatters: widget.inputFormatters,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      onChanged: (text) {
        if (widget.dataKey.isNotNull) {
          context.read<WorkflowFormBloc>().add(WorkflowFormEventUpdateTextFormField(key: widget.dataKey.orEmpty, value: text));
        }

        if (widget.widgetEventKey != null) {
          getIt.get<NeoWidgetEventBus>().addEvent(NeoWidgetEvent(eventId: widget.widgetEventKey!, data: text));
        }
      },
      decoration: _buildInputDecoration(context, state),
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

  InputDecoration _buildInputDecoration(BuildContext context, NeoTextFormFieldState state) {
    return InputDecoration(
      border: _borderBuilder(state),
      disabledBorder: _borderBuilder(state),
      focusedBorder: _borderBuilder(state),
      enabledBorder: _borderBuilder(state),
      errorMaxLines: 2,
      labelText: _loc(widget.labelText),
      labelStyle: NeoTextStyles.labelFourteenMedium.apply(color: !widget.enabled ? NeoColors.textDisabled : NeoColors.textPlaceholder),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      prefixIcon: (!widget.iconLeftUrn.isNullOrBlank && !state.hasFocus) ? _buildPrefixElements(state) : null,
      suffixIcon: _buildSuffixElements(context, state),
      contentPadding: const EdgeInsets.all(NeoDimens.px16),
      counterText: '',
      filled: true,
      fillColor: !widget.enabled ? NeoColors.bgMediumDark : NeoColors.baseWhite,
    );
  }

  Widget _buildPrefixElements(NeoTextFormFieldState state) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!widget.iconLeftUrn.isNullOrBlank && !state.hasFocus)
          NeoIcon(
            iconUrn: widget.iconLeftUrn!,
            width: NeoDimens.px20,
            height: NeoDimens.px20,
            color: !widget.enabled
                ? NeoColors.textDisabled
                : !state.error.isNullOrBlank
                    ? NeoColors.textDefault
                    : null,
          ).paddingOnly(start: NeoDimens.px16, end: NeoDimens.px8),
      ],
    );
  }

  Widget _buildSuffixElements(BuildContext context, NeoTextFormFieldState state) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.buttonRight.isNotNull)
          NeoButton(
            transitionId: widget.buttonRight!.transitionId,
            labelText: widget.buttonRight!.labelText,
            displayMode: widget.buttonRight!.displayMode,
          ).paddingOnly(end: !widget.iconRightUrn.isNullOrBlank ? NeoDimens.px4 : NeoDimens.px16),
        if (!widget.iconRightUrn.isNullOrBlank)
          NeoIcon(
            iconUrn: widget.iconRightUrn!,
            width: NeoDimens.px20,
            height: NeoDimens.px20,
            color: !widget.enabled
                ? NeoColors.textDisabled
                : !state.error.isNullOrBlank
                    ? NeoColors.textDefault
                    : null,
          ).paddingOnly(start: widget.buttonRight.isNotNull ? NeoDimens.px0 : NeoDimens.px8, end: NeoDimens.px16),
        if (widget.showObscureStatusChangeButton) _buildObscureButton(context, state),
      ],
    );
  }

  Widget _buildObscureButton(BuildContext context, NeoTextFormFieldState state) {
    return GestureDetector(
      onTap: () {
        context.read<NeoTextFormFieldBloc>().add(const NeoTextFormFieldEventChangeObscureStatus());
      },
      child: NeoIcon(
        color: NeoColors.textPlaceholder,
        iconUrn: state.obscureText! ? NeoAssets.eye20px.urn : NeoAssets.eyeSlash20px.urn,
      ),
    );
  }

  InputBorder _borderBuilder(NeoTextFormFieldState state) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(NeoRadius.px8),
      borderSide: BorderSide(color: NeoColors.borderMediumDark),
    );
  }

  Widget _buildBottomTextRow(NeoTextFormFieldState state) {
    return Row(
      children: [
        if (widget.bottomText!.iconUrn != null)
          NeoIcon(
            iconUrn: widget.bottomText!.iconUrn!,
            width: NeoDimens.px16,
            height: NeoRadius.px16,
            color: NeoColors.iconDefault,
          ).paddingOnly(end: NeoDimens.px4),
        if (widget.bottomText!.message != null)
          NeoText(
            widget.bottomText!.message,
            style: NeoTextStyles.bodyTwelveRegular.apply(color: NeoColors.textSecondary),
          ),
      ],
    );
  }

  Widget _buildSubtitle() {
    return NeoText(widget.subtitleText, style: NeoTextStyles.bodyTwelveRegular.apply(color: NeoColors.textSecondary));
  }

  Widget _buildTitleRow() {
    return Row(
      children: [
        NeoText(widget.titleText, style: NeoTextStyles.bodyTwelveMedium).paddingOnly(bottom: NeoDimens.px4, end: NeoDimens.px4),
        if (!widget.titleIconUrn.isNullOrBlank) NeoIcon(iconUrn: widget.titleIconUrn!, width: NeoDimens.px16, height: NeoDimens.px16),
      ],
    );
  }

  void _setFocus(BuildContext context, bool focus) {
    context.read<NeoTextFormFieldBloc>().add(
          NeoTextFormFieldEventUpdateFocus(focus: focus),
        );
  }

  void _setInitialLabelTextIfExist() {
    if (widget.dataKey.isNotNull) {
      final formData = context.read<WorkflowFormBloc>().formData;
      final initialText = _getInitialLabelText(context, formData);
      if (initialText.isNotEmpty) {
        context.read<WorkflowFormBloc>().add(
              WorkflowFormEventUpdateTextFormField(key: widget.dataKey.orEmpty, value: initialText),
            );
      }
    }
  }

  String _getInitialLabelText(BuildContext context, Map<String, dynamic> formData) {
    final dataKey = widget.dataKey;

    if (dataKey != null && dataKey.isNotEmpty) {
      final initialFormData = formData[dataKey];
      if (initialFormData is String && initialFormData.isNotEmpty) {
        return initialFormData;
      }
    }
    return widget.labelInitialText;
  }

  String? _inputValidator(String? text, String? error) {
    final invalidValidationModel = widget.validations?.where((e) => !RegExp(e.regex).hasMatch(text.orEmpty)).firstOrNull;

    if (invalidValidationModel != null) {
      return _loc(invalidValidationModel.message);
    }
    if (!error.isNullOrBlank) {
      return error;
    }
    return null;
  }

  String? _loc(String? data) => data.orEmpty.isNotEmpty ? localize(data!) : data;
}
