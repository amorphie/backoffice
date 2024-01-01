// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_terms_and_conditions_builder.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: deprecated_member_use

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class NeoTermsAndConditionsBuilder extends _NeoTermsAndConditionsBuilder {
  const NeoTermsAndConditionsBuilder({required super.args});

  static const kType = 'neo_terms_and_conditions';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoTermsAndConditionsBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoTermsAndConditionsBuilder(
        args: map,
      );
  @override
  NeoTermsAndConditionsBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoTermsAndConditionsBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoTermsAndConditions buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoTermsAndConditions(
      contentText: model.contentText,
      dataKey: model.dataKey,
      key: key,
      padding: model.padding,
      titleText: model.titleText,
    );
  }
}

class JsonNeoTermsAndConditions extends JsonWidgetData {
  JsonNeoTermsAndConditions({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.contentText = "",
    this.dataKey,
    this.padding = const EdgeInsetsDirectional.only(
        start: 24, end: 24, bottom: 120, top: 24),
    this.titleText = "",
  }) : super(
          jsonWidgetArgs: NeoTermsAndConditionsBuilderModel.fromDynamic(
            {
              'contentText': contentText,
              'dataKey': dataKey,
              'padding': padding,
              'titleText': titleText,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoTermsAndConditionsBuilder(
            args: NeoTermsAndConditionsBuilderModel.fromDynamic(
              {
                'contentText': contentText,
                'dataKey': dataKey,
                'padding': padding,
                'titleText': titleText,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoTermsAndConditionsBuilder.kType,
        );

  final String contentText;

  final String? dataKey;

  final EdgeInsetsDirectional padding;

  final String titleText;
}

class NeoTermsAndConditionsBuilderModel extends JsonWidgetBuilderModel {
  const NeoTermsAndConditionsBuilderModel(
    super.args, {
    this.contentText = "",
    this.dataKey,
    this.padding = const EdgeInsetsDirectional.only(
        start: 24, end: 24, bottom: 120, top: 24),
    this.titleText = "",
  });

  final String contentText;

  final String? dataKey;

  final EdgeInsetsDirectional padding;

  final String titleText;

  static NeoTermsAndConditionsBuilderModel fromDynamic(
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
        '[NeoTermsAndConditionsBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoTermsAndConditionsBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoTermsAndConditionsBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoTermsAndConditionsBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoTermsAndConditionsBuilderModel(
          args,
          contentText: map['contentText'] ?? "",
          dataKey: map['dataKey'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= const EdgeInsetsDirectional.only(
                start: 24, end: 24, bottom: 120, top: 24);

            return parsed;
          }(),
          titleText: map['titleText'] ?? "",
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'contentText': "" == contentText ? null : contentText,
      'dataKey': dataKey,
      'padding': const EdgeInsetsDirectional.only(
                  start: 24, end: 24, bottom: 120, top: 24) ==
              padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'titleText': "" == titleText ? null : titleText,
      ...args,
    });
  }
}

class NeoTermsAndConditionsSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_terms_and_conditions.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoTermsAndConditions',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'contentText': SchemaHelper.stringSchema,
      'dataKey': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'titleText': SchemaHelper.stringSchema,
    },
  };
}
