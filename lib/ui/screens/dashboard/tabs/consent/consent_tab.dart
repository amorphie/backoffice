import '../../../../../core/export/_.dart';

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
            Expanded(
              child: ListView(
                children: [
                  ConsentCard(
                    bankName: "Burgan",
                    amountOfConsents: 1,
                    date: "19.02.2021",
                    consentIcon: Icons.home_rounded,
                  ),
                  ConsentCard(
                    bankName: "Akbank",
                    amountOfConsents: 1,
                    date: "19.02.2021",
                    consentIcon: Icons.extension_rounded,
                  ),
                  ConsentCard(
                    bankName: "Garanti",
                    amountOfConsents: 2,
                    date: "19.02.2021",
                    consentIcon: Icons.extension_rounded,
                  ),
                  ConsentCard(
                    bankName: "Burgan",
                    amountOfConsents: 1,
                    date: "19.02.2021",
                    consentIcon: Icons.home_rounded,
                  ),
                  ConsentCard(
                    bankName: "Akbank",
                    amountOfConsents: 1,
                    date: "19.02.2021",
                    consentIcon: Icons.extension_rounded,
                  ),
                  ConsentCard(
                    bankName: "Garanti",
                    amountOfConsents: 2,
                    date: "19.02.2021",
                    consentIcon: Icons.extension_rounded,
                  ),
                  ConsentCard(
                    bankName: "Burgan",
                    amountOfConsents: 1,
                    date: "19.02.2021",
                    consentIcon: Icons.home_rounded,
                  ),
                  ConsentCard(
                    bankName: "Akbank",
                    amountOfConsents: 1,
                    date: "19.02.2021",
                    consentIcon: Icons.extension_rounded,
                  ),
                  ConsentCard(
                    bankName: "Garanti",
                    amountOfConsents: 2,
                    date: "19.02.2021",
                    consentIcon: Icons.extension_rounded,
                  ),
                  ConsentCard(
                    bankName: "Burgan",
                    amountOfConsents: 1,
                    date: "19.02.2021",
                    consentIcon: Icons.home_rounded,
                  ),
                  ConsentCard(
                    bankName: "TEB",
                    amountOfConsents: 1,
                    date: "19.02.2021",
                    consentIcon: Icons.extension_rounded,
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
