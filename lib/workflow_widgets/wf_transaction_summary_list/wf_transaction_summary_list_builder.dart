import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:backoffice/workflow_widgets/wf_transaction_summary_list/wf_transaction_summary_list.dart';

part 'wf_transaction_summary_list_builder.g.dart';

@JsonWidget(type: 'wf_transaction_summary_list')
abstract class _WfTransactionSummaryListBuilder extends JsonWidgetBuilder {
  const _WfTransactionSummaryListBuilder({required super.args});

  @override
  WfTransactionSummaryList buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
