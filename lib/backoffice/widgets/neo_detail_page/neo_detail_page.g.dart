// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_detail_page.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: avoid_init_to_null
// ignore_for_file: deprecated_member_use
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_if_null_operators
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class JsonNeoDetailPageBuilder extends _JsonNeoDetailPageBuilder {
  const JsonNeoDetailPageBuilder({required super.args});

  static const kType = 'neo_detail_page';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static JsonNeoDetailPageBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      JsonNeoDetailPageBuilder(
        args: map,
      );

  @override
  JsonNeoDetailPageBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = JsonNeoDetailPageBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  _NeoDetailPage buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return _NeoDetailPage(
      childBuilder: childBuilder,
      model: model,
      summary: model.summary,
      tabs: model.tabs,
    );
  }
}

class JsonNeoDetailPage extends JsonWidgetData {
  JsonNeoDetailPage({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.summary,
    required this.tabs,
  }) : super(
          jsonWidgetArgs: JsonNeoDetailPageBuilderModel.fromDynamic(
            {
              'summary': summary,
              'tabs': tabs,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => JsonNeoDetailPageBuilder(
            args: JsonNeoDetailPageBuilderModel.fromDynamic(
              {
                'summary': summary,
                'tabs': tabs,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: JsonNeoDetailPageBuilder.kType,
        );

  final JsonWidgetData summary;

  final JsonWidgetData tabs;
}

class JsonNeoDetailPageBuilderModel extends JsonWidgetBuilderModel {
  const JsonNeoDetailPageBuilderModel(
    super.args, {
    required this.summary,
    required this.tabs,
  });

  final JsonWidgetData summary;

  final JsonWidgetData tabs;

  static JsonNeoDetailPageBuilderModel fromDynamic(
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
        '[JsonNeoDetailPageBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static JsonNeoDetailPageBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    JsonNeoDetailPageBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is JsonNeoDetailPageBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = JsonNeoDetailPageBuilderModel(
          args,
          summary: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['summary'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [summary].');
            }
            return parsed;
          }(),
          tabs: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['tabs'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [tabs].');
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
      'summary': summary.toJson(),
      'tabs': tabs.toJson(),
      ...args,
    });
  }
}

class NeoDetailPageSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_example/neo_detail_page.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': '_NeoDetailPage',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'summary': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'tabs': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
    },
  };
}
