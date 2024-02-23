// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_divider_builder.dart';

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

class NeoDividerBuilder extends _NeoDividerBuilder {
  const NeoDividerBuilder({required super.args});

  static const kType = 'neo_divider';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoDividerBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoDividerBuilder(
        args: map,
      );

  @override
  NeoDividerBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoDividerBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoDivider buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoDivider(
      color: model.color,
      endIndent: model.endIndent,
      height: model.height,
      indent: model.indent,
      key: key,
      padding: model.padding,
      thickness: model.thickness,
    );
  }
}

class JsonNeoDivider extends JsonWidgetData {
  JsonNeoDivider({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.color,
    this.endIndent,
    this.height,
    this.indent,
    this.padding = EdgeInsetsDirectional.zero,
    this.thickness,
  }) : super(
          jsonWidgetArgs: NeoDividerBuilderModel.fromDynamic(
            {
              'color': color,
              'endIndent': endIndent,
              'height': height,
              'indent': indent,
              'padding': padding,
              'thickness': thickness,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoDividerBuilder(
            args: NeoDividerBuilderModel.fromDynamic(
              {
                'color': color,
                'endIndent': endIndent,
                'height': height,
                'indent': indent,
                'padding': padding,
                'thickness': thickness,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoDividerBuilder.kType,
        );

  final Color? color;

  final double? endIndent;

  final double? height;

  final double? indent;

  final EdgeInsetsDirectional padding;

  final double? thickness;
}

class NeoDividerBuilderModel extends JsonWidgetBuilderModel {
  const NeoDividerBuilderModel(
    super.args, {
    this.color,
    this.endIndent,
    this.height,
    this.indent,
    this.padding = EdgeInsetsDirectional.zero,
    this.thickness,
  });

  final Color? color;

  final double? endIndent;

  final double? height;

  final double? indent;

  final EdgeInsetsDirectional padding;

  final double? thickness;

  static NeoDividerBuilderModel fromDynamic(
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
        '[NeoDividerBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoDividerBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoDividerBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoDividerBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoDividerBuilderModel(
          args,
          color: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['color'],
              validate: false,
            );

            return parsed;
          }(),
          endIndent: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['endIndent']);

            return parsed;
          }(),
          height: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['height']);

            return parsed;
          }(),
          indent: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['indent']);

            return parsed;
          }(),
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          thickness: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['thickness']);

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
      'endIndent': endIndent,
      'height': height,
      'indent': indent,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'thickness': thickness,
      ...args,
    });
  }
}

class NeoDividerSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_divider.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoDivider',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'endIndent': SchemaHelper.numberSchema,
      'height': SchemaHelper.numberSchema,
      'indent': SchemaHelper.numberSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'thickness': SchemaHelper.numberSchema,
    },
  };
}
