// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_hypertext_builder.dart';

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

class NeoHypertextWidgetBuilder extends _NeoHypertextWidgetBuilder {
  const NeoHypertextWidgetBuilder({required super.args});

  static const kType = 'neo_hypertext';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoHypertextWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoHypertextWidgetBuilder(
        args: map,
      );

  @override
  NeoHypertextWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoHypertextWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoHypertext buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final highlightedItemsDecoded = _decodeHighlightedItemtList(
      data: data,
    );
    final styleDecoded = _decodeStyle(
      value: model.style,
    );

    return NeoHypertext(
      highlightedItems: highlightedItemsDecoded,
      key: key,
      padding: model.padding,
      style: styleDecoded,
      text: model.text,
      textAlign: model.textAlign,
      textColor: model.textColor,
    );
  }
}

class JsonNeoHypertext extends JsonWidgetData {
  JsonNeoHypertext({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.highlightedItems,
    this.padding = EdgeInsetsDirectional.zero,
    required this.style,
    required this.text,
    this.textAlign = TextAlign.start,
    this.textColor,
  }) : super(
          jsonWidgetArgs: NeoHypertextWidgetBuilderModel.fromDynamic(
            {
              'highlightedItems': highlightedItems,
              'padding': padding,
              'style': style,
              'text': text,
              'textAlign': textAlign,
              'textColor': textColor,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoHypertextWidgetBuilder(
            args: NeoHypertextWidgetBuilderModel.fromDynamic(
              {
                'highlightedItems': highlightedItems,
                'padding': padding,
                'style': style,
                'text': text,
                'textAlign': textAlign,
                'textColor': textColor,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoHypertextWidgetBuilder.kType,
        );

  final dynamic highlightedItems;

  final EdgeInsetsDirectional padding;

  final dynamic style;

  final String text;

  final TextAlign textAlign;

  final Color? textColor;
}

class NeoHypertextWidgetBuilderModel extends JsonWidgetBuilderModel {
  const NeoHypertextWidgetBuilderModel(
    super.args, {
    required this.highlightedItems,
    this.padding = EdgeInsetsDirectional.zero,
    required this.style,
    required this.text,
    this.textAlign = TextAlign.start,
    this.textColor,
  });

  final dynamic highlightedItems;

  final EdgeInsetsDirectional padding;

  final dynamic style;

  final String text;

  final TextAlign textAlign;

  final Color? textColor;

  static NeoHypertextWidgetBuilderModel fromDynamic(
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
        '[NeoHypertextWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoHypertextWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoHypertextWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoHypertextWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoHypertextWidgetBuilderModel(
          args,
          highlightedItems: map['highlightedItems'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          style: map['style'],
          text: map['text'],
          textAlign: () {
            dynamic parsed = ThemeDecoder.decodeTextAlign(
              map['textAlign'],
              validate: false,
            );
            parsed ??= TextAlign.start;

            return parsed;
          }(),
          textColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['textColor'],
              validate: false,
            );

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
      'highlightedItems': highlightedItems,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'style': ThemeEncoder.encodeTextStyle(
        style,
      ),
      'text': text,
      'textAlign': TextAlign.start == textAlign
          ? null
          : ThemeEncoder.encodeTextAlign(
              textAlign,
            ),
      'textColor': ThemeEncoder.encodeColor(
        textColor,
      ),
      ...args,
    });
  }
}

class NeoHypertextSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_hypertext.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoHypertext',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'highlightedItems': SchemaHelper.anySchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'style': SchemaHelper.objectSchema(TextStyleSchema.id),
      'text': SchemaHelper.stringSchema,
      'textAlign': SchemaHelper.objectSchema(TextAlignSchema.id),
      'textColor': SchemaHelper.objectSchema(ColorSchema.id),
    },
  };
}
