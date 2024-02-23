// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_button_builder.dart';

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

class LoginButtonBuilder extends _LoginButtonBuilder {
  const LoginButtonBuilder({required super.args});

  static const kType = 'login_button';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static LoginButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      LoginButtonBuilder(
        args: map,
      );

  @override
  LoginButtonBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = LoginButtonBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  LoginButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return LoginButton(
      formValidationRequired: model.formValidationRequired,
      key: key,
      labelText: model.labelText,
      loadingLabelText: model.loadingLabelText,
      padding: model.padding,
      startWorkflow: model.startWorkflow,
      transitionId: model.transitionId,
    );
  }
}

class JsonLoginButton extends JsonWidgetData {
  JsonLoginButton({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.formValidationRequired = false,
    this.labelText,
    this.loadingLabelText,
    this.padding,
    this.startWorkflow = false,
    this.transitionId,
  }) : super(
          jsonWidgetArgs: LoginButtonBuilderModel.fromDynamic(
            {
              'formValidationRequired': formValidationRequired,
              'labelText': labelText,
              'loadingLabelText': loadingLabelText,
              'padding': padding,
              'startWorkflow': startWorkflow,
              'transitionId': transitionId,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => LoginButtonBuilder(
            args: LoginButtonBuilderModel.fromDynamic(
              {
                'formValidationRequired': formValidationRequired,
                'labelText': labelText,
                'loadingLabelText': loadingLabelText,
                'padding': padding,
                'startWorkflow': startWorkflow,
                'transitionId': transitionId,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: LoginButtonBuilder.kType,
        );

  final bool formValidationRequired;

  final String? labelText;

  final String? loadingLabelText;

  final EdgeInsetsDirectional? padding;

  final bool startWorkflow;

  final String? transitionId;
}

class LoginButtonBuilderModel extends JsonWidgetBuilderModel {
  const LoginButtonBuilderModel(
    super.args, {
    this.formValidationRequired = false,
    this.labelText,
    this.loadingLabelText,
    this.padding,
    this.startWorkflow = false,
    this.transitionId,
  });

  final bool formValidationRequired;

  final String? labelText;

  final String? loadingLabelText;

  final EdgeInsetsDirectional? padding;

  final bool startWorkflow;

  final String? transitionId;

  static LoginButtonBuilderModel fromDynamic(
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
        '[LoginButtonBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static LoginButtonBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    LoginButtonBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is LoginButtonBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = LoginButtonBuilderModel(
          args,
          formValidationRequired: JsonClass.parseBool(
            map['formValidationRequired'],
            whenNull: false,
          ),
          labelText: map['labelText'],
          loadingLabelText: map['loadingLabelText'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );

            return parsed;
          }(),
          startWorkflow: JsonClass.parseBool(
            map['startWorkflow'],
            whenNull: false,
          ),
          transitionId: map['transitionId'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'formValidationRequired':
          false == formValidationRequired ? null : formValidationRequired,
      'labelText': labelText,
      'loadingLabelText': loadingLabelText,
      'padding': ThemeEncoder.encodeEdgeInsetsDirectional(
        padding,
      ),
      'startWorkflow': false == startWorkflow ? null : startWorkflow,
      'transitionId': transitionId,
      ...args,
    });
  }
}

class LoginButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/login_button.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'LoginButton',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'formValidationRequired': SchemaHelper.boolSchema,
      'labelText': SchemaHelper.stringSchema,
      'loadingLabelText': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'startWorkflow': SchemaHelper.boolSchema,
      'transitionId': SchemaHelper.stringSchema,
    },
  };
}
