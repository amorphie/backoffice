import 'package:admin/screens/dashboard/tabs/workflow/widgets/workflow_card.dart';

import '../../../../core/export/_.dart';

class WorkflowTab extends StatelessWidget {
  const WorkflowTab({
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
            //     "Workflow",
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
                  WorkflowCard(
                    infoText: "Reset Password",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Changed Tag",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Added New Consent",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Reset Password",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Changed Tag",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Added New Consent",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Reset Password",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Changed Tag",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Added New Consent",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Reset Password",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Changed Tag",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Added New Consent",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
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
