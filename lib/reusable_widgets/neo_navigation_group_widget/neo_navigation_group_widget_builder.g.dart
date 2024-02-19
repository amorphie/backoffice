// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_navigation_group_widget_builder.dart';

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

class NeoNavigationGroupWidgetBuilder extends _NeoNavigationGroupWidgetBuilder {
  const NeoNavigationGroupWidgetBuilder({required super.args});

  static const kType = 'neo_navigation_group_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoNavigationGroupWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoNavigationGroupWidgetBuilder(
        args: map,
      );

  @override
  NeoNavigationGroupWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoNavigationGroupWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoNavigationGroupWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoNavigationGroupWidget(
      itemCountToDisplay: model.itemCountToDisplay,
      key: key,
      navigationGroupKey: model.navigationGroupKey,
      padding: model.padding,
      showMoreText: model.showMoreText,
      titleText: model.titleText,
    );
  }
}

class JsonNeoNavigationGroupWidget extends JsonWidgetData {
  JsonNeoNavigationGroupWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.itemCountToDisplay = 3,
    required this.navigationGroupKey,
    this.padding = const EdgeInsetsDirectional.all(NeoDimens.px16),
    this.showMoreText = "",
    this.titleText = "",
  }) : super(
          jsonWidgetArgs: NeoNavigationGroupWidgetBuilderModel.fromDynamic(
            {
              'itemCountToDisplay': itemCountToDisplay,
              'navigationGroupKey': navigationGroupKey,
              'padding': padding,
              'showMoreText': showMoreText,
              'titleText': titleText,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoNavigationGroupWidgetBuilder(
            args: NeoNavigationGroupWidgetBuilderModel.fromDynamic(
              {
                'itemCountToDisplay': itemCountToDisplay,
                'navigationGroupKey': navigationGroupKey,
                'padding': padding,
                'showMoreText': showMoreText,
                'titleText': titleText,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoNavigationGroupWidgetBuilder.kType,
        );

  final int itemCountToDisplay;

  final String navigationGroupKey;

  final EdgeInsetsDirectional padding;

  final String showMoreText;

  final String titleText;
}

class NeoNavigationGroupWidgetBuilderModel extends JsonWidgetBuilderModel {
  const NeoNavigationGroupWidgetBuilderModel(
    super.args, {
    this.itemCountToDisplay = 3,
    required this.navigationGroupKey,
    this.padding = const EdgeInsetsDirectional.all(NeoDimens.px16),
    this.showMoreText = "",
    this.titleText = "",
  });

  final int itemCountToDisplay;

  final String navigationGroupKey;

  final EdgeInsetsDirectional padding;

  final String showMoreText;

  final String titleText;

  static NeoNavigationGroupWidgetBuilderModel fromDynamic(
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
        '[NeoNavigationGroupWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoNavigationGroupWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoNavigationGroupWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoNavigationGroupWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoNavigationGroupWidgetBuilderModel(
          args,
          itemCountToDisplay: () {
            dynamic parsed = JsonClass.maybeParseInt(map['itemCountToDisplay']);

            parsed ??= 3;

            return parsed;
          }(),
          navigationGroupKey: map['navigationGroupKey'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= const EdgeInsetsDirectional.all(NeoDimens.px16);

            return parsed;
          }(),
          showMoreText: map['showMoreText'] ?? "",
          titleText: map['titleText'] ?? "",
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'itemCountToDisplay': 3 == itemCountToDisplay ? null : itemCountToDisplay,
      'navigationGroupKey': navigationGroupKey,
      'padding': const EdgeInsetsDirectional.all(NeoDimens.px16) == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'showMoreText': "" == showMoreText ? null : showMoreText,
      'titleText': "" == titleText ? null : titleText,
      ...args,
    });
  }
}

class NeoNavigationGroupWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_navigation_group_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoNavigationGroupWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'itemCountToDisplay': SchemaHelper.numberSchema,
      'navigationGroupKey': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'showMoreText': SchemaHelper.stringSchema,
      'titleText': SchemaHelper.stringSchema,
    },
  };
}
