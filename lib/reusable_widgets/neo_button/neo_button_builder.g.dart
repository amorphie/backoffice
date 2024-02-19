// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_button_builder.dart';

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
      autoTriggerTransition: model.autoTriggerTransition,
      displayMode: model.displayMode,
      enableState: model.enableState,
      formValidationRequired: model.formValidationRequired,
      iconLeftUrn: model.iconLeftUrn,
      iconRightUrn: model.iconRightUrn,
      key: key,
      labelText: model.labelText,
      onTap: model.onTap,
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
    this.autoTriggerTransition = true,
    this.displayMode = NeoButtonDisplayMode.primary,
    this.enableState = NeoButtonEnableState.enabled,
    this.formValidationRequired = false,
    this.iconLeftUrn,
    this.iconRightUrn,
    this.labelText = "",
    this.onTap,
    this.padding,
    this.size = NeoButtonSize.medium,
    this.startWorkflow = false,
    this.transitionId,
    this.widgetEventKey,
  }) : super(
          jsonWidgetArgs: NeoButtonBuilderModel.fromDynamic(
            {
              'autoTriggerTransition': autoTriggerTransition,
              'displayMode': displayMode,
              'enableState': enableState,
              'formValidationRequired': formValidationRequired,
              'iconLeftUrn': iconLeftUrn,
              'iconRightUrn': iconRightUrn,
              'labelText': labelText,
              'onTap': onTap,
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
                'autoTriggerTransition': autoTriggerTransition,
                'displayMode': displayMode,
                'enableState': enableState,
                'formValidationRequired': formValidationRequired,
                'iconLeftUrn': iconLeftUrn,
                'iconRightUrn': iconRightUrn,
                'labelText': labelText,
                'onTap': onTap,
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

  final bool autoTriggerTransition;

  final NeoButtonDisplayMode displayMode;

  final NeoButtonEnableState enableState;

  final bool formValidationRequired;

  final String? iconLeftUrn;

  final String? iconRightUrn;

  final String labelText;

  final Function? onTap;

  final EdgeInsetsDirectional? padding;

  final NeoButtonSize size;

  final bool startWorkflow;

  final String? transitionId;

  final String? widgetEventKey;
}

class NeoButtonBuilderModel extends JsonWidgetBuilderModel {
  const NeoButtonBuilderModel(
    super.args, {
    this.autoTriggerTransition = true,
    this.displayMode = NeoButtonDisplayMode.primary,
    this.enableState = NeoButtonEnableState.enabled,
    this.formValidationRequired = false,
    this.iconLeftUrn,
    this.iconRightUrn,
    this.labelText = "",
    this.onTap,
    this.padding,
    this.size = NeoButtonSize.medium,
    this.startWorkflow = false,
    this.transitionId,
    this.widgetEventKey,
  });

  final bool autoTriggerTransition;

  final NeoButtonDisplayMode displayMode;

  final NeoButtonEnableState enableState;

  final bool formValidationRequired;

  final String? iconLeftUrn;

  final String? iconRightUrn;

  final String labelText;

  final Function? onTap;

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
          autoTriggerTransition: JsonClass.parseBool(
            map['autoTriggerTransition'],
            whenNull: true,
          ),
          displayMode: map['displayMode'] ?? NeoButtonDisplayMode.primary,
          enableState: map['enableState'] ?? NeoButtonEnableState.enabled,
          formValidationRequired: JsonClass.parseBool(
            map['formValidationRequired'],
            whenNull: false,
          ),
          iconLeftUrn: map['iconLeftUrn'],
          iconRightUrn: map['iconRightUrn'],
          labelText: map['labelText'] ?? "",
          onTap: map['onTap'],
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
      'autoTriggerTransition':
          true == autoTriggerTransition ? null : autoTriggerTransition,
      'displayMode':
          NeoButtonDisplayMode.primary == displayMode ? null : displayMode,
      'enableState':
          NeoButtonEnableState.enabled == enableState ? null : enableState,
      'formValidationRequired':
          false == formValidationRequired ? null : formValidationRequired,
      'iconLeftUrn': iconLeftUrn,
      'iconRightUrn': iconRightUrn,
      'labelText': "" == labelText ? null : labelText,
      'onTap': onTap,
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
      'autoTriggerTransition': SchemaHelper.boolSchema,
      'displayMode': SchemaHelper.anySchema,
      'enableState': SchemaHelper.anySchema,
      'formValidationRequired': SchemaHelper.boolSchema,
      'iconLeftUrn': SchemaHelper.stringSchema,
      'iconRightUrn': SchemaHelper.stringSchema,
      'labelText': SchemaHelper.stringSchema,
      'onTap': SchemaHelper.anySchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'size': SchemaHelper.anySchema,
      'startWorkflow': SchemaHelper.boolSchema,
      'transitionId': SchemaHelper.stringSchema,
      'widgetEventKey': SchemaHelper.stringSchema,
    },
  };
}
