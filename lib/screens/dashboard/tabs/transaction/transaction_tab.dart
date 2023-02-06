import 'package:admin/screens/dashboard/tabs/transaction/widgets/transaction_card.dart';

import '../../../../core/export/_.dart';

class TransactionTab extends StatelessWidget {
  const TransactionTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Align(
            //   alignment: Alignment.center,
            //   child: Text(
            //     "Transactions",
            //     textAlign: TextAlign.left,
            //     style: TextStyle(
            //         color: Colors.black87,
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            Expanded(
              child: ListView(
                children: [
                  TransactionCard(
                      cardColor: Colors.redAccent, title: "Withdraw"),
                  TransactionCard(cardColor: KC.primary, title: "Income"),
                  TransactionCard(cardColor: KC.primary, title: "Income"),
                  TransactionCard(
                      cardColor: Colors.redAccent, title: "Withdraw"),
                  TransactionCard(
                      cardColor: Colors.redAccent, title: "Withdraw"),
                  TransactionCard(cardColor: KC.primary, title: "Income"),
                  TransactionCard(cardColor: KC.primary, title: "Income"),
                  TransactionCard(
                      cardColor: Colors.redAccent, title: "Withdraw"),
                  TransactionCard(
                      cardColor: Colors.redAccent, title: "Withdraw"),
                  TransactionCard(cardColor: KC.primary, title: "Income"),
                  TransactionCard(cardColor: KC.primary, title: "Income"),
                  TransactionCard(
                      cardColor: Colors.redAccent, title: "Withdraw"),
                  TransactionCard(
                      cardColor: Colors.redAccent, title: "Withdraw"),
                  TransactionCard(cardColor: KC.primary, title: "Income"),
                  TransactionCard(cardColor: KC.primary, title: "Income"),
                  TransactionCard(
                      cardColor: Colors.redAccent, title: "Withdraw"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
