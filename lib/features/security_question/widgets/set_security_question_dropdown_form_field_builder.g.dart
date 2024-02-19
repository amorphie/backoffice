// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_security_question_dropdown_form_field_builder.dart';

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

class SetSecurityQuestionDropdownFormFieldBuilder
    extends _SetSecurityQuestionDropdownFormFieldBuilder {
  const SetSecurityQuestionDropdownFormFieldBuilder({required super.args});

  static const kType = 'set_security_question_dropdown_form_field';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static SetSecurityQuestionDropdownFormFieldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      SetSecurityQuestionDropdownFormFieldBuilder(
        args: map,
      );

  @override
  SetSecurityQuestionDropdownFormFieldBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = SetSecurityQuestionDropdownFormFieldBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  SetSecurityQuestionDropdownFormField buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return SetSecurityQuestionDropdownFormField(
      bottomSheetTitle: model.bottomSheetTitle,
      dataKey: model.dataKey,
      hint: model.hint,
      key: key,
      labelText: model.labelText,
      padding: model.padding,
      validationErrorMessage: model.validationErrorMessage,
    );
  }
}

class JsonSetSecurityQuestionDropdownFormField extends JsonWidgetData {
  JsonSetSecurityQuestionDropdownFormField({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.bottomSheetTitle,
    required this.dataKey,
    this.hint,
    this.labelText,
    this.padding = EdgeInsetsDirectional.zero,
    this.validationErrorMessage,
  }) : super(
          jsonWidgetArgs:
              SetSecurityQuestionDropdownFormFieldBuilderModel.fromDynamic(
            {
              'bottomSheetTitle': bottomSheetTitle,
              'dataKey': dataKey,
              'hint': hint,
              'labelText': labelText,
              'padding': padding,
              'validationErrorMessage': validationErrorMessage,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => SetSecurityQuestionDropdownFormFieldBuilder(
            args: SetSecurityQuestionDropdownFormFieldBuilderModel.fromDynamic(
              {
                'bottomSheetTitle': bottomSheetTitle,
                'dataKey': dataKey,
                'hint': hint,
                'labelText': labelText,
                'padding': padding,
                'validationErrorMessage': validationErrorMessage,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: SetSecurityQuestionDropdownFormFieldBuilder.kType,
        );

  final String? bottomSheetTitle;

  final String dataKey;

  final String? hint;

  final String? labelText;

  final EdgeInsetsDirectional padding;

  final String? validationErrorMessage;
}

class SetSecurityQuestionDropdownFormFieldBuilderModel
    extends JsonWidgetBuilderModel {
  const SetSecurityQuestionDropdownFormFieldBuilderModel(
    super.args, {
    this.bottomSheetTitle,
    required this.dataKey,
    this.hint,
    this.labelText,
    this.padding = EdgeInsetsDirectional.zero,
    this.validationErrorMessage,
  });

  final String? bottomSheetTitle;

  final String dataKey;

  final String? hint;

  final String? labelText;

  final EdgeInsetsDirectional padding;

  final String? validationErrorMessage;

  static SetSecurityQuestionDropdownFormFieldBuilderModel fromDynamic(
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
        '[SetSecurityQuestionDropdownFormFieldBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static SetSecurityQuestionDropdownFormFieldBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    SetSecurityQuestionDropdownFormFieldBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is SetSecurityQuestionDropdownFormFieldBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = SetSecurityQuestionDropdownFormFieldBuilderModel(
          args,
          bottomSheetTitle: map['bottomSheetTitle'],
          dataKey: map['dataKey'],
          hint: map['hint'],
          labelText: map['labelText'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          validationErrorMessage: map['validationErrorMessage'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'bottomSheetTitle': bottomSheetTitle,
      'dataKey': dataKey,
      'hint': hint,
      'labelText': labelText,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'validationErrorMessage': validationErrorMessage,
      ...args,
    });
  }
}

class SetSecurityQuestionDropdownFormFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/set_security_question_dropdown_form_field.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'SetSecurityQuestionDropdownFormField',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'bottomSheetTitle': SchemaHelper.stringSchema,
      'dataKey': SchemaHelper.stringSchema,
      'hint': SchemaHelper.stringSchema,
      'labelText': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'validationErrorMessage': SchemaHelper.stringSchema,
    },
  };
}
