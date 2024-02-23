// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_amount_widget_builder.dart';

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

class NeoAmountWidgetBuilder extends _NeoAmountWidgetBuilder {
  const NeoAmountWidgetBuilder({required super.args});

  static const kType = 'neo_amount_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoAmountWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoAmountWidgetBuilder(
        args: map,
      );

  @override
  NeoAmountWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoAmountWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoAmountWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final precisionStyleDecoded = _decodePrecisionStyle(
      value: model.precisionStyle,
    );
    final styleDecoded = _decodeStyle(
      value: model.style,
    );
    final symbolStyleDecoded = _decodeSymbolStyle(
      value: model.symbolStyle,
    );

    return NeoAmountWidget(
      amount: model.amount,
      key: key,
      precision: model.precision,
      precisionStyle: precisionStyleDecoded,
      style: styleDecoded,
      symbol: model.symbol,
      symbolStyle: symbolStyleDecoded,
    );
  }
}

class JsonNeoAmountWidget extends JsonWidgetData {
  JsonNeoAmountWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.amount,
    this.precision = 2,
    required this.precisionStyle,
    required this.style,
    this.symbol,
    required this.symbolStyle,
  }) : super(
          jsonWidgetArgs: NeoAmountWidgetBuilderModel.fromDynamic(
            {
              'amount': amount,
              'precision': precision,
              'precisionStyle': precisionStyle,
              'style': style,
              'symbol': symbol,
              'symbolStyle': symbolStyle,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoAmountWidgetBuilder(
            args: NeoAmountWidgetBuilderModel.fromDynamic(
              {
                'amount': amount,
                'precision': precision,
                'precisionStyle': precisionStyle,
                'style': style,
                'symbol': symbol,
                'symbolStyle': symbolStyle,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoAmountWidgetBuilder.kType,
        );

  final double amount;

  final int precision;

  final dynamic precisionStyle;

  final dynamic style;

  final String? symbol;

  final dynamic symbolStyle;
}

class NeoAmountWidgetBuilderModel extends JsonWidgetBuilderModel {
  const NeoAmountWidgetBuilderModel(
    super.args, {
    required this.amount,
    this.precision = 2,
    required this.precisionStyle,
    required this.style,
    this.symbol,
    required this.symbolStyle,
  });

  final double amount;

  final int precision;

  final dynamic precisionStyle;

  final dynamic style;

  final String? symbol;

  final dynamic symbolStyle;

  static NeoAmountWidgetBuilderModel fromDynamic(
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
        '[NeoAmountWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoAmountWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoAmountWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoAmountWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoAmountWidgetBuilderModel(
          args,
          amount: () {
            dynamic parsed = JsonClass.parseDouble(map['amount']);

            if (parsed == null) {
              throw Exception(
                'Null value encountered for required parameter: [amount].',
              );
            }
            return parsed;
          }(),
          precision: () {
            dynamic parsed = JsonClass.maybeParseInt(map['precision']);

            parsed ??= 2;

            return parsed;
          }(),
          precisionStyle: map['precisionStyle'],
          style: map['style'],
          symbol: map['symbol'],
          symbolStyle: map['symbolStyle'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'amount': amount,
      'precision': 2 == precision ? null : precision,
      'precisionStyle': NeoTextStyles.defaultTextStyle == precisionStyle
          ? null
          : ThemeEncoder.encodeTextStyle(
              precisionStyle,
            ),
      'style': NeoTextStyles.defaultTextStyle == style
          ? null
          : ThemeEncoder.encodeTextStyle(
              style,
            ),
      'symbol': symbol,
      'symbolStyle': NeoTextStyles.defaultTextStyle == symbolStyle
          ? null
          : ThemeEncoder.encodeTextStyle(
              symbolStyle,
            ),
      ...args,
    });
  }
}

class NeoAmountWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_amount_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoAmountWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'amount': SchemaHelper.numberSchema,
      'precision': SchemaHelper.numberSchema,
      'precisionStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'style': SchemaHelper.objectSchema(TextStyleSchema.id),
      'symbol': SchemaHelper.stringSchema,
      'symbolStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
