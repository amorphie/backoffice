// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_accordion_builder.dart';

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

class NeoAccordionBuilder extends _NeoAccordionBuilder {
  const NeoAccordionBuilder({required super.args});

  static const kType = 'neo_accordion';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoAccordionBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoAccordionBuilder(
        args: map,
      );

  @override
  NeoAccordionBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoAccordionBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoAccordion buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoAccordion(
      items: model.items.build(
        childBuilder: childBuilder,
        context: context,
      ),
      key: key,
      padding: model.padding,
      title: model.title.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

class JsonNeoAccordion extends JsonWidgetData {
  JsonNeoAccordion({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.items,
    this.padding = EdgeInsetsDirectional.zero,
    required this.title,
  }) : super(
          jsonWidgetArgs: NeoAccordionBuilderModel.fromDynamic(
            {
              'items': items,
              'padding': padding,
              'title': title,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoAccordionBuilder(
            args: NeoAccordionBuilderModel.fromDynamic(
              {
                'items': items,
                'padding': padding,
                'title': title,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoAccordionBuilder.kType,
        );

  final JsonWidgetData items;

  final EdgeInsetsDirectional padding;

  final JsonWidgetData title;
}

class NeoAccordionBuilderModel extends JsonWidgetBuilderModel {
  const NeoAccordionBuilderModel(
    super.args, {
    required this.items,
    this.padding = EdgeInsetsDirectional.zero,
    required this.title,
  });

  final JsonWidgetData items;

  final EdgeInsetsDirectional padding;

  final JsonWidgetData title;

  static NeoAccordionBuilderModel fromDynamic(
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
        '[NeoAccordionBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoAccordionBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoAccordionBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoAccordionBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoAccordionBuilderModel(
          args,
          items: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['items'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [items].');
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
          title: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['title'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [title].');
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
      'items': items.toJson(),
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'title': title.toJson(),
      ...args,
    });
  }
}

class NeoAccordionSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_accordion.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoAccordion',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'items': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'title': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
    },
  };
}
