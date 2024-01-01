// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_icon_builder.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: deprecated_member_use

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class NeoIconBuilder extends _NeoIconBuilder {
  const NeoIconBuilder({required super.args});

  static const kType = 'neo_icon';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoIconBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoIconBuilder(
        args: map,
      );
  @override
  NeoIconBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoIconBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoIcon buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoIcon(
      color: model.color,
      height: model.height,
      iconUrn: model.iconUrn,
      key: key,
      padding: model.padding,
      width: model.width,
    );
  }
}

class JsonNeoIcon extends JsonWidgetData {
  JsonNeoIcon({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.color,
    this.height,
    required this.iconUrn,
    this.padding = EdgeInsetsDirectional.zero,
    this.width,
  }) : super(
          jsonWidgetArgs: NeoIconBuilderModel.fromDynamic(
            {
              'color': color,
              'height': height,
              'iconUrn': iconUrn,
              'padding': padding,
              'width': width,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoIconBuilder(
            args: NeoIconBuilderModel.fromDynamic(
              {
                'color': color,
                'height': height,
                'iconUrn': iconUrn,
                'padding': padding,
                'width': width,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoIconBuilder.kType,
        );

  final Color? color;

  final double? height;

  final String iconUrn;

  final EdgeInsetsDirectional padding;

  final double? width;
}

class NeoIconBuilderModel extends JsonWidgetBuilderModel {
  const NeoIconBuilderModel(
    super.args, {
    this.color,
    this.height,
    required this.iconUrn,
    this.padding = EdgeInsetsDirectional.zero,
    this.width,
  });

  final Color? color;

  final double? height;

  final String iconUrn;

  final EdgeInsetsDirectional padding;

  final double? width;

  static NeoIconBuilderModel fromDynamic(
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
        '[NeoIconBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoIconBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoIconBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoIconBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoIconBuilderModel(
          args,
          color: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['color'],
              validate: false,
            );

            return parsed;
          }(),
          height: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['height']);

            return parsed;
          }(),
          iconUrn: map['iconUrn'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
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
      'color': ThemeEncoder.encodeColor(
        color,
      ),
      'height': height,
      'iconUrn': iconUrn,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'width': width,
      ...args,
    });
  }
}

class NeoIconSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_icon.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoIcon',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'height': SchemaHelper.numberSchema,
      'iconUrn': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'width': SchemaHelper.numberSchema,
    },
  };
}
