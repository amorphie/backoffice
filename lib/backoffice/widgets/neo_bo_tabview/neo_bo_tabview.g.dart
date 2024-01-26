// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_bo_tabview.dart';

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

class JsonNeoBoTabviewBuilder extends _JsonNeoBoTabviewBuilder {
  const JsonNeoBoTabviewBuilder({required super.args});

  static const kType = 'neo_bo_tabview';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static JsonNeoBoTabviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      JsonNeoBoTabviewBuilder(
        args: map,
      );

  @override
  JsonNeoBoTabviewBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = JsonNeoBoTabviewBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  _NeoBoTabview buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return _NeoBoTabview(
      childBuilder: childBuilder,
      model: model,
      title: model.title,
      children: model.children,
    );
  }
}

class JsonNeoBoTabview extends JsonWidgetData {
  JsonNeoBoTabview({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.title,
    this.children,
  }) : super(
          jsonWidgetArgs: JsonNeoBoTabviewBuilderModel.fromDynamic(
            {
              'title': title,
              'children': children,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => JsonNeoBoTabviewBuilder(
            args: JsonNeoBoTabviewBuilderModel.fromDynamic(
              {
                'title': title,
                'children': children,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: JsonNeoBoTabviewBuilder.kType,
        );

  final JsonWidgetData title;

  final List<JsonWidgetData>? children;
}

class JsonNeoBoTabviewBuilderModel extends JsonWidgetBuilderModel {
  const JsonNeoBoTabviewBuilderModel(
    super.args, {
    required this.title,
    this.children,
  });

  final JsonWidgetData title;

  final List<JsonWidgetData>? children;

  static JsonNeoBoTabviewBuilderModel fromDynamic(
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
        '[JsonNeoBoTabviewBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static JsonNeoBoTabviewBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    JsonNeoBoTabviewBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is JsonNeoBoTabviewBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = JsonNeoBoTabviewBuilderModel(
          args,
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
          children: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamicList(
              map['children'],
              registry: registry,
            );

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
      'title': title.toJson(),
      'children': JsonClass.maybeToJsonList(children),
      ...args,
    });
  }
}

class NeoBoTabviewSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/register_test/neo_bo_tabview.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': '_NeoBoTabview',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'title': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'children': SchemaHelper.arraySchema(JsonWidgetDataSchema.id),
    },
  };
}
