// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_information_card_builder.dart';

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

class NeoInformationCardBuilder extends _NeoInformationCardBuilder {
  const NeoInformationCardBuilder({required super.args});

  static const kType = 'neo_information_card';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoInformationCardBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoInformationCardBuilder(
        args: map,
      );

  @override
  NeoInformationCardBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoInformationCardBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoInformationCard buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoInformationCard(
      content: model.content.build(
        childBuilder: childBuilder,
        context: context,
      ),
      displayMode: model.displayMode,
      iconUrn: model.iconUrn,
      key: key,
      padding: model.padding,
      title: model.title,
    );
  }
}

class JsonNeoInformationCard extends JsonWidgetData {
  JsonNeoInformationCard({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.content,
    this.displayMode = NeoInformationCardDisplayMode.gray,
    this.iconUrn,
    this.padding = EdgeInsetsDirectional.zero,
    this.title,
  }) : super(
          jsonWidgetArgs: NeoInformationCardBuilderModel.fromDynamic(
            {
              'content': content,
              'displayMode': displayMode,
              'iconUrn': iconUrn,
              'padding': padding,
              'title': title,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoInformationCardBuilder(
            args: NeoInformationCardBuilderModel.fromDynamic(
              {
                'content': content,
                'displayMode': displayMode,
                'iconUrn': iconUrn,
                'padding': padding,
                'title': title,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoInformationCardBuilder.kType,
        );

  final JsonWidgetData content;

  final NeoInformationCardDisplayMode displayMode;

  final String? iconUrn;

  final EdgeInsetsDirectional padding;

  final String? title;
}

class NeoInformationCardBuilderModel extends JsonWidgetBuilderModel {
  const NeoInformationCardBuilderModel(
    super.args, {
    required this.content,
    this.displayMode = NeoInformationCardDisplayMode.gray,
    this.iconUrn,
    this.padding = EdgeInsetsDirectional.zero,
    this.title,
  });

  final JsonWidgetData content;

  final NeoInformationCardDisplayMode displayMode;

  final String? iconUrn;

  final EdgeInsetsDirectional padding;

  final String? title;

  static NeoInformationCardBuilderModel fromDynamic(
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
        '[NeoInformationCardBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoInformationCardBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoInformationCardBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoInformationCardBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoInformationCardBuilderModel(
          args,
          content: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['content'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [content].');
            }
            return parsed;
          }(),
          displayMode: map['displayMode'] ?? NeoInformationCardDisplayMode.gray,
          iconUrn: map['iconUrn'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

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
      'content': content.toJson(),
      'displayMode': NeoInformationCardDisplayMode.gray == displayMode
          ? null
          : displayMode,
      'iconUrn': iconUrn,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'title': title,
      ...args,
    });
  }
}

class NeoInformationCardSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_information_card.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoInformationCard',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'content': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'displayMode': SchemaHelper.anySchema,
      'iconUrn': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'title': SchemaHelper.stringSchema,
    },
  };
}
