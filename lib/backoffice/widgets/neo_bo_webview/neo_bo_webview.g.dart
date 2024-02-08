// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_bo_webview.dart';

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

class NeoBoWebview extends _NeoBoWebview {
  const NeoBoWebview({required super.args});

  static const kType = 'json_neo_bo_web_view';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoBoWebview fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoBoWebview(
        args: map,
      );

  @override
  NeoBoWebviewModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoBoWebviewModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  _JsonNeoBoWebView buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return _JsonNeoBoWebView(
      childBuilder: childBuilder,
      source: model.source,
      type: model.type,
    );
  }
}

class JsonJsonNeoBoWebView extends JsonWidgetData {
  JsonJsonNeoBoWebView({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.source,
    required this.type,
  }) : super(
          jsonWidgetArgs: NeoBoWebviewModel.fromDynamic(
            {
              'source': source,
              'type': type,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoBoWebview(
            args: NeoBoWebviewModel.fromDynamic(
              {
                'source': source,
                'type': type,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoBoWebview.kType,
        );

  final String source;

  final String type;
}

class NeoBoWebviewModel extends JsonWidgetBuilderModel {
  const NeoBoWebviewModel(
    super.args, {
    required this.source,
    required this.type,
  });

  final String source;

  final String type;

  static NeoBoWebviewModel fromDynamic(
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
        '[NeoBoWebview]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoBoWebviewModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoBoWebviewModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoBoWebviewModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoBoWebviewModel(
          args,
          source: map['source'],
          type: map['type'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'source': source,
      'type': type,
      ...args,
    });
  }
}

class JsonNeoBoWebViewSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/json_neo_bo_web_view.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': '_JsonNeoBoWebView',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'source': SchemaHelper.stringSchema,
      'type': SchemaHelper.stringSchema,
    },
  };
}
