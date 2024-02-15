// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_expandable_information_card_builder.dart';

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

class NeoExpandableInformationCardBuilder
    extends _NeoExpandableInformationCardBuilder {
  const NeoExpandableInformationCardBuilder({required super.args});

  static const kType = 'neo_expandable_information_card';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoExpandableInformationCardBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoExpandableInformationCardBuilder(
        args: map,
      );

  @override
  NeoExpandableInformationCardBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoExpandableInformationCardBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoExpandableInformationCard buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoExpandableInformationCard(
      collapseButtonText: model.collapseButtonText,
      collapsedWidget: model.collapsedWidget.build(
        childBuilder: childBuilder,
        context: context,
      ),
      displayMode: model.displayMode,
      expandButtonText: model.expandButtonText,
      expandedWidget: model.expandedWidget.build(
        childBuilder: childBuilder,
        context: context,
      ),
      key: key,
    );
  }
}

class JsonNeoExpandableInformationCard extends JsonWidgetData {
  JsonNeoExpandableInformationCard({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.collapseButtonText,
    required this.collapsedWidget,
    required this.displayMode,
    required this.expandButtonText,
    required this.expandedWidget,
  }) : super(
          jsonWidgetArgs: NeoExpandableInformationCardBuilderModel.fromDynamic(
            {
              'collapseButtonText': collapseButtonText,
              'collapsedWidget': collapsedWidget,
              'displayMode': displayMode,
              'expandButtonText': expandButtonText,
              'expandedWidget': expandedWidget,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoExpandableInformationCardBuilder(
            args: NeoExpandableInformationCardBuilderModel.fromDynamic(
              {
                'collapseButtonText': collapseButtonText,
                'collapsedWidget': collapsedWidget,
                'displayMode': displayMode,
                'expandButtonText': expandButtonText,
                'expandedWidget': expandedWidget,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoExpandableInformationCardBuilder.kType,
        );

  final String collapseButtonText;

  final JsonWidgetData collapsedWidget;

  final NeoInformationCardDisplayMode displayMode;

  final String expandButtonText;

  final JsonWidgetData expandedWidget;
}

class NeoExpandableInformationCardBuilderModel extends JsonWidgetBuilderModel {
  const NeoExpandableInformationCardBuilderModel(
    super.args, {
    required this.collapseButtonText,
    required this.collapsedWidget,
    required this.displayMode,
    required this.expandButtonText,
    required this.expandedWidget,
  });

  final String collapseButtonText;

  final JsonWidgetData collapsedWidget;

  final NeoInformationCardDisplayMode displayMode;

  final String expandButtonText;

  final JsonWidgetData expandedWidget;

  static NeoExpandableInformationCardBuilderModel fromDynamic(
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
        '[NeoExpandableInformationCardBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoExpandableInformationCardBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoExpandableInformationCardBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoExpandableInformationCardBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoExpandableInformationCardBuilderModel(
          args,
          collapseButtonText: map['collapseButtonText'],
          collapsedWidget: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['collapsedWidget'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [collapsedWidget].');
            }
            return parsed;
          }(),
          displayMode: map['displayMode'],
          expandButtonText: map['expandButtonText'],
          expandedWidget: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['expandedWidget'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [expandedWidget].');
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
      'collapseButtonText': collapseButtonText,
      'collapsedWidget': collapsedWidget.toJson(),
      'displayMode': displayMode,
      'expandButtonText': expandButtonText,
      'expandedWidget': expandedWidget.toJson(),
      ...args,
    });
  }
}

class NeoExpandableInformationCardSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_expandable_information_card.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoExpandableInformationCard',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'collapseButtonText': SchemaHelper.stringSchema,
      'collapsedWidget': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'displayMode': SchemaHelper.anySchema,
      'expandButtonText': SchemaHelper.stringSchema,
      'expandedWidget': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
    },
  };
}
