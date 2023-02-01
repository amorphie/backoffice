import '../../../../core/export/_exporter.dart';

class ConsentTab extends StatelessWidget {
  const ConsentTab({
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
            SizedBox(height: 14),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Consents",
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
                  ConsentCard(
                    bankName: "Burgan Bank",
                    amountOfConsents: 1,
                    date: "19.02.2021",
                  ),
                  ConsentCard(
                    bankName: "Akbank",
                    amountOfConsents: 1,
                    date: "19.02.2021",
                  ),
                  ConsentCard(
                    bankName: "Garanti",
                    amountOfConsents: 2,
                    date: "19.02.2021",
                  ),
                  ConsentCard(
                    bankName: "Garanti",
                    amountOfConsents: 2,
                    date: "19.02.2021",
                  ),
                  ConsentCard(
                    bankName: "Garanti",
                    amountOfConsents: 2,
                    date: "19.02.2021",
                  ),
                  ConsentCard(
                    bankName: "TEB",
                    amountOfConsents: 1,
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
