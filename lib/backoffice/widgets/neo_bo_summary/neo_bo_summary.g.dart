// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_bo_summary.dart';

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

class NeoBoSummary extends _NeoBoSummary {
  const NeoBoSummary({required super.args});

  static const kType = 'neo_bo_summary_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoBoSummary fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoBoSummary(
        args: map,
      );

  @override
  NeoBoSummaryModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoBoSummaryModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoBoSummaryWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoBoSummaryWidget(
      description: model.description,
      key: key,
      name: model.name,
    );
  }
}

class JsonNeoBoSummaryWidget extends JsonWidgetData {
  JsonNeoBoSummaryWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.description,
    required this.name,
  }) : super(
          jsonWidgetArgs: NeoBoSummaryModel.fromDynamic(
            {
              'description': description,
              'name': name,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoBoSummary(
            args: NeoBoSummaryModel.fromDynamic(
              {
                'description': description,
                'name': name,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoBoSummary.kType,
        );

  final String? description;

  final String name;
}

class NeoBoSummaryModel extends JsonWidgetBuilderModel {
  const NeoBoSummaryModel(
    super.args, {
    this.description,
    required this.name,
  });

  final String? description;

  final String name;

  static NeoBoSummaryModel fromDynamic(
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
        '[NeoBoSummary]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoBoSummaryModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoBoSummaryModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoBoSummaryModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoBoSummaryModel(
          args,
          description: map['description'],
          name: map['name'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'description': description,
      'name': name,
      ...args,
    });
  }
}

class NeoBoSummaryWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_bo_summary_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoBoSummaryWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'description': SchemaHelper.stringSchema,
      'name': SchemaHelper.stringSchema,
    },
  };
}
