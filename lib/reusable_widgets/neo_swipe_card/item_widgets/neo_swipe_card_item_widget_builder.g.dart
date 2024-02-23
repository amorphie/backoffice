// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_swipe_card_item_widget_builder.dart';

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

class NeoSwipeCardItemWidgetBuilder extends _NeoSwipeCardItemWidgetBuilder {
  const NeoSwipeCardItemWidgetBuilder({required super.args});

  static const kType = 'neo_swipe_card_item_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoSwipeCardItemWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoSwipeCardItemWidgetBuilder(
        args: map,
      );

  @override
  NeoSwipeCardItemWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoSwipeCardItemWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoSwipeCardItemWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoSwipeCardItemWidget(
      card: model.card.build(
        childBuilder: childBuilder,
        context: context,
      ),
      dataValue: model.dataValue,
      key: key,
      padding: model.padding,
    );
  }
}

class JsonNeoSwipeCardItemWidget extends JsonWidgetData {
  JsonNeoSwipeCardItemWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.card,
    this.dataValue = "",
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs: NeoSwipeCardItemWidgetBuilderModel.fromDynamic(
            {
              'card': card,
              'dataValue': dataValue,
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoSwipeCardItemWidgetBuilder(
            args: NeoSwipeCardItemWidgetBuilderModel.fromDynamic(
              {
                'card': card,
                'dataValue': dataValue,
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoSwipeCardItemWidgetBuilder.kType,
        );

  final JsonWidgetData card;

  final String dataValue;

  final EdgeInsetsDirectional padding;
}

class NeoSwipeCardItemWidgetBuilderModel extends JsonWidgetBuilderModel {
  const NeoSwipeCardItemWidgetBuilderModel(
    super.args, {
    required this.card,
    this.dataValue = "",
    this.padding = EdgeInsetsDirectional.zero,
  });

  final JsonWidgetData card;

  final String dataValue;

  final EdgeInsetsDirectional padding;

  static NeoSwipeCardItemWidgetBuilderModel fromDynamic(
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
        '[NeoSwipeCardItemWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoSwipeCardItemWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoSwipeCardItemWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoSwipeCardItemWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoSwipeCardItemWidgetBuilderModel(
          args,
          card: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['card'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [card].');
            }
            return parsed;
          }(),
          dataValue: map['dataValue'] ?? "",
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
      'card': card.toJson(),
      'dataValue': "" == dataValue ? null : dataValue,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      ...args,
    });
  }
}

class NeoSwipeCardItemWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_swipe_card_item_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoSwipeCardItemWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'card': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'dataValue': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
