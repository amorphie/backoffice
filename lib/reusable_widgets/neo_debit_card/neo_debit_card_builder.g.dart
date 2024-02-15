// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_debit_card_builder.dart';

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

class NeoDebitCardBuilder extends _NeoDebitCardBuilder {
  const NeoDebitCardBuilder({required super.args});

  static const kType = 'neo_debit_card';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoDebitCardBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoDebitCardBuilder(
        args: map,
      );

  @override
  NeoDebitCardBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoDebitCardBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoDebitCard buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoDebitCard(
      badgeText: model.badgeText,
      itemData: model.itemData,
      key: key,
      navigationPath: model.navigationPath,
      padding: model.padding,
      showNewBadge: model.showNewBadge,
    );
  }
}

class JsonNeoDebitCard extends JsonWidgetData {
  JsonNeoDebitCard({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.badgeText = "",
    required this.itemData,
    this.navigationPath,
    this.padding = EdgeInsetsDirectional.zero,
    this.showNewBadge = false,
  }) : super(
          jsonWidgetArgs: NeoDebitCardBuilderModel.fromDynamic(
            {
              'badgeText': badgeText,
              'itemData': itemData,
              'navigationPath': navigationPath,
              'padding': padding,
              'showNewBadge': showNewBadge,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoDebitCardBuilder(
            args: NeoDebitCardBuilderModel.fromDynamic(
              {
                'badgeText': badgeText,
                'itemData': itemData,
                'navigationPath': navigationPath,
                'padding': padding,
                'showNewBadge': showNewBadge,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoDebitCardBuilder.kType,
        );

  final String badgeText;

  final NeoDebitCardItemData itemData;

  final String? navigationPath;

  final EdgeInsetsDirectional padding;

  final bool showNewBadge;
}

class NeoDebitCardBuilderModel extends JsonWidgetBuilderModel {
  const NeoDebitCardBuilderModel(
    super.args, {
    this.badgeText = "",
    required this.itemData,
    this.navigationPath,
    this.padding = EdgeInsetsDirectional.zero,
    this.showNewBadge = false,
  });

  final String badgeText;

  final NeoDebitCardItemData itemData;

  final String? navigationPath;

  final EdgeInsetsDirectional padding;

  final bool showNewBadge;

  static NeoDebitCardBuilderModel fromDynamic(
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
        '[NeoDebitCardBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoDebitCardBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoDebitCardBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoDebitCardBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoDebitCardBuilderModel(
          args,
          badgeText: map['badgeText'] ?? "",
          itemData: map['itemData'],
          navigationPath: map['navigationPath'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          showNewBadge: JsonClass.parseBool(
            map['showNewBadge'],
            whenNull: false,
          ),
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'badgeText': "" == badgeText ? null : badgeText,
      'itemData': itemData,
      'navigationPath': navigationPath,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'showNewBadge': false == showNewBadge ? null : showNewBadge,
      ...args,
    });
  }
}

class NeoDebitCardSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_debit_card.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoDebitCard',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'badgeText': SchemaHelper.stringSchema,
      'itemData': SchemaHelper.anySchema,
      'navigationPath': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'showNewBadge': SchemaHelper.boolSchema,
    },
  };
}
