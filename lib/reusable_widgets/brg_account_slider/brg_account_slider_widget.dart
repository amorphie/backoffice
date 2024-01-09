import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/core/localization/localizable_text.dart';

// STOPSHIP: Delete this widget
// ignore: must_be_immutable
class BrgAccountSliderWidget extends StatelessWidget {
  BrgAccountSliderWidget({
    required this.openingDate,
    required this.accountBalance,
    required this.availableBalance,
    required this.iban,
    required this.branchDetails,
    Key? key,
  }) : super(key: key);

  final String openingDate;
  final String accountBalance;
  final String availableBalance;
  final String iban;
  final String branchDetails;

  // STOPSHIP: Delete it
  bool isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isFlipped = !isFlipped;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildMainAccountRow(),
                _buildAccountBalanceRow(),
                _buildAvailableBalanceRow(),
                _buildIbanRow(),
                _buildIbanDetailsRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainAccountRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          const LocalizableText(tr: "Ana Hesap", en: "Main Account", ar: "الحساب الرئيسي").localize(),
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Column(
          children: [
            Text(
              const LocalizableText(tr: "Açılış Tarihi", en: "Opening Date", ar: "تاريخ الافتتاح").localize(),
              style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 14),
            ),
            Text(
              openingDate,
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAccountBalanceRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            const LocalizableText(tr: "Hesap Bakiyesi", en: "Account Balance", ar: "رصيد الحساب").localize(),
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          Text(accountBalance, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildAvailableBalanceRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            const LocalizableText(tr: "Kullanılabilir Bakiye", en: "Available Balance", ar: "الرصيد المتاح").localize(),
            style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 14),
          ),
          Text(
            availableBalance,
            style: TextStyle(color: Colors.white.withAlpha(180), fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildIbanRow() {
    return Row(
      children: [
        Text(iban, style: const TextStyle(color: Colors.white, fontSize: 17)),
        const Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Icon(Icons.ios_share, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildIbanDetailsRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Text(branchDetails, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}
