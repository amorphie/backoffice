// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_app_bar_builder.dart';

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

class NeoAppBarBuilder extends _NeoAppBarBuilder {
  const NeoAppBarBuilder({required super.args});

  static const kType = 'neo_app_bar';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoAppBarBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoAppBarBuilder(
        args: map,
      );

  @override
  NeoAppBarBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoAppBarBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoAppBar buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoAppBar(
      actions: model.actions == null
          ? null
          : [
              for (var d in model.actions!)
                d.build(
                  childBuilder: childBuilder,
                  context: context,
                ),
            ],
      backTransitionId: model.backTransitionId,
      cachedTitleKey: model.cachedTitleKey,
      key: key,
      leftWidgetType: model.leftWidgetType,
      statusBarIconBrightness: model.statusBarIconBrightness,
      title: model.title,
    );
  }
}

class JsonNeoAppBar extends JsonWidgetData {
  JsonNeoAppBar({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.actions,
    this.backTransitionId,
    this.cachedTitleKey,
    this.leftWidgetType,
    this.statusBarIconBrightness = Brightness.dark,
    this.title,
  }) : super(
          jsonWidgetArgs: NeoAppBarBuilderModel.fromDynamic(
            {
              'actions': actions,
              'backTransitionId': backTransitionId,
              'cachedTitleKey': cachedTitleKey,
              'leftWidgetType': leftWidgetType,
              'statusBarIconBrightness': statusBarIconBrightness,
              'title': title,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoAppBarBuilder(
            args: NeoAppBarBuilderModel.fromDynamic(
              {
                'actions': actions,
                'backTransitionId': backTransitionId,
                'cachedTitleKey': cachedTitleKey,
                'leftWidgetType': leftWidgetType,
                'statusBarIconBrightness': statusBarIconBrightness,
                'title': title,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoAppBarBuilder.kType,
        );

  final List<JsonWidgetData>? actions;

  final String? backTransitionId;

  final String? cachedTitleKey;

  final NeoAppBarLeftWidgetType? leftWidgetType;

  final Brightness? statusBarIconBrightness;

  final String? title;
}

class NeoAppBarBuilderModel extends JsonWidgetBuilderModel {
  const NeoAppBarBuilderModel(
    super.args, {
    this.actions,
    this.backTransitionId,
    this.cachedTitleKey,
    this.leftWidgetType,
    this.statusBarIconBrightness = Brightness.dark,
    this.title,
  });

  final List<JsonWidgetData>? actions;

  final String? backTransitionId;

  final String? cachedTitleKey;

  final NeoAppBarLeftWidgetType? leftWidgetType;

  final Brightness? statusBarIconBrightness;

  final String? title;

  static NeoAppBarBuilderModel fromDynamic(
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
        '[NeoAppBarBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoAppBarBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoAppBarBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoAppBarBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoAppBarBuilderModel(
          args,
          actions: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamicList(
              map['actions'],
              registry: registry,
            );

            return parsed;
          }(),
          backTransitionId: map['backTransitionId'],
          cachedTitleKey: map['cachedTitleKey'],
          leftWidgetType: map['leftWidgetType'],
          statusBarIconBrightness: () {
            dynamic parsed = ThemeDecoder.decodeBrightness(
              map['statusBarIconBrightness'],
              validate: false,
            );
            if (!map.containsKey('statusBarIconBrightness')) {
              parsed ??= Brightness.dark;
            }

            return parsed;
          }(),
          title: map['title'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'actions': JsonClass.maybeToJsonList(actions),
      'backTransitionId': backTransitionId,
      'cachedTitleKey': cachedTitleKey,
      'leftWidgetType': leftWidgetType,
      'statusBarIconBrightness': Brightness.dark == statusBarIconBrightness
          ? null
          : ThemeEncoder.encodeBrightness(
              statusBarIconBrightness,
            ),
      'title': title,
      ...args,
    });
  }
}

class NeoAppBarSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_app_bar.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoAppBar',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'actions': SchemaHelper.arraySchema(JsonWidgetDataSchema.id),
      'backTransitionId': SchemaHelper.stringSchema,
      'cachedTitleKey': SchemaHelper.stringSchema,
      'leftWidgetType': SchemaHelper.anySchema,
      'statusBarIconBrightness': SchemaHelper.objectSchema(BrightnessSchema.id),
      'title': SchemaHelper.stringSchema,
    },
  };
}
