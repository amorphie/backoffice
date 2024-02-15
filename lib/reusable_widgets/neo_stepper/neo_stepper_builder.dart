import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_stepper/model/neo_stepper_item_model.dart';
import 'package:backoffice/reusable_widgets/neo_stepper/neo_stepper.dart';

part 'neo_stepper_builder.g.dart';

abstract class _Constants {
  static const stepsKey = 'steps';
}

@JsonWidget(type: 'neo_stepper')
abstract class _NeoStepperBuilder extends JsonWidgetBuilder {
  @JsonArgDecoder(_Constants.stepsKey)
  List<NeoStepperItemModel> _decodeNeoStepList({required JsonWidgetData data}) => data.jsonWidgetArgs[_Constants.stepsKey] == null
      ? []
      : List.castFrom(data.jsonWidgetArgs[_Constants.stepsKey] as List<dynamic>? ?? []).map((e) => NeoStepperItemModel.fromJson(e)).toList();

  const _NeoStepperBuilder({required super.args});

  @override
  NeoStepper buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
