// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../helpers/exporter.dart';

class PopupTemplate extends StatelessWidget {
  final String? title;
  final bool loading;
  final Function close;
  final Widget child;
  const PopupTemplate({
    Key? key,
    this.title = "",
    this.loading = false,
    required this.close,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) return AppIndicator();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AlertDialog(
        actionsPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        buttonPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Container(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              // Text(
              //   controller.model.?.title ?? "",
              //   style: TextStyle(color: KC.primary, fontWeight: FontWeight.bold),
              // ),
              IconButton(
                  onPressed: () async {
                    close();
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: KC.primary,
                  ))
            ],
          ),
        ),
        content: child,
      ),
    );
  }
}
