// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import '../../helpers/exporter.dart';

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
  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> Function() onSubmit = () async {};
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
                      child: Builder(builder: (context) {
                        switch (widget.data.type) {
                          case TransitionType.formio:
                            WebViewSource webViewSource = WebViewSource.formio(widget.data.form);
                            onSubmit = () async {
                              await webViewSource.callJsMethod!("onSubmit", []);
                            };
                            return WebViewWidget(
                              source: webViewSource,
                              onSubmit: (msg) {
                                var data = jsonDecode(msg);
                                widget.getData(data);
                              },
                              onError: (msg) {
                                log(msg);
                              },
                            );
                          case TransitionType.html:
                            WebViewSource webViewSource = WebViewSource.html(widget.data.form);
                            onSubmit = () async {
                              await webViewSource.callJsMethod!("onSubmit", []);
                            };
                            return WebViewWidget(
                              source: webViewSource,
                              onSubmit: (msg) {
                                var data = jsonDecode(msg);
                                widget.getData(data);
                              },
                              onError: (msg) {
                                log(msg);
                              },
                            );
                          case TransitionType.flutterWidget:
                            onSubmit = () async {
                              var data = jsonWidgetRegistry.values;
                              final BuildContext context = jsonWidgetRegistry.getValue("form_context");

                              final valid = Form.of(context).validate();
                              jsonWidgetRegistry.setValue('form_validation', valid);
                              Map<String, dynamic> d = {};
                              for (var element in data.keys) {
                                var item = data[element];
                                if (item is! Key && item is! BuildContext) {
                                  log("$element => ${data[element]}", name: "LOG");
                                  d.addAll({element: item});
                                }
                              }
                              widget.getData(d);
                            };
                            return SizedBox(
                              height: double.maxFinite,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: RenderWidget(template: json.decode(widget.data.form)),
                            );

                          default:
                            return Container();
                        }
                      })),
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
                        await onSubmit();
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
