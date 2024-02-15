// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_popup_builder.dart';

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

class NeoPopupBuilder extends _NeoPopupBuilder {
  const NeoPopupBuilder({required super.args});

  static const kType = 'neo_popup';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoPopupBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoPopupBuilder(
        args: map,
      );

  @override
  NeoPopupBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoPopupBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoPopup buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final actionsDecoded = _decodeActions(
      data: data,
    );

    return NeoPopup(
      actions: actionsDecoded,
      bodyText: model.bodyText,
      key: key,
      padding: model.padding,
      titleText: model.titleText,
      type: model.type,
    );
  }
}

class JsonNeoPopup extends JsonWidgetData {
  JsonNeoPopup({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.actions,
    this.bodyText,
    this.padding = EdgeInsetsDirectional.zero,
    this.titleText,
    this.type = NeoPopupType.info,
  }) : super(
          jsonWidgetArgs: NeoPopupBuilderModel.fromDynamic(
            {
              'actions': actions,
              'bodyText': bodyText,
              'padding': padding,
              'titleText': titleText,
              'type': type,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoPopupBuilder(
            args: NeoPopupBuilderModel.fromDynamic(
              {
                'actions': actions,
                'bodyText': bodyText,
                'padding': padding,
                'titleText': titleText,
                'type': type,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoPopupBuilder.kType,
        );

  final dynamic actions;

  final String? bodyText;

  final EdgeInsetsDirectional padding;

  final String? titleText;

  final NeoPopupType type;
}

class NeoPopupBuilderModel extends JsonWidgetBuilderModel {
  const NeoPopupBuilderModel(
    super.args, {
    required this.actions,
    this.bodyText,
    this.padding = EdgeInsetsDirectional.zero,
    this.titleText,
    this.type = NeoPopupType.info,
  });

  final dynamic actions;

  final String? bodyText;

  final EdgeInsetsDirectional padding;

  final String? titleText;

  final NeoPopupType type;

  static NeoPopupBuilderModel fromDynamic(
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
        '[NeoPopupBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoPopupBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoPopupBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoPopupBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoPopupBuilderModel(
          args,
          actions: map['actions'],
          bodyText: map['bodyText'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          titleText: map['titleText'],
          type: map['type'] ?? NeoPopupType.info,
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'actions': actions,
      'bodyText': bodyText,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'titleText': titleText,
      'type': NeoPopupType.info == type ? null : type,
      ...args,
    });
  }
}

class NeoPopupSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_popup.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoPopup',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'actions': SchemaHelper.anySchema,
      'bodyText': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'titleText': SchemaHelper.stringSchema,
      'type': SchemaHelper.anySchema,
    },
  };
}
