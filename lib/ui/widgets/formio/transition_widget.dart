// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:admin/data/models/workflow/transition_model.dart';
import 'package:admin/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

import '../indicator.dart';

class TransitionWidget extends StatefulWidget {
  final TransitionModel data;
  final Function(dynamic val) getData;
  final bool isBack;
  final bool loading;
  const TransitionWidget({
    Key? key,
    required this.data,
    required this.getData,
    required this.loading,
    this.isBack = false,
  }) : super(key: key);

  @override
  _TransitionWidgetState createState() => _TransitionWidgetState();
}

class _TransitionWidgetState extends State<TransitionWidget> {
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
                    child: _buildWebViewX(widget.data),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.isBack)
                      CustomButton(
                        title: "Back",
                        tooltip: "Back",
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    CustomButton(
                      title: widget.data.title,
                      tooltip: widget.data.title,
                      onPressed: () async {
                        await webviewController.callJsMethod("onSubmit", []);
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

  Widget _buildWebViewX(TransitionModel transition) {
    return WebViewX(
      key: const ValueKey('formio'),
      initialContent: initialContent(transition.form),
      initialSourceType: SourceType.html,
      height: double.maxFinite,
      width: MediaQuery.of(context).size.width * 0.7,
      onWebViewCreated: (controller) {
        return webviewController = controller;
      },
      dartCallBacks: {
        DartCallback(
          name: 'submit',
          callBack: (msg) {
            var data = jsonDecode(msg);
            widget.getData(data);
          },
        ),
        DartCallback(
          name: 'error',
          callBack: (error) {
            log(error);
          },
        )
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

        function onSubmit() {
          
            fr.submit().then(
                function (value) { 
                    submit(JSON.stringify(value.data));
                    return JSON.stringify(value.data);
                 },
                function (err) { 
                    error(err);
                    return err;
                }
            );

        }
    </script>
</body>

</html>
""";
}
