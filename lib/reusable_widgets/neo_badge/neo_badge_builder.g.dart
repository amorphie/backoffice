// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_badge_builder.dart';

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

class NeoBadgeBuilder extends _NeoBadgeBuilder {
  const NeoBadgeBuilder({required super.args});

  static const kType = 'neo_badge';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoBadgeBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoBadgeBuilder(
        args: map,
      );

  @override
  NeoBadgeBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoBadgeBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoBadge buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoBadge(
      displayMode: model.displayMode,
      iconUrn: model.iconUrn,
      key: key,
      minWidth: model.minWidth,
      padding: model.padding,
      text: model.text,
    );
  }
}

class JsonNeoBadge extends JsonWidgetData {
  JsonNeoBadge({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.displayMode = NeoBadgeDisplayMode.green,
    this.iconUrn,
    this.minWidth,
    this.padding = EdgeInsetsDirectional.zero,
    this.text,
  }) : super(
          jsonWidgetArgs: NeoBadgeBuilderModel.fromDynamic(
            {
              'displayMode': displayMode,
              'iconUrn': iconUrn,
              'minWidth': minWidth,
              'padding': padding,
              'text': text,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoBadgeBuilder(
            args: NeoBadgeBuilderModel.fromDynamic(
              {
                'displayMode': displayMode,
                'iconUrn': iconUrn,
                'minWidth': minWidth,
                'padding': padding,
                'text': text,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoBadgeBuilder.kType,
        );

  final NeoBadgeDisplayMode displayMode;

  final String? iconUrn;

  final double? minWidth;

  final EdgeInsetsDirectional padding;

  final String? text;
}

class NeoBadgeBuilderModel extends JsonWidgetBuilderModel {
  const NeoBadgeBuilderModel(
    super.args, {
    this.displayMode = NeoBadgeDisplayMode.green,
    this.iconUrn,
    this.minWidth,
    this.padding = EdgeInsetsDirectional.zero,
    this.text,
  });

  final NeoBadgeDisplayMode displayMode;

  final String? iconUrn;

  final double? minWidth;

  final EdgeInsetsDirectional padding;

  final String? text;

  static NeoBadgeBuilderModel fromDynamic(
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
        '[NeoBadgeBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoBadgeBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoBadgeBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoBadgeBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoBadgeBuilderModel(
          args,
          displayMode: map['displayMode'] ?? NeoBadgeDisplayMode.green,
          iconUrn: map['iconUrn'],
          minWidth: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['minWidth']);

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
          text: map['text'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'displayMode':
          NeoBadgeDisplayMode.green == displayMode ? null : displayMode,
      'iconUrn': iconUrn,
      'minWidth': minWidth,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'text': text,
      ...args,
    });
  }
}

class NeoBadgeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_badge.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoBadge',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'displayMode': SchemaHelper.anySchema,
      'iconUrn': SchemaHelper.stringSchema,
      'minWidth': SchemaHelper.numberSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'text': SchemaHelper.stringSchema,
    },
  };
}
