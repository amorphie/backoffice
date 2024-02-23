// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_debit_card_list_view_builder.dart';

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

class NeoDebitCardListViewBuilder extends _NeoDebitCardListViewBuilder {
  const NeoDebitCardListViewBuilder({required super.args});

  static const kType = 'neo_debit_card_list_view';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoDebitCardListViewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoDebitCardListViewBuilder(
        args: map,
      );

  @override
  NeoDebitCardListViewBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoDebitCardListViewBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoDebitCardListView buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoDebitCardListView(
      bannerUrl: model.bannerUrl,
      emptyWidget: model.emptyWidget.build(
        childBuilder: childBuilder,
        context: context,
      ),
      errorWidget: model.errorWidget?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      key: key,
      navigationPath: model.navigationPath,
      padding: model.padding,
    );
  }
}

class JsonNeoDebitCardListView extends JsonWidgetData {
  JsonNeoDebitCardListView({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.bannerUrl,
    required this.emptyWidget,
    this.errorWidget,
    this.navigationPath,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs: NeoDebitCardListViewBuilderModel.fromDynamic(
            {
              'bannerUrl': bannerUrl,
              'emptyWidget': emptyWidget,
              'errorWidget': errorWidget,
              'navigationPath': navigationPath,
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoDebitCardListViewBuilder(
            args: NeoDebitCardListViewBuilderModel.fromDynamic(
              {
                'bannerUrl': bannerUrl,
                'emptyWidget': emptyWidget,
                'errorWidget': errorWidget,
                'navigationPath': navigationPath,
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoDebitCardListViewBuilder.kType,
        );

  final String? bannerUrl;

  final JsonWidgetData emptyWidget;

  final JsonWidgetData? errorWidget;

  final String? navigationPath;

  final EdgeInsetsDirectional padding;
}

class NeoDebitCardListViewBuilderModel extends JsonWidgetBuilderModel {
  const NeoDebitCardListViewBuilderModel(
    super.args, {
    this.bannerUrl,
    required this.emptyWidget,
    this.errorWidget,
    this.navigationPath,
    this.padding = EdgeInsetsDirectional.zero,
  });

  final String? bannerUrl;

  final JsonWidgetData emptyWidget;

  final JsonWidgetData? errorWidget;

  final String? navigationPath;

  final EdgeInsetsDirectional padding;

  static NeoDebitCardListViewBuilderModel fromDynamic(
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
        '[NeoDebitCardListViewBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoDebitCardListViewBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoDebitCardListViewBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoDebitCardListViewBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoDebitCardListViewBuilderModel(
          args,
          bannerUrl: map['bannerUrl'],
          emptyWidget: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['emptyWidget'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [emptyWidget].');
            }
            return parsed;
          }(),
          errorWidget: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamic(
              map['errorWidget'],
              registry: registry,
            );

            return parsed;
          }(),
          navigationPath: map['navigationPath'],
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
      'bannerUrl': bannerUrl,
      'emptyWidget': emptyWidget.toJson(),
      'errorWidget': errorWidget?.toJson(),
      'navigationPath': navigationPath,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      ...args,
    });
  }
}

class NeoDebitCardListViewSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_debit_card_list_view.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoDebitCardListView',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'bannerUrl': SchemaHelper.stringSchema,
      'emptyWidget': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'errorWidget': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'navigationPath': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
