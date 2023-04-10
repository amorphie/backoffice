import '../../../../../core/export/_.dart';

class TokenTab extends StatelessWidget {
  const TokenTab({
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
            Expanded(
              child: ListView(
                children: [
                  WorkflowCard(
                    infoText: "Acces Token",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Refresh Token",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Refresh Token",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Acces Token",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Acces Token",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Refresh Token",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Acces Token",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Acces Token",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Acces Token",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Refresh Token",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Acces Token",
                    date: "19.02.2021",
                  ),
                  WorkflowCard(
                    infoText: "Acces Token",
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
