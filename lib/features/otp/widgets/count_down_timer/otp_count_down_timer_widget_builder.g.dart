// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_count_down_timer_widget_builder.dart';

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

class OtpCountDownTimerWidgetBuilder extends _OtpCountDownTimerWidgetBuilder {
  const OtpCountDownTimerWidgetBuilder({required super.args});

  static const kType = 'otp_count_down_timer_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static OtpCountDownTimerWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      OtpCountDownTimerWidgetBuilder(
        args: map,
      );

  @override
  OtpCountDownTimerWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = OtpCountDownTimerWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  OtpCountDownTimerWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return OtpCountDownTimerWidget(
      durationInSeconds: model.durationInSeconds,
      key: key,
    );
  }
}

class JsonOtpCountDownTimerWidget extends JsonWidgetData {
  JsonOtpCountDownTimerWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.durationInSeconds,
  }) : super(
          jsonWidgetArgs: OtpCountDownTimerWidgetBuilderModel.fromDynamic(
            {
              'durationInSeconds': durationInSeconds,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => OtpCountDownTimerWidgetBuilder(
            args: OtpCountDownTimerWidgetBuilderModel.fromDynamic(
              {
                'durationInSeconds': durationInSeconds,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: OtpCountDownTimerWidgetBuilder.kType,
        );

  final int? durationInSeconds;
}

class OtpCountDownTimerWidgetBuilderModel extends JsonWidgetBuilderModel {
  const OtpCountDownTimerWidgetBuilderModel(
    super.args, {
    this.durationInSeconds,
  });

  final int? durationInSeconds;

  static OtpCountDownTimerWidgetBuilderModel fromDynamic(
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
        '[OtpCountDownTimerWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static OtpCountDownTimerWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    OtpCountDownTimerWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is OtpCountDownTimerWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = OtpCountDownTimerWidgetBuilderModel(
          args,
          durationInSeconds: () {
            dynamic parsed = JsonClass.maybeParseInt(map['durationInSeconds']);

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
      'durationInSeconds': durationInSeconds,
      ...args,
    });
  }
}

class OtpCountDownTimerWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/otp_count_down_timer_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'OtpCountDownTimerWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'durationInSeconds': SchemaHelper.numberSchema,
    },
  };
}
