// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_image_builder.dart';

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

class NeoImageBuilder extends _NeoImageBuilder {
  const NeoImageBuilder({required super.args});

  static const kType = 'neo_image';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoImageBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoImageBuilder(
        args: map,
      );

  @override
  NeoImageBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoImageBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoImage buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoImage(
      aspectRatio: model.aspectRatio,
      borderColor: model.borderColor,
      borderRadius: model.borderRadius,
      borderWidth: model.borderWidth,
      dataKey: model.dataKey,
      height: model.height,
      imageUrn: model.imageUrn,
      key: key,
      padding: model.padding,
      showGridBackground: model.showGridBackground,
      width: model.width,
    );
  }
}

class JsonNeoImage extends JsonWidgetData {
  JsonNeoImage({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.aspectRatio,
    this.borderColor = Colors.white,
    this.borderRadius,
    this.borderWidth,
    this.dataKey,
    this.height,
    required this.imageUrn,
    this.padding = EdgeInsetsDirectional.zero,
    this.showGridBackground = false,
    this.width,
  }) : super(
          jsonWidgetArgs: NeoImageBuilderModel.fromDynamic(
            {
              'aspectRatio': aspectRatio,
              'borderColor': borderColor,
              'borderRadius': borderRadius,
              'borderWidth': borderWidth,
              'dataKey': dataKey,
              'height': height,
              'imageUrn': imageUrn,
              'padding': padding,
              'showGridBackground': showGridBackground,
              'width': width,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoImageBuilder(
            args: NeoImageBuilderModel.fromDynamic(
              {
                'aspectRatio': aspectRatio,
                'borderColor': borderColor,
                'borderRadius': borderRadius,
                'borderWidth': borderWidth,
                'dataKey': dataKey,
                'height': height,
                'imageUrn': imageUrn,
                'padding': padding,
                'showGridBackground': showGridBackground,
                'width': width,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoImageBuilder.kType,
        );

  final double? aspectRatio;

  final Color borderColor;

  final BorderRadius? borderRadius;

  final double? borderWidth;

  final String? dataKey;

  final double? height;

  final String imageUrn;

  final EdgeInsetsDirectional padding;

  final bool showGridBackground;

  final double? width;
}

class NeoImageBuilderModel extends JsonWidgetBuilderModel {
  const NeoImageBuilderModel(
    super.args, {
    this.aspectRatio,
    this.borderColor = Colors.white,
    this.borderRadius,
    this.borderWidth,
    this.dataKey,
    this.height,
    required this.imageUrn,
    this.padding = EdgeInsetsDirectional.zero,
    this.showGridBackground = false,
    this.width,
  });

  final double? aspectRatio;

  final Color borderColor;

  final BorderRadius? borderRadius;

  final double? borderWidth;

  final String? dataKey;

  final double? height;

  final String imageUrn;

  final EdgeInsetsDirectional padding;

  final bool showGridBackground;

  final double? width;

  static NeoImageBuilderModel fromDynamic(
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
        '[NeoImageBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoImageBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoImageBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoImageBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoImageBuilderModel(
          args,
          aspectRatio: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['aspectRatio']);

            return parsed;
          }(),
          borderColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['borderColor'],
              validate: false,
            );
            parsed ??= Colors.white;

            return parsed;
          }(),
          borderRadius: () {
            dynamic parsed = ThemeDecoder.decodeBorderRadius(
              map['borderRadius'],
              validate: false,
            );

            return parsed;
          }(),
          borderWidth: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['borderWidth']);

            return parsed;
          }(),
          dataKey: map['dataKey'],
          height: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['height']);

            return parsed;
          }(),
          imageUrn: map['imageUrn'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          showGridBackground: JsonClass.parseBool(
            map['showGridBackground'],
            whenNull: false,
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
      'aspectRatio': aspectRatio,
      'borderColor': Colors.white == borderColor
          ? null
          : ThemeEncoder.encodeColor(
              borderColor,
            ),
      'borderRadius': ThemeEncoder.encodeBorderRadius(
        borderRadius,
      ),
      'borderWidth': borderWidth,
      'dataKey': dataKey,
      'height': height,
      'imageUrn': imageUrn,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'showGridBackground':
          false == showGridBackground ? null : showGridBackground,
      'width': width,
      ...args,
    });
  }
}

class NeoImageSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_image.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoImage',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'aspectRatio': SchemaHelper.numberSchema,
      'borderColor': SchemaHelper.objectSchema(ColorSchema.id),
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'borderWidth': SchemaHelper.numberSchema,
      'dataKey': SchemaHelper.stringSchema,
      'height': SchemaHelper.numberSchema,
      'imageUrn': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'showGridBackground': SchemaHelper.boolSchema,
      'width': SchemaHelper.numberSchema,
    },
  };
}
