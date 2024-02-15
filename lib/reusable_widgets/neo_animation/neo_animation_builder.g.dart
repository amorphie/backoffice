// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_animation_builder.dart';

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

class NeoAnimationBuilder extends _NeoAnimationBuilder {
  const NeoAnimationBuilder({required super.args});

  static const kType = 'neo_animation';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoAnimationBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoAnimationBuilder(
        args: map,
      );

  @override
  NeoAnimationBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoAnimationBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoAnimation buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoAnimation(
      animationUrn: model.animationUrn,
      height: model.height,
      isFullscreen: model.isFullscreen,
      key: key,
      padding: model.padding,
      repeat: model.repeat,
      reverse: model.reverse,
      width: model.width,
    );
  }
}

class JsonNeoAnimation extends JsonWidgetData {
  JsonNeoAnimation({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.animationUrn,
    this.height,
    this.isFullscreen = false,
    this.padding = EdgeInsetsDirectional.zero,
    this.repeat,
    this.reverse,
    this.width,
  }) : super(
          jsonWidgetArgs: NeoAnimationBuilderModel.fromDynamic(
            {
              'animationUrn': animationUrn,
              'height': height,
              'isFullscreen': isFullscreen,
              'padding': padding,
              'repeat': repeat,
              'reverse': reverse,
              'width': width,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoAnimationBuilder(
            args: NeoAnimationBuilderModel.fromDynamic(
              {
                'animationUrn': animationUrn,
                'height': height,
                'isFullscreen': isFullscreen,
                'padding': padding,
                'repeat': repeat,
                'reverse': reverse,
                'width': width,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoAnimationBuilder.kType,
        );

  final String animationUrn;

  final double? height;

  final bool isFullscreen;

  final EdgeInsetsDirectional padding;

  final bool? repeat;

  final bool? reverse;

  final double? width;
}

class NeoAnimationBuilderModel extends JsonWidgetBuilderModel {
  const NeoAnimationBuilderModel(
    super.args, {
    required this.animationUrn,
    this.height,
    this.isFullscreen = false,
    this.padding = EdgeInsetsDirectional.zero,
    this.repeat,
    this.reverse,
    this.width,
  });

  final String animationUrn;

  final double? height;

  final bool isFullscreen;

  final EdgeInsetsDirectional padding;

  final bool? repeat;

  final bool? reverse;

  final double? width;

  static NeoAnimationBuilderModel fromDynamic(
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
        '[NeoAnimationBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoAnimationBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoAnimationBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoAnimationBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoAnimationBuilderModel(
          args,
          animationUrn: map['animationUrn'],
          height: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['height']);

            return parsed;
          }(),
          isFullscreen: JsonClass.parseBool(
            map['isFullscreen'],
            whenNull: false,
          ),
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          repeat: JsonClass.maybeParseBool(
            map['repeat'],
          ),
          reverse: JsonClass.maybeParseBool(
            map['reverse'],
          ),
          width: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['width']);

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
      'animationUrn': animationUrn,
      'height': height,
      'isFullscreen': false == isFullscreen ? null : isFullscreen,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'repeat': repeat,
      'reverse': reverse,
      'width': width,
      ...args,
    });
  }
}

class NeoAnimationSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_animation.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoAnimation',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'animationUrn': SchemaHelper.stringSchema,
      'height': SchemaHelper.numberSchema,
      'isFullscreen': SchemaHelper.boolSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'repeat': SchemaHelper.boolSchema,
      'reverse': SchemaHelper.boolSchema,
      'width': SchemaHelper.numberSchema,
    },
  };
}
