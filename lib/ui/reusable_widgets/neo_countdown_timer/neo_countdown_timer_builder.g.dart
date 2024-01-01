// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_countdown_timer_builder.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: deprecated_member_use

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class NeoCountdownTimerBuilder extends _NeoCountdownTimerBuilder {
  const NeoCountdownTimerBuilder({required super.args});

  static const kType = 'neo_countdown_timer';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoCountdownTimerBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoCountdownTimerBuilder(
        args: map,
      );
  @override
  NeoCountdownTimerBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoCountdownTimerBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoCountdownTimer buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoCountdownTimer(
      duration: model.duration,
      iconUrn: model.iconUrn,
      key: key,
    );
  }
}

class JsonNeoCountdownTimer extends JsonWidgetData {
  JsonNeoCountdownTimer({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.duration,
    required this.iconUrn,
  }) : super(
          jsonWidgetArgs: NeoCountdownTimerBuilderModel.fromDynamic(
            {
              'duration': duration,
              'iconUrn': iconUrn,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoCountdownTimerBuilder(
            args: NeoCountdownTimerBuilderModel.fromDynamic(
              {
                'duration': duration,
                'iconUrn': iconUrn,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoCountdownTimerBuilder.kType,
        );

  final int duration;

  final String iconUrn;
}

class NeoCountdownTimerBuilderModel extends JsonWidgetBuilderModel {
  const NeoCountdownTimerBuilderModel(
    super.args, {
    required this.duration,
    required this.iconUrn,
  });

  final int duration;

  final String iconUrn;

  static NeoCountdownTimerBuilderModel fromDynamic(
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
        '[NeoCountdownTimerBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoCountdownTimerBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoCountdownTimerBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoCountdownTimerBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoCountdownTimerBuilderModel(
          args,
          duration: () {
            dynamic parsed = JsonClass.parseInt(map['duration']);

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [duration].');
            }
            return parsed;
          }(),
          iconUrn: map['iconUrn'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'duration': duration,
      'iconUrn': iconUrn,
      ...args,
    });
  }
}

class NeoCountdownTimerSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_countdown_timer.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoCountdownTimer',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'duration': SchemaHelper.numberSchema,
      'iconUrn': SchemaHelper.stringSchema,
    },
  };
}
