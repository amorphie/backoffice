// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_bo_expanded_row.dart';

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

class NeoBoExpandedRow extends _NeoBoExpandedRow {
  const NeoBoExpandedRow({required super.args});

  static const kType = 'neo_bo_expanded_row_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoBoExpandedRow fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoBoExpandedRow(
        args: map,
      );

  @override
  NeoBoExpandedRowModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoBoExpandedRowModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoBoExpandedRowWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoBoExpandedRowWidget(
      data: model.data,
      isTitle: model.isTitle,
      key: key,
    );
  }
}

class JsonNeoBoExpandedRowWidget extends JsonWidgetData {
  JsonNeoBoExpandedRowWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.data,
    this.isTitle = false,
  }) : super(
          jsonWidgetArgs: NeoBoExpandedRowModel.fromDynamic(
            {
              'data': data,
              'isTitle': isTitle,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoBoExpandedRow(
            args: NeoBoExpandedRowModel.fromDynamic(
              {
                'data': data,
                'isTitle': isTitle,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoBoExpandedRow.kType,
        );

  final List<dynamic> data;

  final bool isTitle;
}

class NeoBoExpandedRowModel extends JsonWidgetBuilderModel {
  const NeoBoExpandedRowModel(
    super.args, {
    required this.data,
    this.isTitle = false,
  });

  final List<dynamic> data;

  final bool isTitle;

  static NeoBoExpandedRowModel fromDynamic(
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
        '[NeoBoExpandedRow]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoBoExpandedRowModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoBoExpandedRowModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoBoExpandedRowModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoBoExpandedRowModel(
          args,
          data: map['data'],
          isTitle: JsonClass.parseBool(
            map['isTitle'],
            whenNull: false,
          ),
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'data': data,
      'isTitle': false == isTitle ? null : isTitle,
      ...args,
    });
  }
}

class NeoBoExpandedRowWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_bo_expanded_row_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoBoExpandedRowWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'data': SchemaHelper.anySchema,
      'isTitle': SchemaHelper.boolSchema,
    },
  };
}
