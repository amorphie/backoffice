// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_bo_datatable.dart';

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

class NeoBoDatatable extends _NeoBoDatatable {
  const NeoBoDatatable({required super.args});

  static const kType = 'neo_bo_paginated_datatable_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoBoDatatable fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoBoDatatable(
        args: map,
      );

  @override
  NeoBoDatatableModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoBoDatatableModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoBoPaginatedDatatableWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoBoPaginatedDatatableWidget(
      columns: model.columns,
      data: model.data,
      key: key,
      onFinish: model.onFinish,
      onPressed: model.onPressed,
      onRowsPerPageChanged: model.onRowsPerPageChanged,
      onSort: model.onSort,
      rowsPerPage: model.rowsPerPage,
      sortAscending: model.sortAscending,
      sortColumnIndex: model.sortColumnIndex,
      sortableColumns: model.sortableColumns,
      title: model.title,
    );
  }
}

class JsonNeoBoPaginatedDatatableWidget extends JsonWidgetData {
  JsonNeoBoPaginatedDatatableWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.columns,
    required this.data,
    required this.onFinish,
    required this.onPressed,
    required this.onRowsPerPageChanged,
    this.onSort,
    required this.rowsPerPage,
    this.sortAscending = true,
    this.sortColumnIndex,
    this.sortableColumns = const [],
    required this.title,
  }) : super(
          jsonWidgetArgs: NeoBoDatatableModel.fromDynamic(
            {
              'columns': columns,
              'data': data,
              'onFinish': onFinish,
              'onPressed': onPressed,
              'onRowsPerPageChanged': onRowsPerPageChanged,
              'onSort': onSort,
              'rowsPerPage': rowsPerPage,
              'sortAscending': sortAscending,
              'sortColumnIndex': sortColumnIndex,
              'sortableColumns': sortableColumns,
              'title': title,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoBoDatatable(
            args: NeoBoDatatableModel.fromDynamic(
              {
                'columns': columns,
                'data': data,
                'onFinish': onFinish,
                'onPressed': onPressed,
                'onRowsPerPageChanged': onRowsPerPageChanged,
                'onSort': onSort,
                'rowsPerPage': rowsPerPage,
                'sortAscending': sortAscending,
                'sortColumnIndex': sortColumnIndex,
                'sortableColumns': sortableColumns,
                'title': title,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoBoDatatable.kType,
        );

  final List<NeoBoSearchColumn> columns;

  final List<Map<String, dynamic>> data;

  final dynamic Function() onFinish;

  final dynamic Function(Map<String, dynamic>) onPressed;

  final dynamic Function(int) onRowsPerPageChanged;

  final dynamic Function(String)? onSort;

  final int rowsPerPage;

  final bool sortAscending;

  final int? sortColumnIndex;

  final List<String> sortableColumns;

  final dynamic title;
}

class NeoBoDatatableModel extends JsonWidgetBuilderModel {
  const NeoBoDatatableModel(
    super.args, {
    required this.columns,
    required this.data,
    required this.onFinish,
    required this.onPressed,
    required this.onRowsPerPageChanged,
    this.onSort,
    required this.rowsPerPage,
    this.sortAscending = true,
    this.sortColumnIndex,
    this.sortableColumns = const [],
    required this.title,
  });

  final List<NeoBoSearchColumn> columns;

  final List<Map<String, dynamic>> data;

  final dynamic Function() onFinish;

  final dynamic Function(Map<String, dynamic>) onPressed;

  final dynamic Function(int) onRowsPerPageChanged;

  final dynamic Function(String)? onSort;

  final int rowsPerPage;

  final bool sortAscending;

  final int? sortColumnIndex;

  final List<String> sortableColumns;

  final dynamic title;

  static NeoBoDatatableModel fromDynamic(
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
        '[NeoBoDatatable]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoBoDatatableModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoBoDatatableModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoBoDatatableModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoBoDatatableModel(
          args,
          columns: map['columns'],
          data: map['data'],
          onFinish: map['onFinish'],
          onPressed: map['onPressed'],
          onRowsPerPageChanged: map['onRowsPerPageChanged'],
          onSort: map['onSort'],
          rowsPerPage: () {
            dynamic parsed = JsonClass.parseInt(map['rowsPerPage']);

            if (parsed == null) {
              throw Exception(
                'Null value encountered for required parameter: [rowsPerPage].',
              );
            }
            return parsed;
          }(),
          sortAscending: JsonClass.parseBool(
            map['sortAscending'],
            whenNull: true,
          ),
          sortColumnIndex: () {
            dynamic parsed = JsonClass.maybeParseInt(map['sortColumnIndex']);

            return parsed;
          }(),
          sortableColumns: map['sortableColumns'] ?? const [],
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
      'onFinish': onFinish,
      'onPressed': onPressed,
      'onRowsPerPageChanged': onRowsPerPageChanged,
      'onSort': onSort,
      'rowsPerPage': rowsPerPage,
      'sortAscending': true == sortAscending ? null : sortAscending,
      'sortColumnIndex': sortColumnIndex,
      'sortableColumns': const [] == sortableColumns ? null : sortableColumns,
      'title': title,
      ...args,
    });
  }
}

class NeoBoPaginatedDatatableWidgetSchema {
  static const id = 'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_bo_paginated_datatable_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoBoPaginatedDatatableWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'columns': SchemaHelper.anySchema,
      'data': SchemaHelper.anySchema,
      'onFinish': SchemaHelper.anySchema,
      'onPressed': SchemaHelper.anySchema,
      'onRowsPerPageChanged': SchemaHelper.anySchema,
      'onSort': SchemaHelper.anySchema,
      'rowsPerPage': SchemaHelper.numberSchema,
      'sortAscending': SchemaHelper.boolSchema,
      'sortColumnIndex': SchemaHelper.numberSchema,
      'sortableColumns': SchemaHelper.anySchema,
      'title': SchemaHelper.anySchema,
    },
  };
}
