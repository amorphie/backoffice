// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_switch_builder.dart';

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

class NeoSwitchBuilder extends _NeoSwitchBuilder {
  const NeoSwitchBuilder({required super.args});

  static const kType = 'neo_switch';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoSwitchBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoSwitchBuilder(
        args: map,
      );

  @override
  NeoSwitchBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoSwitchBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoSwitch buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoSwitch(
      dataKey: model.dataKey,
      initialValue: model.initialValue,
      key: key,
      padding: model.padding,
    );
  }
}

class JsonNeoSwitch extends JsonWidgetData {
  JsonNeoSwitch({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.dataKey,
    this.initialValue = false,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs: NeoSwitchBuilderModel.fromDynamic(
            {
              'dataKey': dataKey,
              'initialValue': initialValue,
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoSwitchBuilder(
            args: NeoSwitchBuilderModel.fromDynamic(
              {
                'dataKey': dataKey,
                'initialValue': initialValue,
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoSwitchBuilder.kType,
        );

  final String dataKey;

  final bool initialValue;

  final EdgeInsetsDirectional padding;
}

class NeoSwitchBuilderModel extends JsonWidgetBuilderModel {
  const NeoSwitchBuilderModel(
    super.args, {
    required this.dataKey,
    this.initialValue = false,
    this.padding = EdgeInsetsDirectional.zero,
  });

  final String dataKey;

  final bool initialValue;

  final EdgeInsetsDirectional padding;

  static NeoSwitchBuilderModel fromDynamic(
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
        '[NeoSwitchBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoSwitchBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoSwitchBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoSwitchBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoSwitchBuilderModel(
          args,
          dataKey: map['dataKey'],
          initialValue: JsonClass.parseBool(
            map['initialValue'],
            whenNull: false,
          ),
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

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
      'dataKey': dataKey,
      'initialValue': false == initialValue ? null : initialValue,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      ...args,
    });
  }
}

class NeoSwitchSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_switch.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoSwitch',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dataKey': SchemaHelper.stringSchema,
      'initialValue': SchemaHelper.boolSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
