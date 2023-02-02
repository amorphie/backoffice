// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../core/export/_.dart';

class TransactionCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  const TransactionCard({
    Key? key,
    required this.cardColor,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
        onHover: (a) {},
        hoverChild: GestureDetector(
            onTap: (() {}),
            child: Container(
              margin: EdgeInsets.only(top: 14),
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: cardColor),
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
                                "Click for details",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Content Text",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "10/05/2021",
                        style: TextStyle(color: Colors.black87, fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            )),
        child: Container(
          margin: EdgeInsets.only(top: 14),
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: cardColor,
            border: Border.all(width: 2, color: cardColor),
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
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Content Text",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "10/05/2021",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
