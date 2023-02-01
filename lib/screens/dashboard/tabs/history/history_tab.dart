import 'package:admin/screens/dashboard/tabs/history/widgets/history_card.dart';

import '../../../../core/export/_exporter.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({
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
            Align(
              alignment: Alignment.center,
              child: Text(
                "Workflow",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  HistoryCard(
                    infoText: "Reset Password",
                    date: "19.02.2021",
                  ),
                  HistoryCard(
                    infoText: "Changed Tag",
                    date: "19.02.2021",
                  ),
                  HistoryCard(
                    infoText: "Added New Consent",
                    date: "19.02.2021",
                  ),
                  HistoryCard(
                    infoText: "Status Changed to Active",
                    date: "19.02.2021",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
