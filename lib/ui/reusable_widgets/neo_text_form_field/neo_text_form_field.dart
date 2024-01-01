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
import 'package:admin/core/dependency_injection/dependency_injection.dart';
import 'package:admin/ui/reusable_widgets/neo_button/neo_button.dart';
import 'package:admin/ui/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_data_model.dart';
import 'package:admin/ui/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_form_field_display_mode.dart';
import 'package:admin/ui/reusable_widgets/neo_dropdown_form_field/neo_dropdown_form_field.dart';
import 'package:admin/ui/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:admin/ui/reusable_widgets/neo_text_form_field/bloc/neo_text_form_field_bloc.dart';
import 'package:admin/ui/reusable_widgets/neo_text_form_field/model/neo_button_data_model.dart';
import 'package:admin/ui/reusable_widgets/neo_text_form_field/model/neo_keyboard_type.dart';
import 'package:admin/ui/reusable_widgets/neo_text_form_field/model/neo_text_form_field_bottom_text_message_type.dart';
import 'package:admin/ui/reusable_widgets/neo_text_form_field/model/neo_text_form_field_bottom_text_model.dart';
import 'package:admin/core/util/neo_util.dart';
import 'package:neo_core/core/bus/neo_bus.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class _Constants {
  _Constants._();

  static const borderThickness = 1.0;
  static const dividerIndent = 1.0;
}

class NeoTextFormField extends StatefulWidget {
  final String titleText;
  final String? titleIconUrn;
  final String? dataKey;
  final String? widgetEventKey;
  final String subtitleText;
  final String? labelText;
  final String labelInitialText;
  final String? validationRegex;
  final int? maxLength;
  final NeoTextFormFieldBottomTextModel? bottomText;
  final bool enabled;
  final bool obscureText;
  final bool showObscureStatusChangeButton;
  final EdgeInsetsDirectional? padding;
  final String? iconLeftUrn;
  final String? iconRightUrn;
  final NeoDropdownDataModel? dropdownLeft;
  final NeoDropdownDataModel? dropdownRight;
  final NeoKeyboardType? keyboardType;
  final NeoButtonDataModel? buttonRight;
  final FocusNode? focusNode;
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
    this.validationRegex,
    this.maxLength,
    this.bottomText,
    this.enabled = true,
    this.obscureText = false,
    this.showObscureStatusChangeButton = false,
    this.padding,
    this.iconLeftUrn,
    this.iconRightUrn,
    this.dropdownLeft,
    this.dropdownRight,
    this.keyboardType,
    this.buttonRight,
    this.widgetEventKey,
    this.focusNode,
    this.inputFormatters,
    this.enableInteractiveSelection,
    super.key,
  });

  @override
  State<NeoTextFormField> createState() => _NeoTextFormFieldState();
}

class _NeoTextFormFieldState extends State<NeoTextFormField> {
  @override
  void initState() {
    super.initState();
    _setInitialLabelTextIfExist();
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: _getInitialLabelText(context, context.read<WorkflowFormBloc>().formData),
      onTap: () => _setFocus(context, true),
      keyboardType: widget.keyboardType?.mapToTextInputType(),
      validator: (text) => _inputValidator(text, state.error),
      maxLength: widget.maxLength,
      onEditingComplete: () => _setFocus(context, false),
      onTapOutside: (event) => _setFocus(context, false),
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

  InputDecoration _buildInputDecoration(BuildContext context, NeoTextFormFieldState state) {
    return InputDecoration(
      border: _borderBuilder(state),
      disabledBorder: _borderBuilder(state),
      focusedBorder: _borderBuilder(state),
      enabledBorder: _borderBuilder(state),
      labelText: widget.labelText,
      labelStyle: NeoTextStyles.labelFourteenMedium.apply(color: !widget.enabled ? NeoColors.textDisabled : NeoColors.textPlaceholder),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      prefixIcon: (widget.dropdownLeft.isNotNull && widget.dropdownLeft!.items.isNotEmpty) || (!widget.iconLeftUrn.isNullOrBlank && !state.hasFocus) ? _buildPrefixElements(state) : null,
      suffixIcon: _buildSuffixElements(context, state),
      contentPadding: const EdgeInsets.symmetric(horizontal: NeoDimens.px16, vertical: NeoDimens.px20),
      counterText: '',
      filled: true,
      fillColor: !widget.enabled ? NeoColors.bgMediumDark : NeoColors.colorBaseWhite,
    );
  }

  Widget _buildPrefixElements(NeoTextFormFieldState state) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.dropdownLeft.isNotNull && widget.dropdownLeft!.items.isNotEmpty) _buildLeftDropdown(state).paddingOnly(end: state.hasFocus ? NeoDimens.px16 : NeoDimens.px0),
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
        if (widget.dropdownRight.isNotNull && widget.dropdownRight!.items.isNotEmpty) _buildRightDropdown(state),
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
        iconUrn: state.obscureText! ? NeoAssets.eye.urn : NeoAssets.eyeSlash.urn,
        width: NeoDimens.px20,
        height: NeoDimens.px20,
      ),
    );
  }

  Widget _buildRightDropdown(NeoTextFormFieldState state) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VerticalDivider(
            width: NeoDimens.px0,
            color: NeoColors.borderMediumDark,
            thickness: _Constants.borderThickness,
          ),
          IntrinsicWidth(
            child: NeoDropdownFormField(
              itemList: widget.dropdownRight!.items,
              dataKey: widget.dropdownRight!.dataKey,
              displayMode: NeoDropdownFormFieldDisplayMode.noBorder,
              isHighlighted: !state.error.isNullOrBlank || state.hasFocus,
              dropdownType: widget.dropdownRight!.dropdownType,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftDropdown(NeoTextFormFieldState state) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IntrinsicWidth(
            child: NeoDropdownFormField(
              itemList: widget.dropdownLeft!.items,
              dataKey: widget.dropdownLeft!.dataKey,
              displayMode: NeoDropdownFormFieldDisplayMode.noBorder,
              isHighlighted: !state.error.isNullOrBlank || state.hasFocus,
              dropdownType: widget.dropdownLeft!.dropdownType,
            ),
          ),
          const VerticalDivider(
            width: NeoDimens.px0,
            indent: _Constants.dividerIndent,
            endIndent: _Constants.dividerIndent,
            color: NeoColors.borderMediumDark,
            thickness: _Constants.borderThickness,
          ),
        ],
      ),
    );
  }

  InputBorder _borderBuilder(NeoTextFormFieldState state) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(NeoRadius.px8),
      borderSide: BorderSide(color: !state.error.isNullOrBlank ? NeoColors.textDanger : NeoColors.borderMediumDark),
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
            color: !state.error.isNullOrBlank ? NeoColors.iconDanger : NeoColors.iconDefault,
          ).paddingOnly(end: NeoDimens.px4),
        if (widget.bottomText!.message != null)
          Text(
            widget.bottomText!.message!,
            style: (widget.bottomText!.messageType == NeoTextFormFieldBottomTextMessageType.error && !state.error.isNullOrBlank)
                ? NeoTextStyles.bodyTwelveRegular.apply(color: NeoColors.textDanger)
                : NeoTextStyles.bodyTwelveRegular.apply(color: NeoColors.textSecondary),
          ),
      ],
    );
  }

  Widget _buildSubtitle() {
    return Text(widget.subtitleText, style: NeoTextStyles.bodyTwelveRegular.apply(color: NeoColors.textSecondary));
  }

  Widget _buildTitleRow() {
    return Row(
      children: [
        Text(widget.titleText, style: NeoTextStyles.bodyTwelveMedium).paddingOnly(bottom: NeoDimens.px4, end: NeoDimens.px4),
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
    if (widget.validationRegex != null && RegExp(widget.validationRegex.orEmpty).hasMatch(text.orEmpty)) {
      if (!error.isNullOrBlank) {
        return error;
      }
      return null;
    } else {
      return widget.bottomText?.message;
    }
  }
}
