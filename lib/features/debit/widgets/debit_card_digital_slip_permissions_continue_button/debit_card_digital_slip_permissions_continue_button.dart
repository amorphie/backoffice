import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_button/neo_button.dart';
import 'package:backoffice/util/wf_data_bus_key.dart';
import 'package:backoffice/workflow_widgets/wf_transaction_summary_list/models/wf_transaction_summary_item_model.dart';
import 'package:backoffice/workflow_widgets/wf_transaction_summary_list/models/wf_transaction_summary_list_ui_model.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

abstract class _Constants {
  static const digitalSlipSelection = "digitalSlipType";
  static const digitalSlipAllOperation = 0;
  static const digitalSlipContactlessUsage = 1;
  static const digitalSlipNever = 2;
}

class DebitCardDigitalSlipPermissionsContinueButton extends NeoButton {
  const DebitCardDigitalSlipPermissionsContinueButton({
    super.transitionId,
    super.labelText,
    super.padding,
    super.formValidationRequired,
    super.size,
    super.key,
  });

  @override
  Map<String, dynamic> getDefaultTransitionParams(BuildContext context) {
    final formData = context.read<WorkflowFormBloc>().formData;
    return {...super.getDefaultTransitionParams(context), ...getDigitalSlipSummaryParams(formData)};
  }

  Map<String, Map<String, dynamic>> getDigitalSlipSummaryParams(Map<String, dynamic> formData) {
    final digitalSlipTypeIndex = formData[_Constants.digitalSlipSelection];

    String? digitalSlipType;

    switch (digitalSlipTypeIndex) {
      case _Constants.digitalSlipAllOperation:
        digitalSlipType = "debitCard_settings_digitalSlip_allOperation_button";
      case _Constants.digitalSlipContactlessUsage:
        digitalSlipType = "debitCard_settings_digitalSlip_contactlessUsage_button";
      case _Constants.digitalSlipNever:
        digitalSlipType = "debitCard_settings_digitalSlip_never_button";
    }

    return {
      WfDataBusKey.transactionSummaryListUiModel: WfTransactionSummaryListUiModel(
        itemList: [
          WfTransactionSummaryItemModel(
            title: LocalizationKey.debitCardSettingsDigitalSlipTitle.loc(),
            value: digitalSlipType ?? "",
          ),
        ],
      ).toJson(),
    };
  }
}
