// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:backoffice/backoffice/widgets/neo_web_view/neo_web_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

import '../../core/bo_transition_type_enum.dart';
import '../../widgets/neo_bo_button/neo_bo_button.dart';

class BackofficeTransitionPage extends StatelessWidget {
  final BoTransitionType type;
  final String data;
  final String transitionId;
  const BackofficeTransitionPage({
    Key? key,
    required this.type,
    required this.data,
    required this.transitionId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case BoTransitionType.FlutterWidget:
        return JsonWidgetData.fromDynamic(jsonDecode(data)).build(context: context);
      case BoTransitionType.Formio:
        return _webViewPage(context, WebViewSource.formio(data));
      case BoTransitionType.Html:
        return _webViewPage(context, WebViewSource.html(data));
    }
  }

  Widget _webViewPage(BuildContext context, WebViewSource source) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: NeoWebView(
              source: source,
              onSubmit: (transitionParams) {
                postWorkflowTransition(context, json.decode(transitionParams));
              },
            ),
          ),
          NeoBoButton(
            onTap: () async {
              await source.callJsMethod!("onSubmit", []);
            },
            labelText: "Send",
            transitionId: transitionId,
          ),
        ],
      ),
    );
  }

  postWorkflowTransition(BuildContext context, Map<String, dynamic> transitionParams) {
    context.read<WorkflowFormBloc>().add(WorkflowFormEventAddAllParameters(transitionParams));
  }
}
