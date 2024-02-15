// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_account_widget_builder.dart';

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

class NeoAccountWidgetBuilder extends _NeoAccountWidgetBuilder {
  const NeoAccountWidgetBuilder({required super.args});

  static const kType = 'neo_account_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoAccountWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoAccountWidgetBuilder(
        args: map,
      );

  @override
  NeoAccountWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoAccountWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoAccountWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoAccountWidget(
      amount: model.amount,
      currency: model.currency,
      iconUrn: model.iconUrn,
      isSelected: model.isSelected,
      key: key,
      name: model.name,
      number: model.number,
      suffix: model.suffix,
      type: model.type,
    );
  }
}

class JsonNeoAccountWidget extends JsonWidgetData {
  JsonNeoAccountWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.amount,
    required this.currency,
    this.iconUrn,
    this.isSelected = false,
    required this.name,
    required this.number,
    required this.suffix,
    required this.type,
  }) : super(
          jsonWidgetArgs: NeoAccountWidgetBuilderModel.fromDynamic(
            {
              'amount': amount,
              'currency': currency,
              'iconUrn': iconUrn,
              'isSelected': isSelected,
              'name': name,
              'number': number,
              'suffix': suffix,
              'type': type,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoAccountWidgetBuilder(
            args: NeoAccountWidgetBuilderModel.fromDynamic(
              {
                'amount': amount,
                'currency': currency,
                'iconUrn': iconUrn,
                'isSelected': isSelected,
                'name': name,
                'number': number,
                'suffix': suffix,
                'type': type,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoAccountWidgetBuilder.kType,
        );

  final double amount;

  final String currency;

  final String? iconUrn;

  final bool isSelected;

  final String name;

  final String number;

  final String suffix;

  final String type;
}

class NeoAccountWidgetBuilderModel extends JsonWidgetBuilderModel {
  const NeoAccountWidgetBuilderModel(
    super.args, {
    required this.amount,
    required this.currency,
    this.iconUrn,
    this.isSelected = false,
    required this.name,
    required this.number,
    required this.suffix,
    required this.type,
  });

  final double amount;

  final String currency;

  final String? iconUrn;

  final bool isSelected;

  final String name;

  final String number;

  final String suffix;

  final String type;

  static NeoAccountWidgetBuilderModel fromDynamic(
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
        '[NeoAccountWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoAccountWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoAccountWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoAccountWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoAccountWidgetBuilderModel(
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
          currency: map['currency'],
          iconUrn: map['iconUrn'],
          isSelected: JsonClass.parseBool(
            map['isSelected'],
            whenNull: false,
          ),
          name: map['name'],
          number: map['number'],
          suffix: map['suffix'],
          type: map['type'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'amount': amount,
      'currency': currency,
      'iconUrn': iconUrn,
      'isSelected': false == isSelected ? null : isSelected,
      'name': name,
      'number': number,
      'suffix': suffix,
      'type': type,
      ...args,
    });
  }
}

class NeoAccountWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_account_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoAccountWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'amount': SchemaHelper.numberSchema,
      'currency': SchemaHelper.stringSchema,
      'iconUrn': SchemaHelper.stringSchema,
      'isSelected': SchemaHelper.boolSchema,
      'name': SchemaHelper.stringSchema,
      'number': SchemaHelper.stringSchema,
      'suffix': SchemaHelper.stringSchema,
      'type': SchemaHelper.stringSchema,
    },
  };
}
