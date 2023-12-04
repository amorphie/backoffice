// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../helpers/exporter.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String? tooltip;
  final Function onPressed;
  const CustomButton({
    Key? key,
    required this.title,
    this.tooltip,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: KC.primary, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: TextButton(
            onPressed: () {
              onPressed();
            },
            child: Tooltip(
                message: tooltip ?? title,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ))),
      ),
    );
  }
}
