// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:backoffice/backoffice/widgets/neo_web_view/neo_web_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../core/bo_transition_type_enum.dart';
import '../../widgets/neo_bo_button/neo_bo_button.dart';

class BackofficeTransitionPage extends StatefulWidget {
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
  State<BackofficeTransitionPage> createState() => _BackofficeTransitionPageState();
}

class _BackofficeTransitionPageState extends State<BackofficeTransitionPage> {
  final BehaviorSubject<Map<String, dynamic>> listenerTransition = BehaviorSubject<Map<String, dynamic>>();
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case BoTransitionType.FlutterWidget:
        return JsonWidgetData.fromDynamic(jsonDecode(widget.data)).build(context: context);
      case BoTransitionType.Formio:
        return _webViewPage(context, WebViewSource.formio(widget.data));
      case BoTransitionType.Html:
        return _webViewPage(context, WebViewSource.html(widget.data));
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
                listenerTransition.add(transitionParams);
              },
            ),
          ),
          NeoBoButton(
            onTap: () async {
              await source.callJsMethod!("onSubmit", []);
            },
            listenerTransition: listenerTransition,
            labelText: "Send",
            transitionId: widget.transitionId,
          ),
        ],
      ),
    );
  }

  postWorkflowTransition(BuildContext context, Map<String, dynamic> transitionParams) {
    context.read<WorkflowFormBloc>().add(WorkflowFormEventAddAllParameters(transitionParams));
  }
}
