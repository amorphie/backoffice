// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_swipe_card_builder.dart';

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

class NeoSwipeCardBuilder extends _NeoSwipeCardBuilder {
  const NeoSwipeCardBuilder({required super.args});

  static const kType = 'neo_swipe_card';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoSwipeCardBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoSwipeCardBuilder(
        args: map,
      );

  @override
  NeoSwipeCardBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoSwipeCardBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoSwipeCard buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoSwipeCard(
      cards: [
        for (var d in model.cards)
          d.build(
            childBuilder: childBuilder,
            context: context,
          ),
      ],
      displayDotIndicator: model.displayDotIndicator,
      key: key,
      padding: model.padding,
    );
  }
}

class JsonNeoSwipeCard extends JsonWidgetData {
  JsonNeoSwipeCard({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.cards,
    this.displayDotIndicator = true,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs: NeoSwipeCardBuilderModel.fromDynamic(
            {
              'cards': cards,
              'displayDotIndicator': displayDotIndicator,
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoSwipeCardBuilder(
            args: NeoSwipeCardBuilderModel.fromDynamic(
              {
                'cards': cards,
                'displayDotIndicator': displayDotIndicator,
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoSwipeCardBuilder.kType,
        );

  final List<JsonWidgetData> cards;

  final bool displayDotIndicator;

  final EdgeInsetsDirectional padding;
}

class NeoSwipeCardBuilderModel extends JsonWidgetBuilderModel {
  const NeoSwipeCardBuilderModel(
    super.args, {
    required this.cards,
    this.displayDotIndicator = true,
    this.padding = EdgeInsetsDirectional.zero,
  });

  final List<JsonWidgetData> cards;

  final bool displayDotIndicator;

  final EdgeInsetsDirectional padding;

  static NeoSwipeCardBuilderModel fromDynamic(
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
        '[NeoSwipeCardBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoSwipeCardBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoSwipeCardBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoSwipeCardBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoSwipeCardBuilderModel(
          args,
          cards: () {
            dynamic parsed = JsonWidgetData.fromDynamicList(
              map['cards'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [cards].');
            }
            return parsed;
          }(),
          displayDotIndicator: JsonClass.parseBool(
            map['displayDotIndicator'],
            whenNull: true,
          ),
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

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
      'cards': JsonClass.toJsonList(cards),
      'displayDotIndicator':
          true == displayDotIndicator ? null : displayDotIndicator,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      ...args,
    });
  }
}

class NeoSwipeCardSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_swipe_card.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoSwipeCard',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'cards': SchemaHelper.arraySchema(JsonWidgetDataSchema.id),
      'displayDotIndicator': SchemaHelper.boolSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
