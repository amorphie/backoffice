// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'old_security_question_field_builder.dart';

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

class OldSecurityQuestionFieldBuilder extends _OldSecurityQuestionFieldBuilder {
  const OldSecurityQuestionFieldBuilder({required super.args});

  static const kType = 'old_security_question_field';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static OldSecurityQuestionFieldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      OldSecurityQuestionFieldBuilder(
        args: map,
      );

  @override
  OldSecurityQuestionFieldBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = OldSecurityQuestionFieldBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  OldSecurityQuestionField buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return OldSecurityQuestionField(
      key: key,
      padding: model.padding,
    );
  }
}

class JsonOldSecurityQuestionField extends JsonWidgetData {
  JsonOldSecurityQuestionField({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs: OldSecurityQuestionFieldBuilderModel.fromDynamic(
            {
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => OldSecurityQuestionFieldBuilder(
            args: OldSecurityQuestionFieldBuilderModel.fromDynamic(
              {
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: OldSecurityQuestionFieldBuilder.kType,
        );

  final EdgeInsetsDirectional padding;
}

class OldSecurityQuestionFieldBuilderModel extends JsonWidgetBuilderModel {
  const OldSecurityQuestionFieldBuilderModel(
    super.args, {
    this.padding = EdgeInsetsDirectional.zero,
  });

  final EdgeInsetsDirectional padding;

  static OldSecurityQuestionFieldBuilderModel fromDynamic(
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
        '[OldSecurityQuestionFieldBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static OldSecurityQuestionFieldBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    OldSecurityQuestionFieldBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is OldSecurityQuestionFieldBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = OldSecurityQuestionFieldBuilderModel(
          args,
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
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      ...args,
    });
  }
}

class OldSecurityQuestionFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/old_security_question_field.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'OldSecurityQuestionField',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
