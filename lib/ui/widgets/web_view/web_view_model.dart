// ignore_for_file: public_member_api_docs, sort_constructors_first
enum _WebViewSourceType { html, url, formio }

class WebViewSource {
  _WebViewSourceType _sourceType = _WebViewSourceType.html;
  String source;
  Future<dynamic> Function(String name, List<dynamic> params)? callJsMethod;

  WebViewSource({required this.source, this.callJsMethod});
  factory WebViewSource.html(String data) => WebViewSource(source: data);
  factory WebViewSource.url(String url) => WebViewSource(source: url);
  factory WebViewSource.formio(String data) => WebViewSource(source: _formioContent(data));

  bool get isHtml => _sourceType == _WebViewSourceType.html;
  bool get isUrl => _sourceType == _WebViewSourceType.url;
  bool get isFormio => _sourceType == _WebViewSourceType.formio;
}

String _formioContent(String json) => """
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
