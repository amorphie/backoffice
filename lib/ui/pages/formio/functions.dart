import 'package:admin/ui/pages/formio/formio.dart';
import 'package:get/get.dart';
import 'package:webviewx/webviewx.dart';

final executeJsErrorMessage = 'Failed to execute this task because the current content is (probably) URL that allows iframe embedding, on Web.\n\n'
    'A short reason for this is that, when a normal URL is embedded in the iframe, you do not actually own that content so you cant call your custom functions\n'
    '(read the documentation to find out why).';

final initialContent = '''<!DOCTYPE html>
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
        Formio.icons = 'fontawesome';
        Formio.createForm(document.getElementById('formio'), {
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
                },
                {
                    type: 'button',
                    action: 'submit',
                    label: 'Submit',
                    theme: 'primary'
                }
            ]
        }).then(function (form) {
            form.on('submit', function (submission) {
                console.log("eto");
            });
        });
    </script>
</body>

</html>''';

void _setUrl() {
  webviewController.loadContent(
    'https://portal.form.io/#/project/64213f7b4eb00159cde1a21f/overview',
    SourceType.url,
  );
}

void _setUrlBypass() {
  webviewController.loadContent(
    'https://portal.form.io/#/project/64213f7b4eb00159cde1a21f/overview',
    SourceType.urlBypass,
  );
}

Future<void> _getWebviewContent() async {
  try {
    final content = await webviewController.getContent();
    Get.showSnackbar(GetSnackBar(
      title: content.source,
    ));
  } catch (e) {
    Get.showSnackbar(GetSnackBar(
      title: 'Failed to execute this task',
    ));
  }
}

void _setHtml() {
  webviewController.loadContent(
    initialContent,
    SourceType.html,
  );
}

void _setHtmlFromAssets() {
  webviewController.loadContent(
    'assets/test.html',
    SourceType.html,
    fromAssets: true,
  );
}

Future<void> _goForward() async {
  if (await webviewController.canGoForward()) {
    await webviewController.goForward();
    Get.showSnackbar(GetSnackBar(
      title: 'Forwared',
    ));
  } else {
    Get.showSnackbar(GetSnackBar(
      title: 'Cannot go forward',
    ));
  }
}

Future<void> _goBack() async {
  if (await webviewController.canGoBack()) {
    await webviewController.goBack();
    Get.showSnackbar(GetSnackBar(
      title: 'Back',
    ));
  } else {
    Get.showSnackbar(GetSnackBar(
      title: 'Cannot go back',
    ));
  }
}

void _reload() {
  webviewController.reload();
}

void _toggleIgnore() {
  final ignoring = webviewController.ignoresAllGestures;
  webviewController.setIgnoreAllGestures(!ignoring);
  Get.showSnackbar(GetSnackBar(
    title: 'Ignore events = ${!ignoring}',
  ));
}
