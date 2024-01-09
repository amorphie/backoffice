// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_credential_form_builder.dart';

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

class LoginCredentialFormBuilder extends _LoginCredentialFormBuilder {
  const LoginCredentialFormBuilder({required super.args});

  static const kType = 'login_credential_form';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static LoginCredentialFormBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      LoginCredentialFormBuilder(
        args: map,
      );

  @override
  LoginCredentialFormBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = LoginCredentialFormBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  LoginCredentialForm buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final passwordButtonRightDecoded = _decodePasswordButtonRight(
      data: data,
    );

    return LoginCredentialForm(
      key: key,
      padding: model.padding,
      passwordButtonRight: passwordButtonRightDecoded,
      passwordDataKey: model.passwordDataKey,
      passwordErrorText: model.passwordErrorText,
      passwordLabelText: model.passwordLabelText,
      passwordMaxLength: model.passwordMaxLength,
      passwordValidationRegex: model.passwordValidationRegex,
      tcknDataKey: model.tcknDataKey,
      tcknErrorText: model.tcknErrorText,
      tcknLabelText: model.tcknLabelText,
    );
  }
}

class JsonLoginCredentialForm extends JsonWidgetData {
  JsonLoginCredentialForm({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.padding = EdgeInsetsDirectional.zero,
    required this.passwordButtonRight,
    required this.passwordDataKey,
    this.passwordErrorText,
    required this.passwordLabelText,
    this.passwordMaxLength,
    this.passwordValidationRegex,
    required this.tcknDataKey,
    this.tcknErrorText,
    required this.tcknLabelText,
  }) : super(
          jsonWidgetArgs: LoginCredentialFormBuilderModel.fromDynamic(
            {
              'padding': padding,
              'passwordButtonRight': passwordButtonRight,
              'passwordDataKey': passwordDataKey,
              'passwordErrorText': passwordErrorText,
              'passwordLabelText': passwordLabelText,
              'passwordMaxLength': passwordMaxLength,
              'passwordValidationRegex': passwordValidationRegex,
              'tcknDataKey': tcknDataKey,
              'tcknErrorText': tcknErrorText,
              'tcknLabelText': tcknLabelText,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => LoginCredentialFormBuilder(
            args: LoginCredentialFormBuilderModel.fromDynamic(
              {
                'padding': padding,
                'passwordButtonRight': passwordButtonRight,
                'passwordDataKey': passwordDataKey,
                'passwordErrorText': passwordErrorText,
                'passwordLabelText': passwordLabelText,
                'passwordMaxLength': passwordMaxLength,
                'passwordValidationRegex': passwordValidationRegex,
                'tcknDataKey': tcknDataKey,
                'tcknErrorText': tcknErrorText,
                'tcknLabelText': tcknLabelText,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: LoginCredentialFormBuilder.kType,
        );

  final EdgeInsetsDirectional padding;

  final dynamic passwordButtonRight;

  final String passwordDataKey;

  final String? passwordErrorText;

  final String passwordLabelText;

  final int? passwordMaxLength;

  final String? passwordValidationRegex;

  final String tcknDataKey;

  final String? tcknErrorText;

  final String tcknLabelText;
}

class LoginCredentialFormBuilderModel extends JsonWidgetBuilderModel {
  const LoginCredentialFormBuilderModel(
    super.args, {
    this.padding = EdgeInsetsDirectional.zero,
    required this.passwordButtonRight,
    required this.passwordDataKey,
    this.passwordErrorText,
    required this.passwordLabelText,
    this.passwordMaxLength,
    this.passwordValidationRegex,
    required this.tcknDataKey,
    this.tcknErrorText,
    required this.tcknLabelText,
  });

  final EdgeInsetsDirectional padding;

  final dynamic passwordButtonRight;

  final String passwordDataKey;

  final String? passwordErrorText;

  final String passwordLabelText;

  final int? passwordMaxLength;

  final String? passwordValidationRegex;

  final String tcknDataKey;

  final String? tcknErrorText;

  final String tcknLabelText;

  static LoginCredentialFormBuilderModel fromDynamic(
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
        '[LoginCredentialFormBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static LoginCredentialFormBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    LoginCredentialFormBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is LoginCredentialFormBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = LoginCredentialFormBuilderModel(
          args,
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          passwordButtonRight: map['passwordButtonRight'],
          passwordDataKey: map['passwordDataKey'],
          passwordErrorText: map['passwordErrorText'],
          passwordLabelText: map['passwordLabelText'],
          passwordMaxLength: () {
            dynamic parsed = JsonClass.maybeParseInt(map['passwordMaxLength']);

            return parsed;
          }(),
          passwordValidationRegex: map['passwordValidationRegex'],
          tcknDataKey: map['tcknDataKey'],
          tcknErrorText: map['tcknErrorText'],
          tcknLabelText: map['tcknLabelText'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'passwordButtonRight': passwordButtonRight,
      'passwordDataKey': passwordDataKey,
      'passwordErrorText': passwordErrorText,
      'passwordLabelText': passwordLabelText,
      'passwordMaxLength': passwordMaxLength,
      'passwordValidationRegex': passwordValidationRegex,
      'tcknDataKey': tcknDataKey,
      'tcknErrorText': tcknErrorText,
      'tcknLabelText': tcknLabelText,
      ...args,
    });
  }
}

class LoginCredentialFormSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/login_credential_form.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'LoginCredentialForm',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'passwordButtonRight': SchemaHelper.anySchema,
      'passwordDataKey': SchemaHelper.stringSchema,
      'passwordErrorText': SchemaHelper.stringSchema,
      'passwordLabelText': SchemaHelper.stringSchema,
      'passwordMaxLength': SchemaHelper.numberSchema,
      'passwordValidationRegex': SchemaHelper.stringSchema,
      'tcknDataKey': SchemaHelper.stringSchema,
      'tcknErrorText': SchemaHelper.stringSchema,
      'tcknLabelText': SchemaHelper.stringSchema,
    },
  };
}
