// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_slidable_avatar_tab_builder.dart';

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

class LoginSlidableAvatarTabBuilder extends _LoginSlidableAvatarTabBuilder {
  const LoginSlidableAvatarTabBuilder({required super.args});

  static const kType = 'login_slidable_avatar_tab';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static LoginSlidableAvatarTabBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      LoginSlidableAvatarTabBuilder(
        args: map,
      );

  @override
  LoginSlidableAvatarTabBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = LoginSlidableAvatarTabBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  LoginSlidableAvatarTab buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return LoginSlidableAvatarTab(
      childLogin: model.childLogin.build(
        childBuilder: childBuilder,
        context: context,
      ),
      childNewUser: model.childNewUser.build(
        childBuilder: childBuilder,
        context: context,
      ),
      key: key,
      padding: model.padding,
    );
  }
}

class JsonLoginSlidableAvatarTab extends JsonWidgetData {
  JsonLoginSlidableAvatarTab({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.childLogin,
    required this.childNewUser,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs: LoginSlidableAvatarTabBuilderModel.fromDynamic(
            {
              'childLogin': childLogin,
              'childNewUser': childNewUser,
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => LoginSlidableAvatarTabBuilder(
            args: LoginSlidableAvatarTabBuilderModel.fromDynamic(
              {
                'childLogin': childLogin,
                'childNewUser': childNewUser,
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: LoginSlidableAvatarTabBuilder.kType,
        );

  final JsonWidgetData childLogin;

  final JsonWidgetData childNewUser;

  final EdgeInsetsDirectional padding;
}

class LoginSlidableAvatarTabBuilderModel extends JsonWidgetBuilderModel {
  const LoginSlidableAvatarTabBuilderModel(
    super.args, {
    required this.childLogin,
    required this.childNewUser,
    this.padding = EdgeInsetsDirectional.zero,
  });

  final JsonWidgetData childLogin;

  final JsonWidgetData childNewUser;

  final EdgeInsetsDirectional padding;

  static LoginSlidableAvatarTabBuilderModel fromDynamic(
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
        '[LoginSlidableAvatarTabBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static LoginSlidableAvatarTabBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    LoginSlidableAvatarTabBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is LoginSlidableAvatarTabBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = LoginSlidableAvatarTabBuilderModel(
          args,
          childLogin: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['childLogin'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [childLogin].');
            }
            return parsed;
          }(),
          childNewUser: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['childNewUser'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [childNewUser].');
            }
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
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'childLogin': childLogin.toJson(),
      'childNewUser': childNewUser.toJson(),
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      ...args,
    });
  }
}

class LoginSlidableAvatarTabSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/login_slidable_avatar_tab.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'LoginSlidableAvatarTab',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'childLogin': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'childNewUser': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
