// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_stepper_builder.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: avoid_init_to_null
// ignore_for_file: deprecated_member_use

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_if_null_operators
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class NeoStepperBuilder extends _NeoStepperBuilder {
  const NeoStepperBuilder({required super.args});

  static const kType = 'neo_stepper';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoStepperBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoStepperBuilder(
        args: map,
      );

  @override
  NeoStepperBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoStepperBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoStepper buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final stepsDecoded = _decodeNeoStepList(
      data: data,
    );

    return NeoStepper(
      axis: model.axis,
      key: key,
      padding: model.padding,
      steps: stepsDecoded,
      verticalMaxHeight: model.verticalMaxHeight,
    );
  }
}

class JsonNeoStepper extends JsonWidgetData {
  JsonNeoStepper({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.axis = Axis.horizontal,
    this.padding = EdgeInsetsDirectional.zero,
    required this.steps,
    this.verticalMaxHeight,
  }) : super(
          jsonWidgetArgs: NeoStepperBuilderModel.fromDynamic(
            {
              'axis': axis,
              'padding': padding,
              'steps': steps,
              'verticalMaxHeight': verticalMaxHeight,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoStepperBuilder(
            args: NeoStepperBuilderModel.fromDynamic(
              {
                'axis': axis,
                'padding': padding,
                'steps': steps,
                'verticalMaxHeight': verticalMaxHeight,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoStepperBuilder.kType,
        );

  final Axis axis;

  final EdgeInsetsDirectional padding;

  final dynamic steps;

  final double? verticalMaxHeight;
}

class NeoStepperBuilderModel extends JsonWidgetBuilderModel {
  const NeoStepperBuilderModel(
    super.args, {
    this.axis = Axis.horizontal,
    this.padding = EdgeInsetsDirectional.zero,
    required this.steps,
    this.verticalMaxHeight,
  });

  final Axis axis;

  final EdgeInsetsDirectional padding;

  final dynamic steps;

  final double? verticalMaxHeight;

  static NeoStepperBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(
      map,
      args: args,
      registry: registry,
    );

    if (result == null) {
      throw Exception(
        '[NeoStepperBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoStepperBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoStepperBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoStepperBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoStepperBuilderModel(
          args,
          axis: () {
            dynamic parsed = ThemeDecoder.decodeAxis(
              map['axis'],
              validate: false,
            );
            parsed ??= Axis.horizontal;

            return parsed;
          }(),
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          steps: map['steps'],
          verticalMaxHeight: () {
            dynamic parsed =
                JsonClass.maybeParseDouble(map['verticalMaxHeight']);

            return parsed;
          }(),
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'axis': Axis.horizontal == axis
          ? null
          : ThemeEncoder.encodeAxis(
              axis,
            ),
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'steps': steps,
      'verticalMaxHeight': verticalMaxHeight,
      ...args,
    });
  }
}

class NeoStepperSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_stepper.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoStepper',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'axis': SchemaHelper.objectSchema(AxisSchema.id),
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'steps': SchemaHelper.anySchema,
      'verticalMaxHeight': SchemaHelper.numberSchema,
    },
  };
}
