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
    final passwordValidationsDecoded = _decodePasswordValidations(
      data: data,
    );
    final tcknValidationsDecoded = _decodeTcknValidations(
      data: data,
    );

    return LoginCredentialForm(
      key: key,
      padding: model.padding,
      passwordButtonRight: passwordButtonRightDecoded,
      passwordDataKey: model.passwordDataKey,
      passwordLabelText: model.passwordLabelText,
      passwordMaxLength: model.passwordMaxLength,
      passwordValidations: passwordValidationsDecoded,
      tcknDataKey: model.tcknDataKey,
      tcknErrorText: model.tcknErrorText,
      tcknLabelText: model.tcknLabelText,
      tcknValidations: tcknValidationsDecoded,
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
    required this.passwordLabelText,
    this.passwordMaxLength,
    required this.passwordValidations,
    required this.tcknDataKey,
    this.tcknErrorText,
    required this.tcknLabelText,
    required this.tcknValidations,
  }) : super(
          jsonWidgetArgs: LoginCredentialFormBuilderModel.fromDynamic(
            {
              'padding': padding,
              'passwordButtonRight': passwordButtonRight,
              'passwordDataKey': passwordDataKey,
              'passwordLabelText': passwordLabelText,
              'passwordMaxLength': passwordMaxLength,
              'passwordValidations': passwordValidations,
              'tcknDataKey': tcknDataKey,
              'tcknErrorText': tcknErrorText,
              'tcknLabelText': tcknLabelText,
              'tcknValidations': tcknValidations,
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
                'passwordLabelText': passwordLabelText,
                'passwordMaxLength': passwordMaxLength,
                'passwordValidations': passwordValidations,
                'tcknDataKey': tcknDataKey,
                'tcknErrorText': tcknErrorText,
                'tcknLabelText': tcknLabelText,
                'tcknValidations': tcknValidations,
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

  final String passwordLabelText;

  final int? passwordMaxLength;

  final dynamic passwordValidations;

  final String tcknDataKey;

  final String? tcknErrorText;

  final String tcknLabelText;

  final dynamic tcknValidations;
}

class LoginCredentialFormBuilderModel extends JsonWidgetBuilderModel {
  const LoginCredentialFormBuilderModel(
    super.args, {
    this.padding = EdgeInsetsDirectional.zero,
    required this.passwordButtonRight,
    required this.passwordDataKey,
    required this.passwordLabelText,
    this.passwordMaxLength,
    required this.passwordValidations,
    required this.tcknDataKey,
    this.tcknErrorText,
    required this.tcknLabelText,
    required this.tcknValidations,
  });

  final EdgeInsetsDirectional padding;

  final dynamic passwordButtonRight;

  final String passwordDataKey;

  final String passwordLabelText;

  final int? passwordMaxLength;

  final dynamic passwordValidations;

  final String tcknDataKey;

  final String? tcknErrorText;

  final String tcknLabelText;

  final dynamic tcknValidations;

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
          passwordLabelText: map['passwordLabelText'],
          passwordMaxLength: () {
            dynamic parsed = JsonClass.maybeParseInt(map['passwordMaxLength']);

            return parsed;
          }(),
          passwordValidations: map['passwordValidations'],
          tcknDataKey: map['tcknDataKey'],
          tcknErrorText: map['tcknErrorText'],
          tcknLabelText: map['tcknLabelText'],
          tcknValidations: map['tcknValidations'],
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
      'passwordLabelText': passwordLabelText,
      'passwordMaxLength': passwordMaxLength,
      'passwordValidations': passwordValidations,
      'tcknDataKey': tcknDataKey,
      'tcknErrorText': tcknErrorText,
      'tcknLabelText': tcknLabelText,
      'tcknValidations': tcknValidations,
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
      'passwordLabelText': SchemaHelper.stringSchema,
      'passwordMaxLength': SchemaHelper.numberSchema,
      'passwordValidations': SchemaHelper.anySchema,
      'tcknDataKey': SchemaHelper.stringSchema,
      'tcknErrorText': SchemaHelper.stringSchema,
      'tcknLabelText': SchemaHelper.stringSchema,
      'tcknValidations': SchemaHelper.anySchema,
    },
  };
}
