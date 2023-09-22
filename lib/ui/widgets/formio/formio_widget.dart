// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

import '../indicator.dart';

class FormioWidget extends StatefulWidget {
  final String schema;
  final bool loading;
  const FormioWidget({
    Key? key,
    required this.schema,
    this.loading = false,
  }) : super(key: key);

  @override
  _FormioWidgetState createState() => _FormioWidgetState();
}

class _FormioWidgetState extends State<FormioWidget> {
  late WebViewXController webviewController;

  @override
  void dispose() {
    webviewController.dispose();
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
                    child: _buildWebViewX(widget.schema),
                  ),
                ),
                SizedBox(height: 5),
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

  Widget _buildWebViewX(String schema) {
    return WebViewX(
      key: const ValueKey('formio'),
      initialContent: initialContent(schema),
      initialSourceType: SourceType.html,
      height: double.maxFinite,
      width: MediaQuery.of(context).size.width * 0.7,

      // height: screenSize.height / 1.3,
      // width: min(screenSize.width * 0.8, 1024),
      onWebViewCreated: (controller) {
        return webviewController = controller;
      },
    );
  }

  String initialContent(String json) => """
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.form.io/formiojs/formio.full.min.css">
    <script src="https://cdn.form.io/formiojs/formio.full.min.js"></script>
</head>

<body>
    <div id="formio" style="padding: 40px;"></div>
    <script>
        var fr;
        Formio.icons = 'fontawesome';
        Formio.createForm(document.getElementById('formio'),
            $json
        ).then(function (form) {
            fr = form;
        });

    </script>
</body>

</html>
""";
}
