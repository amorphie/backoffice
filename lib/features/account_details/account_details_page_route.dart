import 'package:flutter/material.dart';
import 'package:backoffice/features/account_details/account_details_page.dart';

@immutable
class AccountDetailsPageRoute extends StatelessWidget {
  const AccountDetailsPageRoute({
    super.key,
    this.arguments,
  });

  final Map<String, String>? arguments;

  @override
  Widget build(BuildContext context) {
    return AccountDetailsPage(
      iban: arguments?["iban"] ?? "",
      queryParam1: arguments?["param1"],
    );
  }
}
