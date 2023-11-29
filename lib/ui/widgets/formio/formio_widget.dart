// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../helpers/exporter.dart';

class FormioWidget extends StatefulWidget {
  final String schema;
  final bool loading;
  final bool withBackButton;
  const FormioWidget({
    Key? key,
    required this.schema,
    this.loading = false,
    this.withBackButton = true,
  }) : super(key: key);

  @override
  _FormioWidgetState createState() => _FormioWidgetState();
}

class _FormioWidgetState extends State<FormioWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2),
                    ),
                    child: WebViewWidget(
                      source: WebViewSource.formio(widget.schema),
                    ),
                  ),
                ),
                if (widget.withBackButton) SizedBox(height: 5),
                if (widget.withBackButton)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        title: "Back",
                        tooltip: "Back",
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
          if (widget.loading) AppIndicator(),
        ],
      ),
    );
  }
}
