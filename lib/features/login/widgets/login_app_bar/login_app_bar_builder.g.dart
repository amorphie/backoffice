// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_app_bar_builder.dart';

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

class LoginAppBarBuilder extends _LoginAppBarBuilder {
  const LoginAppBarBuilder({required super.args});

  static const kType = 'login_app_bar';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static LoginAppBarBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      LoginAppBarBuilder(
        args: map,
      );

  @override
  LoginAppBarBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = LoginAppBarBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  LoginAppBar buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return LoginAppBar(
      defaultAppBar: model.defaultAppBar.build(
        childBuilder: childBuilder,
        context: context,
      ) as PreferredSizeWidget,
      focusedAppBar: model.focusedAppBar.build(
        childBuilder: childBuilder,
        context: context,
      ) as PreferredSizeWidget,
      key: key,
    );
  }
}

class JsonLoginAppBar extends JsonWidgetData {
  JsonLoginAppBar({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.defaultAppBar,
    required this.focusedAppBar,
  }) : super(
          jsonWidgetArgs: LoginAppBarBuilderModel.fromDynamic(
            {
              'defaultAppBar': defaultAppBar,
              'focusedAppBar': focusedAppBar,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => LoginAppBarBuilder(
            args: LoginAppBarBuilderModel.fromDynamic(
              {
                'defaultAppBar': defaultAppBar,
                'focusedAppBar': focusedAppBar,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: LoginAppBarBuilder.kType,
        );

  final JsonWidgetData defaultAppBar;

  final JsonWidgetData focusedAppBar;
}

class LoginAppBarBuilderModel extends JsonWidgetBuilderModel {
  const LoginAppBarBuilderModel(
    super.args, {
    required this.defaultAppBar,
    required this.focusedAppBar,
  });

  final JsonWidgetData defaultAppBar;

  final JsonWidgetData focusedAppBar;

  static LoginAppBarBuilderModel fromDynamic(
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
        '[LoginAppBarBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static LoginAppBarBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    LoginAppBarBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is LoginAppBarBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = LoginAppBarBuilderModel(
          args,
          defaultAppBar: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['defaultAppBar'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [defaultAppBar].');
            }
            return parsed;
          }(),
          focusedAppBar: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['focusedAppBar'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [focusedAppBar].');
            }
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
      'defaultAppBar': defaultAppBar.toJson(),
      'focusedAppBar': focusedAppBar.toJson(),
      ...args,
    });
  }
}

class LoginAppBarSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/login_app_bar.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'LoginAppBar',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'defaultAppBar': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'focusedAppBar': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
    },
  };
}
