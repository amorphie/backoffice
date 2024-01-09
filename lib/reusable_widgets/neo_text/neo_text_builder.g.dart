// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_text_builder.dart';

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

class NeoTextBuilder extends _NeoTextBuilder {
  const NeoTextBuilder({required super.args});

  static const kType = 'neo_text';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoTextBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoTextBuilder(
        args: map,
      );

  @override
  NeoTextBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoTextBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoText buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final dataDecoded = _decodeText(
      value: model.data,
    );

    return NeoText(
      dataDecoded,
      dataKey: model.dataKey,
      key: key,
      locale: model.locale,
      maxLines: model.maxLines,
      overflow: model.overflow,
      padding: model.padding,
      selectionColor: model.selectionColor,
      semanticsLabel: model.semanticsLabel,
      softWrap: model.softWrap,
      strutStyle: model.strutStyle,
      style: model.style,
      textAlign: model.textAlign,
      textDirection: model.textDirection,
      textHeightBehavior: model.textHeightBehavior,
      textScaler: model.textScaler,
      textWidthBasis: model.textWidthBasis,
    );
  }
}

class JsonNeoText extends JsonWidgetData {
  JsonNeoText(
    this.data, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.dataKey,
    this.locale,
    this.maxLines,
    this.overflow,
    this.padding,
    this.selectionColor,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.style,
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaler,
    this.textWidthBasis,
  }) : super(
          jsonWidgetArgs: NeoTextBuilderModel.fromDynamic(
            {
              'text': data,
              'dataKey': dataKey,
              'locale': locale,
              'maxLines': maxLines,
              'overflow': overflow,
              'padding': padding,
              'selectionColor': selectionColor,
              'semanticsLabel': semanticsLabel,
              'softWrap': softWrap,
              'strutStyle': strutStyle,
              'style': style,
              'textAlign': textAlign,
              'textDirection': textDirection,
              'textHeightBehavior': textHeightBehavior,
              'textScaler': textScaler,
              'textWidthBasis': textWidthBasis,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoTextBuilder(
            args: NeoTextBuilderModel.fromDynamic(
              {
                'text': data,
                'dataKey': dataKey,
                'locale': locale,
                'maxLines': maxLines,
                'overflow': overflow,
                'padding': padding,
                'selectionColor': selectionColor,
                'semanticsLabel': semanticsLabel,
                'softWrap': softWrap,
                'strutStyle': strutStyle,
                'style': style,
                'textAlign': textAlign,
                'textDirection': textDirection,
                'textHeightBehavior': textHeightBehavior,
                'textScaler': textScaler,
                'textWidthBasis': textWidthBasis,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoTextBuilder.kType,
        );

  final dynamic data;

  final String? dataKey;

  final Locale? locale;

  final int? maxLines;

  final TextOverflow? overflow;

  final EdgeInsetsDirectional? padding;

  final Color? selectionColor;

  final String? semanticsLabel;

  final bool? softWrap;

  final StrutStyle? strutStyle;

  final TextStyle? style;

  final TextAlign? textAlign;

  final TextDirection? textDirection;

  final TextHeightBehavior? textHeightBehavior;

  final TextScaler? textScaler;

  final TextWidthBasis? textWidthBasis;
}

class NeoTextBuilderModel extends JsonWidgetBuilderModel {
  const NeoTextBuilderModel(
    super.args, {
    required this.data,
    this.dataKey,
    this.locale,
    this.maxLines,
    this.overflow,
    this.padding,
    this.selectionColor,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.style,
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaler,
    this.textWidthBasis,
  });

  final dynamic data;

  final String? dataKey;

  final Locale? locale;

  final int? maxLines;

  final TextOverflow? overflow;

  final EdgeInsetsDirectional? padding;

  final Color? selectionColor;

  final String? semanticsLabel;

  final bool? softWrap;

  final StrutStyle? strutStyle;

  final TextStyle? style;

  final TextAlign? textAlign;

  final TextDirection? textDirection;

  final TextHeightBehavior? textHeightBehavior;

  final TextScaler? textScaler;

  final TextWidthBasis? textWidthBasis;

  static NeoTextBuilderModel fromDynamic(
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
        '[NeoTextBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoTextBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoTextBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoTextBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoTextBuilderModel(
          args,
          data: map['text'],
          dataKey: map['dataKey'],
          locale: () {
            dynamic parsed = ThemeDecoder.decodeLocale(
              map['locale'],
              validate: false,
            );

            return parsed;
          }(),
          maxLines: () {
            dynamic parsed = JsonClass.maybeParseInt(map['maxLines']);

            return parsed;
          }(),
          overflow: () {
            dynamic parsed = ThemeDecoder.decodeTextOverflow(
              map['overflow'],
              validate: false,
            );

            return parsed;
          }(),
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );

            return parsed;
          }(),
          selectionColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['selectionColor'],
              validate: false,
            );

            return parsed;
          }(),
          semanticsLabel: map['semanticsLabel'],
          softWrap: JsonClass.maybeParseBool(
            map['softWrap'],
          ),
          strutStyle: () {
            dynamic parsed = ThemeDecoder.decodeStrutStyle(
              map['strutStyle'],
              validate: false,
            );

            return parsed;
          }(),
          style: () {
            dynamic parsed = ThemeDecoder.decodeTextStyle(
              map['style'],
              validate: false,
            );

            return parsed;
          }(),
          textAlign: () {
            dynamic parsed = ThemeDecoder.decodeTextAlign(
              map['textAlign'],
              validate: false,
            );

            return parsed;
          }(),
          textDirection: () {
            dynamic parsed = ThemeDecoder.decodeTextDirection(
              map['textDirection'],
              validate: false,
            );

            return parsed;
          }(),
          textHeightBehavior: () {
            dynamic parsed = ThemeDecoder.decodeTextHeightBehavior(
              map['textHeightBehavior'],
              validate: false,
            );

            return parsed;
          }(),
          textScaler: map['textScaler'],
          textWidthBasis: () {
            dynamic parsed = ThemeDecoder.decodeTextWidthBasis(
              map['textWidthBasis'],
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
      'data': data,
      'dataKey': dataKey,
      'locale': ThemeEncoder.encodeLocale(
        locale,
      ),
      'maxLines': maxLines,
      'overflow': ThemeEncoder.encodeTextOverflow(
        overflow,
      ),
      'padding': ThemeEncoder.encodeEdgeInsetsDirectional(
        padding,
      ),
      'selectionColor': ThemeEncoder.encodeColor(
        selectionColor,
      ),
      'semanticsLabel': semanticsLabel,
      'softWrap': softWrap,
      'strutStyle': ThemeEncoder.encodeStrutStyle(
        strutStyle,
      ),
      'style': ThemeEncoder.encodeTextStyle(
        style,
      ),
      'textAlign': ThemeEncoder.encodeTextAlign(
        textAlign,
      ),
      'textDirection': ThemeEncoder.encodeTextDirection(
        textDirection,
      ),
      'textHeightBehavior': ThemeEncoder.encodeTextHeightBehavior(
        textHeightBehavior,
      ),
      'textScaler': textScaler,
      'textWidthBasis': ThemeEncoder.encodeTextWidthBasis(
        textWidthBasis,
      ),
      ...args,
    });
  }
}

class NeoTextSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_text.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoText',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'text': SchemaHelper.stringSchema,
      'dataKey': SchemaHelper.stringSchema,
      'locale': SchemaHelper.objectSchema(LocaleSchema.id),
      'maxLines': SchemaHelper.numberSchema,
      'overflow': SchemaHelper.objectSchema(TextOverflowSchema.id),
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'selectionColor': SchemaHelper.objectSchema(ColorSchema.id),
      'semanticsLabel': SchemaHelper.stringSchema,
      'softWrap': SchemaHelper.boolSchema,
      'strutStyle': SchemaHelper.objectSchema(StrutStyleSchema.id),
      'style': SchemaHelper.objectSchema(TextStyleSchema.id),
      'textAlign': SchemaHelper.objectSchema(TextAlignSchema.id),
      'textDirection': SchemaHelper.objectSchema(TextDirectionSchema.id),
      'textHeightBehavior':
          SchemaHelper.objectSchema(TextHeightBehaviorSchema.id),
      'textScaler': SchemaHelper.anySchema,
      'textWidthBasis': SchemaHelper.objectSchema(TextWidthBasisSchema.id),
    },
  };
}
