// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brg_account_slider_widget_builder.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: deprecated_member_use

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class BrgAccountSliderWidgetBuilder extends _BrgAccountSliderWidgetBuilder {
  const BrgAccountSliderWidgetBuilder({required super.args});

  static const kType = 'brg_account_slider_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static BrgAccountSliderWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      BrgAccountSliderWidgetBuilder(
        args: map,
      );
  @override
  BrgAccountSliderWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = BrgAccountSliderWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  BrgAccountSliderWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return BrgAccountSliderWidget(
      accountBalance: model.accountBalance,
      availableBalance: model.availableBalance,
      branchDetails: model.branchDetails,
      iban: model.iban,
      key: key,
      openingDate: model.openingDate,
    );
  }
}

class JsonBrgAccountSliderWidget extends JsonWidgetData {
  JsonBrgAccountSliderWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.accountBalance,
    required this.availableBalance,
    required this.branchDetails,
    required this.iban,
    required this.openingDate,
  }) : super(
          jsonWidgetArgs: BrgAccountSliderWidgetBuilderModel.fromDynamic(
            {
              'accountBalance': accountBalance,
              'availableBalance': availableBalance,
              'branchDetails': branchDetails,
              'iban': iban,
              'openingDate': openingDate,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => BrgAccountSliderWidgetBuilder(
            args: BrgAccountSliderWidgetBuilderModel.fromDynamic(
              {
                'accountBalance': accountBalance,
                'availableBalance': availableBalance,
                'branchDetails': branchDetails,
                'iban': iban,
                'openingDate': openingDate,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: BrgAccountSliderWidgetBuilder.kType,
        );

  final String accountBalance;

  final String availableBalance;

  final String branchDetails;

  final String iban;

  final String openingDate;
}

class BrgAccountSliderWidgetBuilderModel extends JsonWidgetBuilderModel {
  const BrgAccountSliderWidgetBuilderModel(
    super.args, {
    required this.accountBalance,
    required this.availableBalance,
    required this.branchDetails,
    required this.iban,
    required this.openingDate,
  });

  final String accountBalance;

  final String availableBalance;

  final String branchDetails;

  final String iban;

  final String openingDate;

  static BrgAccountSliderWidgetBuilderModel fromDynamic(
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
        '[BrgAccountSliderWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static BrgAccountSliderWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    BrgAccountSliderWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is BrgAccountSliderWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = BrgAccountSliderWidgetBuilderModel(
          args,
          accountBalance: map['accountBalance'],
          availableBalance: map['availableBalance'],
          branchDetails: map['branchDetails'],
          iban: map['iban'],
          openingDate: map['openingDate'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'accountBalance': accountBalance,
      'availableBalance': availableBalance,
      'branchDetails': branchDetails,
      'iban': iban,
      'openingDate': openingDate,
      ...args,
    });
  }
}

class BrgAccountSliderWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/brg_account_slider_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'BrgAccountSliderWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'accountBalance': SchemaHelper.stringSchema,
      'availableBalance': SchemaHelper.stringSchema,
      'branchDetails': SchemaHelper.stringSchema,
      'iban': SchemaHelper.stringSchema,
      'openingDate': SchemaHelper.stringSchema,
    },
  };
}
