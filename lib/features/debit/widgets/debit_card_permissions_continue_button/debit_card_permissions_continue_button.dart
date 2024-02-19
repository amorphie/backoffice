import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_account_selection/models/neo_account_selection_response_data.dart';
import 'package:backoffice/reusable_widgets/neo_address_selection/models/neo_address_selection_response_data.dart';
import 'package:backoffice/reusable_widgets/neo_button/neo_button.dart';
import 'package:backoffice/util/wf_data_bus_key.dart';
import 'package:backoffice/workflow_widgets/wf_transaction_summary_list/models/wf_transaction_summary_item_model.dart';
import 'package:backoffice/workflow_widgets/wf_transaction_summary_list/models/wf_transaction_summary_list_ui_model.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

abstract class _Constants {
  static const nameOnCardKey = "firstLineOnCard";
  static const accountsKey = "accounts";
  static const deliveryAddressKey = "deliveryAddress";
  static const abroadUseKey = "abroadUse";
  static const phoneDomesticUseKey = "phoneDomesticUse";
  static const internetDomesticUseKey = "internetDomesticUse";
}

class DebitCardPermissionsContinueButton extends NeoButton {
  const DebitCardPermissionsContinueButton({
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

    return {...super.getDefaultTransitionParams(context), ...getCardApplicationSummaryParams(formData)};
  }

  Map<String, Map<String, dynamic>> getCardApplicationSummaryParams(Map<String, dynamic> formData) {
    final nameOnCard = formData[_Constants.nameOnCardKey];
    final accounts = formData[_Constants.accountsKey];
    final deliveryAddress = formData[_Constants.deliveryAddressKey];
    final abroadUse = formData[_Constants.abroadUseKey];
    final phoneDomesticUse = formData[_Constants.phoneDomesticUseKey];
    final internetDomesticUse = formData[_Constants.internetDomesticUseKey];

    return {
      WfDataBusKey.transactionSummaryListUiModel: WfTransactionSummaryListUiModel(
        itemList: [
          WfTransactionSummaryItemModel(
            title: LocalizationKey.debitCardApplicationNameOnCardLabel.loc(),
            value: nameOnCard ?? '',
          ),
          WfTransactionSummaryItemModel(
            title: LocalizationKey.debitCardApplicationIbanLabel.loc(),
            value: accounts is List && accounts.isNotEmpty ? NeoAccountSelectionResponseData.fromJson(accounts[0]).iban ?? '' : '',
          ),
          WfTransactionSummaryItemModel(
            title: LocalizationKey.debitCardApplicationAbroadUseLabel.loc(),
            value: abroadUse is bool && abroadUse ? LocalizationKey.generalYesText.loc() : LocalizationKey.generalNoButton.loc(),
          ),
          WfTransactionSummaryItemModel(
            title: LocalizationKey.debitCardApplicationMotoLabel.loc(),
            value: phoneDomesticUse is bool && phoneDomesticUse ? LocalizationKey.generalYesText.loc() : LocalizationKey.generalNoButton.loc(),
          ),
          WfTransactionSummaryItemModel(
            title: LocalizationKey.debitCardApplicationInternetUseLabel.loc(),
            value: internetDomesticUse is bool && internetDomesticUse ? LocalizationKey.generalYesText.loc() : LocalizationKey.generalNoButton.loc(),
          ),
          WfTransactionSummaryItemModel(
            title: LocalizationKey.debitCardApplicationCardDeliveryAddressLabel.loc(),
            value: deliveryAddress != null ? NeoAddressSelectionResponseData.fromJson(deliveryAddress).fullAddressInfo ?? '' : '',
          ),
        ],
      ).toJson(),
    };
  }
}
