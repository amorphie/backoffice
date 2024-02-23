// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_password_bullet_view_builder.dart';

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

class SetPasswordBulletViewBuilder extends _SetPasswordBulletViewBuilder {
  const SetPasswordBulletViewBuilder({required super.args});

  static const kType = 'set_password_bullet_view';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static SetPasswordBulletViewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      SetPasswordBulletViewBuilder(
        args: map,
      );

  @override
  SetPasswordBulletViewBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = SetPasswordBulletViewBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  SetPasswordBulletView buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return SetPasswordBulletView(
      key: key,
      padding: model.padding,
      passwordLength: model.passwordLength,
      passwordWidgetEventKey: model.passwordWidgetEventKey,
      repeatedPasswordWidgetEventKey: model.repeatedPasswordWidgetEventKey,
    );
  }
}

class JsonSetPasswordBulletView extends JsonWidgetData {
  JsonSetPasswordBulletView({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.padding,
    required this.passwordLength,
    required this.passwordWidgetEventKey,
    required this.repeatedPasswordWidgetEventKey,
  }) : super(
          jsonWidgetArgs: SetPasswordBulletViewBuilderModel.fromDynamic(
            {
              'padding': padding,
              'passwordLength': passwordLength,
              'passwordWidgetEventKey': passwordWidgetEventKey,
              'repeatedPasswordWidgetEventKey': repeatedPasswordWidgetEventKey,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => SetPasswordBulletViewBuilder(
            args: SetPasswordBulletViewBuilderModel.fromDynamic(
              {
                'padding': padding,
                'passwordLength': passwordLength,
                'passwordWidgetEventKey': passwordWidgetEventKey,
                'repeatedPasswordWidgetEventKey':
                    repeatedPasswordWidgetEventKey,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: SetPasswordBulletViewBuilder.kType,
        );

  final EdgeInsetsDirectional? padding;

  final int passwordLength;

  final String passwordWidgetEventKey;

  final String repeatedPasswordWidgetEventKey;
}

class SetPasswordBulletViewBuilderModel extends JsonWidgetBuilderModel {
  const SetPasswordBulletViewBuilderModel(
    super.args, {
    this.padding,
    required this.passwordLength,
    required this.passwordWidgetEventKey,
    required this.repeatedPasswordWidgetEventKey,
  });

  final EdgeInsetsDirectional? padding;

  final int passwordLength;

  final String passwordWidgetEventKey;

  final String repeatedPasswordWidgetEventKey;

  static SetPasswordBulletViewBuilderModel fromDynamic(
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
        '[SetPasswordBulletViewBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static SetPasswordBulletViewBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    SetPasswordBulletViewBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is SetPasswordBulletViewBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = SetPasswordBulletViewBuilderModel(
          args,
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );

            return parsed;
          }(),
          passwordLength: () {
            dynamic parsed = JsonClass.parseInt(map['passwordLength']);

            if (parsed == null) {
              throw Exception(
                'Null value encountered for required parameter: [passwordLength].',
              );
            }
            return parsed;
          }(),
          passwordWidgetEventKey: map['passwordWidgetEventKey'],
          repeatedPasswordWidgetEventKey: map['repeatedPasswordWidgetEventKey'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'padding': ThemeEncoder.encodeEdgeInsetsDirectional(
        padding,
      ),
      'passwordLength': passwordLength,
      'passwordWidgetEventKey': passwordWidgetEventKey,
      'repeatedPasswordWidgetEventKey': repeatedPasswordWidgetEventKey,
      ...args,
    });
  }
}

class SetPasswordBulletViewSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/set_password_bullet_view.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'SetPasswordBulletView',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'passwordLength': SchemaHelper.numberSchema,
      'passwordWidgetEventKey': SchemaHelper.stringSchema,
      'repeatedPasswordWidgetEventKey': SchemaHelper.stringSchema,
    },
  };
}
