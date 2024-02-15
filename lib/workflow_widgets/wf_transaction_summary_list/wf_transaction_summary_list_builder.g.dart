// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wf_transaction_summary_list_builder.dart';

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

class WfTransactionSummaryListBuilder extends _WfTransactionSummaryListBuilder {
  const WfTransactionSummaryListBuilder({required super.args});

  static const kType = 'wf_transaction_summary_list';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static WfTransactionSummaryListBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      WfTransactionSummaryListBuilder(
        args: map,
      );

  @override
  WfTransactionSummaryListBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = WfTransactionSummaryListBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  WfTransactionSummaryList buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return WfTransactionSummaryList(
      dividerColor: model.dividerColor,
      dividerHeight: model.dividerHeight,
      key: key,
      padding: model.padding,
      titleColor: model.titleColor,
      titleStyle: model.titleStyle,
      valueColor: model.valueColor,
      valueStyle: model.valueStyle,
    );
  }
}

class JsonWfTransactionSummaryList extends JsonWidgetData {
  JsonWfTransactionSummaryList({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.dividerColor,
    this.dividerHeight = 1.0,
    this.padding = const EdgeInsetsDirectional.all(NeoDimens.px16),
    this.titleColor,
    this.titleStyle = "bodyTwelveMedium",
    this.valueColor,
    this.valueStyle = "bodyFourteenSemibold",
  }) : super(
          jsonWidgetArgs: WfTransactionSummaryListBuilderModel.fromDynamic(
            {
              'dividerColor': dividerColor,
              'dividerHeight': dividerHeight,
              'padding': padding,
              'titleColor': titleColor,
              'titleStyle': titleStyle,
              'valueColor': valueColor,
              'valueStyle': valueStyle,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => WfTransactionSummaryListBuilder(
            args: WfTransactionSummaryListBuilderModel.fromDynamic(
              {
                'dividerColor': dividerColor,
                'dividerHeight': dividerHeight,
                'padding': padding,
                'titleColor': titleColor,
                'titleStyle': titleStyle,
                'valueColor': valueColor,
                'valueStyle': valueStyle,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: WfTransactionSummaryListBuilder.kType,
        );

  final Color? dividerColor;

  final double dividerHeight;

  final EdgeInsetsDirectional padding;

  final Color? titleColor;

  final String titleStyle;

  final Color? valueColor;

  final String valueStyle;
}

class WfTransactionSummaryListBuilderModel extends JsonWidgetBuilderModel {
  const WfTransactionSummaryListBuilderModel(
    super.args, {
    this.dividerColor,
    this.dividerHeight = 1.0,
    this.padding = const EdgeInsetsDirectional.all(NeoDimens.px16),
    this.titleColor,
    this.titleStyle = "bodyTwelveMedium",
    this.valueColor,
    this.valueStyle = "bodyFourteenSemibold",
  });

  final Color? dividerColor;

  final double dividerHeight;

  final EdgeInsetsDirectional padding;

  final Color? titleColor;

  final String titleStyle;

  final Color? valueColor;

  final String valueStyle;

  static WfTransactionSummaryListBuilderModel fromDynamic(
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
        '[WfTransactionSummaryListBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static WfTransactionSummaryListBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    WfTransactionSummaryListBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is WfTransactionSummaryListBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = WfTransactionSummaryListBuilderModel(
          args,
          dividerColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['dividerColor'],
              validate: false,
            );

            return parsed;
          }(),
          dividerHeight: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['dividerHeight']);

            parsed ??= 1.0;

            return parsed;
          }(),
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= const EdgeInsetsDirectional.all(NeoDimens.px16);

            return parsed;
          }(),
          titleColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['titleColor'],
              validate: false,
            );

            return parsed;
          }(),
          titleStyle: map['titleStyle'] ?? "bodyTwelveMedium",
          valueColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['valueColor'],
              validate: false,
            );

            return parsed;
          }(),
          valueStyle: map['valueStyle'] ?? "bodyFourteenSemibold",
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'dividerColor': ThemeEncoder.encodeColor(
        dividerColor,
      ),
      'dividerHeight': 1.0 == dividerHeight ? null : dividerHeight,
      'padding': const EdgeInsetsDirectional.all(NeoDimens.px16) == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'titleColor': ThemeEncoder.encodeColor(
        titleColor,
      ),
      'titleStyle': "bodyTwelveMedium" == titleStyle ? null : titleStyle,
      'valueColor': ThemeEncoder.encodeColor(
        valueColor,
      ),
      'valueStyle': "bodyFourteenSemibold" == valueStyle ? null : valueStyle,
      ...args,
    });
  }
}

class WfTransactionSummaryListSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/wf_transaction_summary_list.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WfTransactionSummaryList',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dividerColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dividerHeight': SchemaHelper.numberSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'titleColor': SchemaHelper.objectSchema(ColorSchema.id),
      'titleStyle': SchemaHelper.stringSchema,
      'valueColor': SchemaHelper.objectSchema(ColorSchema.id),
      'valueStyle': SchemaHelper.stringSchema,
    },
  };
}
