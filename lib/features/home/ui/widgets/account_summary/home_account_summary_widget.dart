import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/localization/localizable_text.dart';
import 'package:backoffice/features/home/ui/widgets/account_summary/bloc/home_account_summary_widget_bloc.dart';
import 'package:backoffice/features/home/ui/widgets/account_summary/home_account_summary_widget_ui_model.dart';
import 'package:skeletons/skeletons.dart';

class HomeAccountSummaryWidget extends StatelessWidget {
  const HomeAccountSummaryWidget({required this.iban, Key? key}) : super(key: key);

  final String iban;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeAccountSummaryWidgetBloc()..add(HomeAccountSummaryWidgetEventFetchComponentDetails(iban)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<HomeAccountSummaryWidgetBloc, HomeAccountSummaryWidgetState>(
              builder: (context, state) {
                switch (state) {
                  case HomeAccountSummaryWidgetStateLoading _:
                    return _buildSkeletonLoading();
                  case AccountSummaryWidgetStateLoaded _:
                    return _buildComponents(state.uiModel, context);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkeletonLoading() {
    const itemCount = 6;
    return SizedBox(
      height: 200,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (context, index) => SkeletonItem(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkeletonLine(
                  style: SkeletonLineStyle(
                    width: 120 + index * itemCount * (pow(-1, index).toDouble()),
                    height: 16,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SkeletonLine(
                  style: SkeletonLineStyle(width: 40, height: 16, borderRadius: BorderRadius.circular(8)),
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SkeletonLine(
              style: SkeletonLineStyle(height: 1, borderRadius: BorderRadius.circular(8)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildComponents(HomeAccountSummaryWidgetUIModel uiModel, BuildContext context) {
    return Column(
      children: [
        _buildRowItem(
          key: const LocalizableText(tr: "Kullanılabilir Limit", en: "Available Limit", ar: "الحد المتاح").localize(),
          value: uiModel.availableLimit,
        ),
        _buildDivider(),
        _buildRowItem(
          key: const LocalizableText(tr: "Toplam Limit", en: "Total Limit", ar: "الحد الإجمالي").localize(),
          value: uiModel.totalLimit,
        ),
        _buildDivider(),
        _buildRowItem(
          key: const LocalizableText(tr: "Güncel Borç", en: "Current Dept", ar: "الدين الحالي").localize(),
          value: uiModel.currentDebt,
        ),
        _buildDivider(),
        _buildRowItem(
          key: const LocalizableText(
            tr: "Hesap Açılış Tarihi",
            en: "Account Opening Date",
            ar: "تاريخ فتح الحساب",
          ).localize(),
          value: uiModel.accountOpeningDate,
        ),
        _buildDivider(),
        _buildRowItem(
          key: const LocalizableText(
            tr: "Aylık Faiz Oranı",
            en: "Monthly Interest Rate",
            ar: "معدل الفائدة الشهري",
          ).localize(),
          value: uiModel.monthlyInterestRate,
        ),
        _buildDivider(),
        _buildRowItem(
          key: const LocalizableText(
            tr: "Yıllık Faiz Oranı",
            en: "Yearly Interest Rate",
            ar: "معدل الفائدة السنوي",
          ).localize(),
          value: uiModel.yearlyInterestRate,
        ),
        _buildDivider(),
        _buildRowItem(key: "Is Flipped", value: context.read<HomeAccountSummaryWidgetBloc>().isFlipped.toString()),
      ],
    );
  }

  Widget _buildRowItem({required String key, required String value}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(key),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        color: Colors.grey,
        width: double.infinity,
        height: 1,
      ),
    );
  }
}
