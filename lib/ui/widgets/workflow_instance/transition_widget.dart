// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:admin/data/models/workflow/instance/workflow_instance_view_model.dart';

import '../../helpers/exporter.dart';

class InstanceTransitionWidget extends StatefulWidget {
  final WorkflowInstanceViewModel view;
  final Function? back;
  final Function(dynamic val) getData;
  final bool loading;
  const InstanceTransitionWidget({
    Key? key,
    required this.view,
    this.back,
    required this.getData,
    required this.loading,
  }) : super(key: key);

  @override
  _InstanceTransitionWidgetState createState() => _InstanceTransitionWidgetState();
}

class _InstanceTransitionWidgetState extends State<InstanceTransitionWidget> {
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
                        switch (widget.view.type) {
                          case TransitionType.formio:
                            WebViewSource webViewSource = WebViewSource.formio(widget.view.body);
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
                            WebViewSource webViewSource = WebViewSource.html(widget.view.body);
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
                              child: RenderWidget(template: json.decode(widget.view.body)),
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
                    if (widget.back != null)
                      CustomButton(
                        title: "Back",
                        tooltip: "Back",
                        onPressed: () async {
                          widget.back!();
                        },
                      ),
                    CustomButton(
                      title: widget.view.name,
                      tooltip: widget.view.name,
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
