// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_bo_listview.dart';

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

class NeoBoListview extends _NeoBoListview {
  const NeoBoListview({required super.args});

  static const kType = 'neo_bo_list_view';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoBoListview fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoBoListview(
        args: map,
      );

  @override
  NeoBoListviewModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoBoListviewModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoBoListView buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoBoListView(
      key: key,
      title: model.title,
    );
  }
}

class JsonNeoBoListView extends JsonWidgetData {
  JsonNeoBoListView({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.title,
  }) : super(
          jsonWidgetArgs: NeoBoListviewModel.fromDynamic(
            {
              'title': title,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoBoListview(
            args: NeoBoListviewModel.fromDynamic(
              {
                'title': title,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoBoListview.kType,
        );

  final String title;
}

class NeoBoListviewModel extends JsonWidgetBuilderModel {
  const NeoBoListviewModel(
    super.args, {
    required this.title,
  });

  final String title;

  static NeoBoListviewModel fromDynamic(
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
        '[NeoBoListview]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoBoListviewModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoBoListviewModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoBoListviewModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoBoListviewModel(
          args,
          title: map['title'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'title': title,
      ...args,
    });
  }
}

class NeoBoListViewSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_example/neo_bo_list_view.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoBoListView',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'title': SchemaHelper.stringSchema,
    },
  };
}
