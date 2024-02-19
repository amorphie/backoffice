// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_attempt_list_item_widget_builder.dart';

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

class LoginAttemptListItemWidgetBuilder
    extends _LoginAttemptListItemWidgetBuilder {
  const LoginAttemptListItemWidgetBuilder({required super.args});

  static const kType = 'login_attempt_list_item';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static LoginAttemptListItemWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      LoginAttemptListItemWidgetBuilder(
        args: map,
      );

  @override
  LoginAttemptListItemWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = LoginAttemptListItemWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  LoginAttemptListItemWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return LoginAttemptListItemWidget(
      attemptDate: model.attemptDate,
      channel: model.channel,
      isSuccessful: model.isSuccessful,
      key: key,
      padding: model.padding,
    );
  }
}

class JsonLoginAttemptListItemWidget extends JsonWidgetData {
  JsonLoginAttemptListItemWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.attemptDate,
    required this.channel,
    required this.isSuccessful,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs: LoginAttemptListItemWidgetBuilderModel.fromDynamic(
            {
              'attemptDate': attemptDate,
              'channel': channel,
              'isSuccessful': isSuccessful,
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => LoginAttemptListItemWidgetBuilder(
            args: LoginAttemptListItemWidgetBuilderModel.fromDynamic(
              {
                'attemptDate': attemptDate,
                'channel': channel,
                'isSuccessful': isSuccessful,
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: LoginAttemptListItemWidgetBuilder.kType,
        );

  final DateTime attemptDate;

  final String channel;

  final bool isSuccessful;

  final EdgeInsetsDirectional padding;
}

class LoginAttemptListItemWidgetBuilderModel extends JsonWidgetBuilderModel {
  const LoginAttemptListItemWidgetBuilderModel(
    super.args, {
    required this.attemptDate,
    required this.channel,
    required this.isSuccessful,
    this.padding = EdgeInsetsDirectional.zero,
  });

  final DateTime attemptDate;

  final String channel;

  final bool isSuccessful;

  final EdgeInsetsDirectional padding;

  static LoginAttemptListItemWidgetBuilderModel fromDynamic(
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
        '[LoginAttemptListItemWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static LoginAttemptListItemWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    LoginAttemptListItemWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is LoginAttemptListItemWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = LoginAttemptListItemWidgetBuilderModel(
          args,
          attemptDate: () {
            dynamic parsed = JsonClass.parseDateTime(map['attemptDate']);

            if (parsed == null) {
              throw Exception(
                'Null value encountered for required parameter: [attemptDate].',
              );
            }
            return parsed;
          }(),
          channel: map['channel'],
          isSuccessful: JsonClass.parseBool(
            map['isSuccessful'],
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
      'attemptDate': attemptDate.millisecondsSinceEpoch,
      'channel': channel,
      'isSuccessful': isSuccessful,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      ...args,
    });
  }
}

class LoginAttemptListItemWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/login_attempt_list_item_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'LoginAttemptListItemWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'attemptDate': SchemaHelper.anySchema,
      'channel': SchemaHelper.stringSchema,
      'isSuccessful': SchemaHelper.boolSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
