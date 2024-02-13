// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_bo_button_builder.dart';

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

class NeoBoButtonBuilder extends _NeoBoButtonBuilder {
  const NeoBoButtonBuilder({required super.args});

  static const kType = 'neo_button';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoBoButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoBoButtonBuilder(
        args: map,
      );

  @override
  NeoBoButtonBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoBoButtonBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoBoButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoBoButton(
      autoTriggerTransition: model.autoTriggerTransition,
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

class JsonNeoBoButton extends JsonWidgetData {
  JsonNeoBoButton({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.autoTriggerTransition = true,
    this.displayMode = NeoBoButtonDisplayMode.primary,
    this.enabled = true,
    this.formValidationRequired = false,
    this.iconLeftUrn,
    this.iconRightUrn,
    this.labelText = "",
    this.padding,
    this.size = NeoBoButtonSize.medium,
    this.startWorkflow = false,
    this.transitionId,
    this.widgetEventKey,
  }) : super(
          jsonWidgetArgs: NeoBoButtonBuilderModel.fromDynamic(
            {
              'autoTriggerTransition': autoTriggerTransition,
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
          jsonWidgetBuilder: () => NeoBoButtonBuilder(
            args: NeoBoButtonBuilderModel.fromDynamic(
              {
                'autoTriggerTransition': autoTriggerTransition,
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
          jsonWidgetType: NeoBoButtonBuilder.kType,
        );

  final bool autoTriggerTransition;

  final NeoBoButtonDisplayMode displayMode;

  final bool enabled;

  final bool formValidationRequired;

  final String? iconLeftUrn;

  final String? iconRightUrn;

  final String labelText;

  final EdgeInsetsDirectional? padding;

  final NeoBoButtonSize size;

  final bool startWorkflow;

  final String? transitionId;

  final String? widgetEventKey;
}

class NeoBoButtonBuilderModel extends JsonWidgetBuilderModel {
  const NeoBoButtonBuilderModel(
    super.args, {
    this.autoTriggerTransition = true,
    this.displayMode = NeoBoButtonDisplayMode.primary,
    this.enabled = true,
    this.formValidationRequired = false,
    this.iconLeftUrn,
    this.iconRightUrn,
    this.labelText = "",
    this.padding,
    this.size = NeoBoButtonSize.medium,
    this.startWorkflow = false,
    this.transitionId,
    this.widgetEventKey,
  });

  final bool autoTriggerTransition;

  final NeoBoButtonDisplayMode displayMode;

  final bool enabled;

  final bool formValidationRequired;

  final String? iconLeftUrn;

  final String? iconRightUrn;

  final String labelText;

  final EdgeInsetsDirectional? padding;

  final NeoBoButtonSize size;

  final bool startWorkflow;

  final String? transitionId;

  final String? widgetEventKey;

  static NeoBoButtonBuilderModel fromDynamic(
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
        '[NeoBoButtonBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoBoButtonBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoBoButtonBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoBoButtonBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoBoButtonBuilderModel(
          args,
          autoTriggerTransition: JsonClass.parseBool(
            map['autoTriggerTransition'],
            whenNull: true,
          ),
          displayMode: map['displayMode'] ?? NeoBoButtonDisplayMode.primary,
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
          size: map['size'] ?? NeoBoButtonSize.medium,
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
      'autoTriggerTransition': true == autoTriggerTransition ? null : autoTriggerTransition,
      'displayMode': NeoBoButtonDisplayMode.primary == displayMode ? null : displayMode,
      'enabled': true == enabled ? null : enabled,
      'formValidationRequired': false == formValidationRequired ? null : formValidationRequired,
      'iconLeftUrn': iconLeftUrn,
      'iconRightUrn': iconRightUrn,
      'labelText': "" == labelText ? null : labelText,
      'padding': ThemeEncoder.encodeEdgeInsetsDirectional(
        padding,
      ),
      'size': NeoBoButtonSize.medium == size ? null : size,
      'startWorkflow': false == startWorkflow ? null : startWorkflow,
      'transitionId': transitionId,
      'widgetEventKey': widgetEventKey,
      ...args,
    });
  }
}

class NeoBoButtonSchema {
  static const id = 'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_button.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoBoButton',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'autoTriggerTransition': SchemaHelper.boolSchema,
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