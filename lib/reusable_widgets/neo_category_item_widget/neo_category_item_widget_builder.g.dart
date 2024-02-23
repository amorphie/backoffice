// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_category_item_widget_builder.dart';

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

class NeoCategoryItemWidgetBuilder extends _NeoCategoryItemWidgetBuilder {
  const NeoCategoryItemWidgetBuilder({required super.args});

  static const kType = 'neo_category_item_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoCategoryItemWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoCategoryItemWidgetBuilder(
        args: map,
      );

  @override
  NeoCategoryItemWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoCategoryItemWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoCategoryItemWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoCategoryItemWidget(
      badge: model.badge?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      body: model.body,
      hasChevron: model.hasChevron,
      hasShadow: model.hasShadow,
      iconSpacing: model.iconSpacing,
      iconUrn: model.iconUrn,
      imageUrn: model.imageUrn,
      isNew: model.isNew,
      key: key,
      navigationPath: model.navigationPath,
      padding: model.padding,
      startWorkflow: model.startWorkflow,
      subtitle: model.subtitle,
      title: model.title,
      transitionId: model.transitionId,
    );
  }
}

class JsonNeoCategoryItemWidget extends JsonWidgetData {
  JsonNeoCategoryItemWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.badge,
    this.body,
    this.hasChevron = false,
    this.hasShadow = true,
    this.iconSpacing = NeoDimens.px8,
    this.iconUrn,
    this.imageUrn,
    this.isNew = false,
    this.navigationPath,
    this.padding,
    this.startWorkflow = false,
    this.subtitle,
    this.title,
    this.transitionId,
  }) : super(
          jsonWidgetArgs: NeoCategoryItemWidgetBuilderModel.fromDynamic(
            {
              'badge': badge,
              'body': body,
              'hasChevron': hasChevron,
              'hasShadow': hasShadow,
              'iconSpacing': iconSpacing,
              'iconUrn': iconUrn,
              'imageUrn': imageUrn,
              'isNew': isNew,
              'navigationPath': navigationPath,
              'padding': padding,
              'startWorkflow': startWorkflow,
              'subtitle': subtitle,
              'title': title,
              'transitionId': transitionId,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoCategoryItemWidgetBuilder(
            args: NeoCategoryItemWidgetBuilderModel.fromDynamic(
              {
                'badge': badge,
                'body': body,
                'hasChevron': hasChevron,
                'hasShadow': hasShadow,
                'iconSpacing': iconSpacing,
                'iconUrn': iconUrn,
                'imageUrn': imageUrn,
                'isNew': isNew,
                'navigationPath': navigationPath,
                'padding': padding,
                'startWorkflow': startWorkflow,
                'subtitle': subtitle,
                'title': title,
                'transitionId': transitionId,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoCategoryItemWidgetBuilder.kType,
        );

  final JsonWidgetData? badge;

  final String? body;

  final bool hasChevron;

  final bool hasShadow;

  final double iconSpacing;

  final String? iconUrn;

  final String? imageUrn;

  final bool isNew;

  final String? navigationPath;

  final EdgeInsetsDirectional? padding;

  final bool startWorkflow;

  final String? subtitle;

  final String? title;

  final String? transitionId;
}

class NeoCategoryItemWidgetBuilderModel extends JsonWidgetBuilderModel {
  const NeoCategoryItemWidgetBuilderModel(
    super.args, {
    this.badge,
    this.body,
    this.hasChevron = false,
    this.hasShadow = true,
    this.iconSpacing = NeoDimens.px8,
    this.iconUrn,
    this.imageUrn,
    this.isNew = false,
    this.navigationPath,
    this.padding,
    this.startWorkflow = false,
    this.subtitle,
    this.title,
    this.transitionId,
  });

  final JsonWidgetData? badge;

  final String? body;

  final bool hasChevron;

  final bool hasShadow;

  final double iconSpacing;

  final String? iconUrn;

  final String? imageUrn;

  final bool isNew;

  final String? navigationPath;

  final EdgeInsetsDirectional? padding;

  final bool startWorkflow;

  final String? subtitle;

  final String? title;

  final String? transitionId;

  static NeoCategoryItemWidgetBuilderModel fromDynamic(
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
        '[NeoCategoryItemWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoCategoryItemWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoCategoryItemWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoCategoryItemWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoCategoryItemWidgetBuilderModel(
          args,
          badge: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamic(
              map['badge'],
              registry: registry,
            );

            return parsed;
          }(),
          body: map['body'],
          hasChevron: JsonClass.parseBool(
            map['hasChevron'],
            whenNull: false,
          ),
          hasShadow: JsonClass.parseBool(
            map['hasShadow'],
            whenNull: true,
          ),
          iconSpacing: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['iconSpacing']);

            parsed ??= NeoDimens.px8;

            return parsed;
          }(),
          iconUrn: map['iconUrn'],
          imageUrn: map['imageUrn'],
          isNew: JsonClass.parseBool(
            map['isNew'],
            whenNull: false,
          ),
          navigationPath: map['navigationPath'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );

            return parsed;
          }(),
          startWorkflow: JsonClass.parseBool(
            map['startWorkflow'],
            whenNull: false,
          ),
          subtitle: map['subtitle'],
          title: map['title'],
          transitionId: map['transitionId'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'badge': badge?.toJson(),
      'body': body,
      'hasChevron': false == hasChevron ? null : hasChevron,
      'hasShadow': true == hasShadow ? null : hasShadow,
      'iconSpacing': NeoDimens.px8 == iconSpacing ? null : iconSpacing,
      'iconUrn': iconUrn,
      'imageUrn': imageUrn,
      'isNew': false == isNew ? null : isNew,
      'navigationPath': navigationPath,
      'padding': ThemeEncoder.encodeEdgeInsetsDirectional(
        padding,
      ),
      'startWorkflow': false == startWorkflow ? null : startWorkflow,
      'subtitle': subtitle,
      'title': title,
      'transitionId': transitionId,
      ...args,
    });
  }
}

class NeoCategoryItemWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_category_item_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoCategoryItemWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'badge': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'body': SchemaHelper.stringSchema,
      'hasChevron': SchemaHelper.boolSchema,
      'hasShadow': SchemaHelper.boolSchema,
      'iconSpacing': SchemaHelper.numberSchema,
      'iconUrn': SchemaHelper.stringSchema,
      'imageUrn': SchemaHelper.stringSchema,
      'isNew': SchemaHelper.boolSchema,
      'navigationPath': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'startWorkflow': SchemaHelper.boolSchema,
      'subtitle': SchemaHelper.stringSchema,
      'title': SchemaHelper.stringSchema,
      'transitionId': SchemaHelper.stringSchema,
    },
  };
}
