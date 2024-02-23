// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_checkbox_group_widget_builder.dart';

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

class NeoCheckboxGroupWidgetBuilder extends _NeoCheckboxGroupWidgetBuilder {
  const NeoCheckboxGroupWidgetBuilder({required super.args});

  static const kType = 'neo_checkbox_group_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoCheckboxGroupWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoCheckboxGroupWidgetBuilder(
        args: map,
      );

  @override
  NeoCheckboxGroupWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoCheckboxGroupWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoCheckboxGroupWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final itemsDecoded = _decodeBottomNavigationModelList(
      data: data,
    );

    return NeoCheckboxGroupWidget(
      items: itemsDecoded,
      key: key,
    );
  }
}

class JsonNeoCheckboxGroupWidget extends JsonWidgetData {
  JsonNeoCheckboxGroupWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.items,
  }) : super(
          jsonWidgetArgs: NeoCheckboxGroupWidgetBuilderModel.fromDynamic(
            {
              'items': items,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoCheckboxGroupWidgetBuilder(
            args: NeoCheckboxGroupWidgetBuilderModel.fromDynamic(
              {
                'items': items,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoCheckboxGroupWidgetBuilder.kType,
        );

  final dynamic items;
}

class NeoCheckboxGroupWidgetBuilderModel extends JsonWidgetBuilderModel {
  const NeoCheckboxGroupWidgetBuilderModel(
    super.args, {
    required this.items,
  });

  final dynamic items;

  static NeoCheckboxGroupWidgetBuilderModel fromDynamic(
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
        '[NeoCheckboxGroupWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoCheckboxGroupWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoCheckboxGroupWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoCheckboxGroupWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoCheckboxGroupWidgetBuilderModel(
          args,
          items: map['items'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'items': items,
      ...args,
    });
  }
}

class NeoCheckboxGroupWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_checkbox_group_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoCheckboxGroupWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'items': SchemaHelper.anySchema,
    },
  };
}
