import '../../../../core/export/_exporter.dart';

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
            Align(
              alignment: Alignment.center,
              child: Text(
                "Transactions",
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
                  listItem(Colors.redAccent, Icons.arrow_circle_down_outlined,
                      "BURGAN", "Withdraw"),
                  listItem(Colors.teal, Icons.arrow_circle_up_outlined,
                      "AKBANK", "Deposit"),
                  listItem(Colors.teal, Icons.arrow_circle_up_outlined, "TEB",
                      "Deposit"),
                  listItem(Colors.redAccent, Icons.arrow_circle_down_outlined,
                      "TEB", "Withdraw"),
                  listItem(Colors.teal, Icons.arrow_circle_up_outlined,
                      "Garanti", "Deposit"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ExpansionTile listItem(
      Color color, IconData icon, String bank, String process) {
    return ExpansionTile(
      initiallyExpanded: false,
      textColor: Colors.black54,
      iconColor: Colors.black54,
      collapsedTextColor: Colors.black87,
      collapsedIconColor: Colors.black87,
      title: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          SizedBox(width: 10),
          Text(process),
        ],
      ),
      children: <Widget>[
        HoverWidget(
          onHover: (a) {},
          hoverChild: GestureDetector(
            onTap: (() {}),
            child: ListTile(
              title: Text(
                "19.05.2022",
                style: TextStyle(color: KC.primary),
              ),
            ),
          ),
          child: ListTile(
            title: Text(
              bank,
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }
}
