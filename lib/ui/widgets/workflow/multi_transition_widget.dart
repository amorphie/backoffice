// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:admin/data/models/workflow/state_manager_model.dart';
import 'package:admin/data/models/workflow/transition_model.dart';
import 'package:admin/data/models/workflow/transition_type.dart';
import 'package:admin/ui/widgets/custom_button.dart';
import 'package:admin/ui/widgets/render/render_widget.dart';
import 'package:admin/ui/widgets/web_view/web_view_widget.dart';
import 'package:flutter/material.dart';

import '../indicator.dart';

class MultiTransitionWidget extends StatefulWidget {
  final StateManager data;
  final Function(dynamic val, TransitionModel transition) getData;
  final bool isBack;
  final bool loading;
  const MultiTransitionWidget({
    Key? key,
    required this.data,
    required this.getData,
    required this.loading,
    this.isBack = false,
  }) : super(key: key);

  @override
  _MultiTransitionWidgetState createState() => _MultiTransitionWidgetState();
}

class _MultiTransitionWidgetState extends State<MultiTransitionWidget> {
  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> Function(TransitionModel) onSubmit = (val) async {};
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
                    child: _formView(),
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
                    ...widget.data.transitions!
                        .map(
                          (e) => CustomButton(
                            title: e.title,
                            tooltip: e.title,
                            onPressed: () async {
                              await onSubmit(e);
                            },
                          ),
                        )
                        .toList(),
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

  Widget _formView() {
    TransitionModel sendTransition = widget.data.transitions!.first;
    switch (widget.data.transitions!.first.type) {
      case TransitionType.formio:
        WebViewSource webViewSource = WebViewSource.formio(widget.data.publicForm!);
        onSubmit = (t) async {
          sendTransition = t;
          await webViewSource.callJsMethod!("onSubmit", []);
        };
        return WebViewWidget(
          source: webViewSource,
          onSubmit: (msg) {
            var data = jsonDecode(msg);
            widget.getData(data, sendTransition);
          },
          onError: (msg) {
            log(msg);
          },
        );
      case TransitionType.html:
        WebViewSource webViewSource = WebViewSource.html(widget.data.publicForm!);
        onSubmit = (t) async {
          sendTransition = t;

          await webViewSource.callJsMethod!("onSubmit", []);
        };
        return WebViewWidget(
          source: webViewSource,
          onSubmit: (msg) {
            var data = jsonDecode(msg);
            widget.getData(data, sendTransition);
          },
          onError: (msg) {
            log(msg);
          },
        );
      case TransitionType.flutterWidget:
        onSubmit = (t) async {
          sendTransition = t;

          var data = jsonWidgetRegistry.values;
          final BuildContext context = jsonWidgetRegistry.getValue("form_context");

          final valid = Form.of(context).validate();
          jsonWidgetRegistry.setValue('form_validation', valid);

          for (var element in data.keys) {
            var item = data[element];
            if (item is! Key && item is! BuildContext) {
              log("$element => ${data[element]}", name: "LOG");
            }
          }
          widget.getData(data, sendTransition);
        };
        return SizedBox(
          height: double.maxFinite,
          width: MediaQuery.of(context).size.width * 0.7,
          child: RenderWidget(template: json.decode(widget.data.publicForm!)),
        );

      default:
        return Container();
    }
  }
}
