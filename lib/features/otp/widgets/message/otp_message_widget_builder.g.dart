// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_message_widget_builder.dart';

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

class OtpMessageWidgetBuilder extends _OtpMessageWidgetBuilder {
  const OtpMessageWidgetBuilder({required super.args});

  static const kType = 'otp_message_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static OtpMessageWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      OtpMessageWidgetBuilder(
        args: map,
      );

  @override
  OtpMessageWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = OtpMessageWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  OtpMessageWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return OtpMessageWidget(
      key: key,
      message: model.message,
    );
  }
}

class JsonOtpMessageWidget extends JsonWidgetData {
  JsonOtpMessageWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.message,
  }) : super(
          jsonWidgetArgs: OtpMessageWidgetBuilderModel.fromDynamic(
            {
              'message': message,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => OtpMessageWidgetBuilder(
            args: OtpMessageWidgetBuilderModel.fromDynamic(
              {
                'message': message,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: OtpMessageWidgetBuilder.kType,
        );

  final String message;
}

class OtpMessageWidgetBuilderModel extends JsonWidgetBuilderModel {
  const OtpMessageWidgetBuilderModel(
    super.args, {
    required this.message,
  });

  final String message;

  static OtpMessageWidgetBuilderModel fromDynamic(
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
        '[OtpMessageWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static OtpMessageWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    OtpMessageWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is OtpMessageWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = OtpMessageWidgetBuilderModel(
          args,
          message: map['message'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'message': message,
      ...args,
    });
  }
}

class OtpMessageWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/otp_message_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'OtpMessageWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'message': SchemaHelper.stringSchema,
    },
  };
}
