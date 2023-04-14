import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webviewx/webviewx.dart';

class FormioPage extends StatefulWidget {
  const FormioPage({
    Key? key,
  }) : super(key: key);

  @override
  _FormioPageState createState() => _FormioPageState();
}

late WebViewXController webviewController;

class _FormioPageState extends State<FormioPage> {
  Size get screenSize => MediaQuery.of(context).size;

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.2),
                ),
                child: _buildWebViewX(),
              ),
            ),
            TextButton(
                onPressed: () async {
                  var d = await webviewController.callJsMethod("onSubmit", []);

                  print(d);
                },
                child: Text("onSubmit")),
          ],
        ),
      ),
    );
  }

  Widget _buildWebViewX() {
    return WebViewX(
      key: const ValueKey('formio'),
      initialContent: content,
      initialSourceType: SourceType.html,
      height: double.maxFinite,
      width: double.maxFinite,
      // height: screenSize.height / 1.3,
      // width: min(screenSize.width * 0.8, 1024),
      onWebViewCreated: (controller) {
        return webviewController = controller;
      },
      dartCallBacks: {
        DartCallback(
          name: 'submit',
          callBack: (msg) {
            Get.snackbar("GetData", msg);
          },
        )
      },
    );
  }

  String get content => initialContent("""
          {
            components: [
                {
                    type: 'textfield',
                    key: 'firstName',
                    label: 'First Name',
                    placeholder: 'Enter your first name.',
                    input: true,
                    tooltip: 'Enter your <strong>First Name</strong>',
                    description: 'Enter your <strong>First Name</strong>'
                },
                {
                    type: 'textfield',
                    key: 'lastName',
                    label: 'Last Name',
                    placeholder: 'Enter your last name',
                    input: true,
                    tooltip: 'Enter your <strong>Last Name</strong>',
                    description: 'Enter your <strong>Last Name</strong>'
                },
                {
                    type: "select",
                    label: "Favorite Things",
                    key: "favoriteThings",
                    placeholder: "These are a few of your favorite things...",
                    data: {
                        values: [
                            {
                                value: "raindropsOnRoses",
                                label: "Raindrops on roses"
                            },
                            {
                                value: "whiskersOnKittens",
                                label: "Whiskers on Kittens"
                            },
                            {
                                value: "brightCopperKettles",
                                label: "Bright Copper Kettles"
                            },
                            {
                                value: "warmWoolenMittens",
                                label: "Warm Woolen Mittens"
                            }
                        ]
                    },
                    dataSrc: "values",
                    template: "<span>{{ item.label }}</span>",
                    multiple: true,
                    input: true
                }
            ]
        }
""");

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
    <div id="formio"></div>
    <script>
        var fr;
        Formio.icons = 'fontawesome';
        Formio.createForm(document.getElementById('formio'),
            $json
        ).then(function (form) {
            fr = form;
        });

        function onSubmit() {
            submit(JSON.stringify(fr.data));
            return JSON.stringify(fr.data);
        }
    </script>
</body>

</html>
""";
}
