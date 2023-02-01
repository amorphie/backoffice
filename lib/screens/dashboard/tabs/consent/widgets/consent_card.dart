// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/core/export/_exporter.dart';

class ConsentCard extends StatelessWidget {
  const ConsentCard({
    Key? key,
    required this.date,
    required this.amountOfConsents,
    required this.bankName,
  }) : super(key: key);

  final String bankName, date;
  final int amountOfConsents;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: KC.secondary.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bankName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black87),
                      ),
                      Text(
                        "$amountOfConsents Consent",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                date,
                style: TextStyle(color: Colors.black87, fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}
