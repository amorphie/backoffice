import 'package:admin/ui/screens/dashboard/tabs/history/widgets/history_card.dart';

import '../../../../../core/export/_.dart';

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
            // Align(
            //   alignment: Alignment.center,
            //   child: Text(
            //     "History",
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
                  HistoryCard(
                    title: "FlowRetailLoan.LoanApply Başlangıç -> Bitiş",
                    subtitle: "EBT/U05151 31/01/2023 12:21",
                  ),
                  HistoryCard(
                    title: "FlowRetailLoan.AutoSmsOtp Başvuru -> Smsotp",
                    subtitle: "EBT/U05151 14/05/2022 13:13",
                  ),
                  HistoryCard(
                    title: "FlowRetailLoan.ValidateOtp Smsotp -> Smsotp",
                    subtitle: "EBT/U05151 7/01/2023 12:04",
                  ),
                  HistoryCard(
                    title: "FlowRetailLoan.LoanApply Başlangıç -> Bitiş",
                    subtitle: "EBT/U05151 31/01/2023 12:21",
                  ),
                  HistoryCard(
                    title: "FlowRetailLoan.AutoSmsOtp Başvuru -> Smsotp",
                    subtitle: "EBT/U05151 14/05/2022 13:13",
                  ),
                  HistoryCard(
                    title: "FlowRetailLoan.ValidateOtp Smsotp -> Smsotp",
                    subtitle: "EBT/U05151 7/01/2023 12:04",
                  ),
                  HistoryCard(
                    title: "FlowRetailLoan.LoanApply Başlangıç -> Bitiş",
                    subtitle: "EBT/U05151 31/01/2023 12:21",
                  ),
                  HistoryCard(
                    title: "FlowRetailLoan.AutoSmsOtp Başvuru -> Smsotp",
                    subtitle: "EBT/U05151 14/05/2022 13:13",
                  ),
                  HistoryCard(
                    title: "FlowRetailLoan.ValidateOtp Smsotp -> Smsotp",
                    subtitle: "EBT/U05151 7/01/2023 12:04",
                  ),
                  HistoryCard(
                    title:
                        "FlowRetailLoan.AutoComplateOtp Data -> Değerlendirme",
                    subtitle: "EBT/U05151 13/03/2023 11:02",
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
