// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_card_details_builder.dart';

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

class NeoCardDetailsBuilder extends _NeoCardDetailsBuilder {
  const NeoCardDetailsBuilder({required super.args});

  static const kType = 'neo_card_details';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoCardDetailsBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoCardDetailsBuilder(
        args: map,
      );

  @override
  NeoCardDetailsBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoCardDetailsBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoCardDetails buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoCardDetails(
      displayMode: model.displayMode,
      key: key,
      navigationPath: model.navigationPath,
      padding: model.padding,
    );
  }
}

class JsonNeoCardDetails extends JsonWidgetData {
  JsonNeoCardDetails({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.displayMode = NeoCardDetailsDisplayMode.defaultMode,
    required this.navigationPath,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs: NeoCardDetailsBuilderModel.fromDynamic(
            {
              'displayMode': displayMode,
              'navigationPath': navigationPath,
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoCardDetailsBuilder(
            args: NeoCardDetailsBuilderModel.fromDynamic(
              {
                'displayMode': displayMode,
                'navigationPath': navigationPath,
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoCardDetailsBuilder.kType,
        );

  final NeoCardDetailsDisplayMode displayMode;

  final String? navigationPath;

  final EdgeInsetsDirectional padding;
}

class NeoCardDetailsBuilderModel extends JsonWidgetBuilderModel {
  const NeoCardDetailsBuilderModel(
    super.args, {
    this.displayMode = NeoCardDetailsDisplayMode.defaultMode,
    required this.navigationPath,
    this.padding = EdgeInsetsDirectional.zero,
  });

  final NeoCardDetailsDisplayMode displayMode;

  final String? navigationPath;

  final EdgeInsetsDirectional padding;

  static NeoCardDetailsBuilderModel fromDynamic(
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
        '[NeoCardDetailsBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoCardDetailsBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoCardDetailsBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoCardDetailsBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoCardDetailsBuilderModel(
          args,
          displayMode:
              map['displayMode'] ?? NeoCardDetailsDisplayMode.defaultMode,
          navigationPath: map['navigationPath'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

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
      'displayMode': NeoCardDetailsDisplayMode.defaultMode == displayMode
          ? null
          : displayMode,
      'navigationPath': navigationPath,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      ...args,
    });
  }
}

class NeoCardDetailsSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_card_details.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoCardDetails',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'displayMode': SchemaHelper.anySchema,
      'navigationPath': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
