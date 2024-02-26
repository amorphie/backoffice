// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_bo_datagrid.dart';

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

class NeoBoDatagrid extends _NeoBoDatagrid {
  const NeoBoDatagrid({required super.args});

  static const kType = 'neo_bo_datagrid_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoBoDatagrid fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoBoDatagrid(
        args: map,
      );

  @override
  NeoBoDatagridModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoBoDatagridModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoBoDatagridWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoBoDatagridWidget(
      columns: model.columns,
      data: model.data,
      key: key,
      title: model.title,
    );
  }
}

class JsonNeoBoDatagridWidget extends JsonWidgetData {
  JsonNeoBoDatagridWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.columns,
    required this.data,
    required this.title,
  }) : super(
          jsonWidgetArgs: NeoBoDatagridModel.fromDynamic(
            {
              'columns': columns,
              'data': data,
              'title': title,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoBoDatagrid(
            args: NeoBoDatagridModel.fromDynamic(
              {
                'columns': columns,
                'data': data,
                'title': title,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoBoDatagrid.kType,
        );

  final Map<String, dynamic> columns;

  final List<Map<String, dynamic>> data;

  final String title;
}

class NeoBoDatagridModel extends JsonWidgetBuilderModel {
  const NeoBoDatagridModel(
    super.args, {
    required this.columns,
    required this.data,
    required this.title,
  });

  final Map<String, dynamic> columns;

  final List<Map<String, dynamic>> data;

  final String title;

  static NeoBoDatagridModel fromDynamic(
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
        '[NeoBoDatagrid]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoBoDatagridModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoBoDatagridModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoBoDatagridModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoBoDatagridModel(
          args,
          columns: map['columns'],
          data: map['data'],
          title: map['title'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'columns': columns,
      'data': data,
      'title': title,
      ...args,
    });
  }
}

class NeoBoDatagridWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_bo_datagrid_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoBoDatagridWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'columns': SchemaHelper.anySchema,
      'data': SchemaHelper.anySchema,
      'title': SchemaHelper.stringSchema,
    },
  };
}
