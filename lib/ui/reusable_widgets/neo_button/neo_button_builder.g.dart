// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_button_builder.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: deprecated_member_use

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class NeoButtonBuilder extends _NeoButtonBuilder {
  const NeoButtonBuilder({required super.args});

  static const kType = 'neo_button';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoButtonBuilder(
        args: map,
      );
  @override
  NeoButtonBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoButtonBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoButton(
      displayMode: model.displayMode,
      enabled: model.enabled,
      formValidationRequired: model.formValidationRequired,
      iconLeftUrn: model.iconLeftUrn,
      iconRightUrn: model.iconRightUrn,
      key: key,
      labelText: model.labelText,
      padding: model.padding,
      size: model.size,
      startWorkflow: model.startWorkflow,
      transitionId: model.transitionId,
      widgetEventKey: model.widgetEventKey,
    );
  }
}

class JsonNeoButton extends JsonWidgetData {
  JsonNeoButton({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.displayMode = NeoButtonDisplayMode.primary,
    this.enabled = true,
    this.formValidationRequired = false,
    this.iconLeftUrn,
    this.iconRightUrn,
    this.labelText = "",
    this.padding,
    this.size = NeoButtonSize.medium,
    this.startWorkflow = false,
    this.transitionId,
    this.widgetEventKey,
  }) : super(
          jsonWidgetArgs: NeoButtonBuilderModel.fromDynamic(
            {
              'displayMode': displayMode,
              'enabled': enabled,
              'formValidationRequired': formValidationRequired,
              'iconLeftUrn': iconLeftUrn,
              'iconRightUrn': iconRightUrn,
              'labelText': labelText,
              'padding': padding,
              'size': size,
              'startWorkflow': startWorkflow,
              'transitionId': transitionId,
              'widgetEventKey': widgetEventKey,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoButtonBuilder(
            args: NeoButtonBuilderModel.fromDynamic(
              {
                'displayMode': displayMode,
                'enabled': enabled,
                'formValidationRequired': formValidationRequired,
                'iconLeftUrn': iconLeftUrn,
                'iconRightUrn': iconRightUrn,
                'labelText': labelText,
                'padding': padding,
                'size': size,
                'startWorkflow': startWorkflow,
                'transitionId': transitionId,
                'widgetEventKey': widgetEventKey,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoButtonBuilder.kType,
        );

  final NeoButtonDisplayMode displayMode;

  final bool enabled;

  final bool formValidationRequired;

  final String? iconLeftUrn;

  final String? iconRightUrn;

  final String labelText;

  final EdgeInsetsDirectional? padding;

  final NeoButtonSize size;

  final bool startWorkflow;

  final String? transitionId;

  final String? widgetEventKey;
}

class NeoButtonBuilderModel extends JsonWidgetBuilderModel {
  const NeoButtonBuilderModel(
    super.args, {
    this.displayMode = NeoButtonDisplayMode.primary,
    this.enabled = true,
    this.formValidationRequired = false,
    this.iconLeftUrn,
    this.iconRightUrn,
    this.labelText = "",
    this.padding,
    this.size = NeoButtonSize.medium,
    this.startWorkflow = false,
    this.transitionId,
    this.widgetEventKey,
  });

  final NeoButtonDisplayMode displayMode;

  final bool enabled;

  final bool formValidationRequired;

  final String? iconLeftUrn;

  final String? iconRightUrn;

  final String labelText;

  final EdgeInsetsDirectional? padding;

  final NeoButtonSize size;

  final bool startWorkflow;

  final String? transitionId;

  final String? widgetEventKey;

  static NeoButtonBuilderModel fromDynamic(
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
        '[NeoButtonBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoButtonBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoButtonBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoButtonBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoButtonBuilderModel(
          args,
          displayMode: map['displayMode'] ?? NeoButtonDisplayMode.primary,
          enabled: JsonClass.parseBool(
            map['enabled'],
            whenNull: true,
          ),
          formValidationRequired: JsonClass.parseBool(
            map['formValidationRequired'],
            whenNull: false,
          ),
          iconLeftUrn: map['iconLeftUrn'],
          iconRightUrn: map['iconRightUrn'],
          labelText: map['labelText'] ?? "",
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );

            return parsed;
          }(),
          size: map['size'] ?? NeoButtonSize.medium,
          startWorkflow: JsonClass.parseBool(
            map['startWorkflow'],
            whenNull: false,
          ),
          transitionId: map['transitionId'],
          widgetEventKey: map['widgetEventKey'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'displayMode':
          NeoButtonDisplayMode.primary == displayMode ? null : displayMode,
      'enabled': true == enabled ? null : enabled,
      'formValidationRequired':
          false == formValidationRequired ? null : formValidationRequired,
      'iconLeftUrn': iconLeftUrn,
      'iconRightUrn': iconRightUrn,
      'labelText': "" == labelText ? null : labelText,
      'padding': ThemeEncoder.encodeEdgeInsetsDirectional(
        padding,
      ),
      'size': NeoButtonSize.medium == size ? null : size,
      'startWorkflow': false == startWorkflow ? null : startWorkflow,
      'transitionId': transitionId,
      'widgetEventKey': widgetEventKey,
      ...args,
    });
  }
}

class NeoButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_button.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoButton',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'displayMode': SchemaHelper.anySchema,
      'enabled': SchemaHelper.boolSchema,
      'formValidationRequired': SchemaHelper.boolSchema,
      'iconLeftUrn': SchemaHelper.stringSchema,
      'iconRightUrn': SchemaHelper.stringSchema,
      'labelText': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'size': SchemaHelper.anySchema,
      'startWorkflow': SchemaHelper.boolSchema,
      'transitionId': SchemaHelper.stringSchema,
      'widgetEventKey': SchemaHelper.stringSchema,
    },
  };
}
