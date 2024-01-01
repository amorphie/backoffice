// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_swipe_button_builder.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: deprecated_member_use

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class NeoSwipeButtonBuilder extends _NeoSwipeButtonBuilder {
  const NeoSwipeButtonBuilder({required super.args});

  static const kType = 'neo_swipe_button';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoSwipeButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoSwipeButtonBuilder(
        args: map,
      );
  @override
  NeoSwipeButtonBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoSwipeButtonBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoSwipeButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoSwipeButton(
      key: key,
      labelText: model.labelText,
      loadingLabelText: model.loadingLabelText,
      padding: model.padding,
      startWorkflow: model.startWorkflow,
      transitionId: model.transitionId,
      transitionParams: model.transitionParams,
      widgetEventKey: model.widgetEventKey,
    );
  }
}

class JsonNeoSwipeButton extends JsonWidgetData {
  JsonNeoSwipeButton({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.labelText,
    this.loadingLabelText,
    this.padding,
    this.startWorkflow = false,
    this.transitionId,
    this.transitionParams = const {},
    this.widgetEventKey,
  }) : super(
          jsonWidgetArgs: NeoSwipeButtonBuilderModel.fromDynamic(
            {
              'labelText': labelText,
              'loadingLabelText': loadingLabelText,
              'padding': padding,
              'startWorkflow': startWorkflow,
              'transitionId': transitionId,
              'transitionParams': transitionParams,
              'widgetEventKey': widgetEventKey,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoSwipeButtonBuilder(
            args: NeoSwipeButtonBuilderModel.fromDynamic(
              {
                'labelText': labelText,
                'loadingLabelText': loadingLabelText,
                'padding': padding,
                'startWorkflow': startWorkflow,
                'transitionId': transitionId,
                'transitionParams': transitionParams,
                'widgetEventKey': widgetEventKey,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoSwipeButtonBuilder.kType,
        );

  final String? labelText;

  final String? loadingLabelText;

  final EdgeInsetsDirectional? padding;

  final bool startWorkflow;

  final String? transitionId;

  final Map<String, dynamic> transitionParams;

  final String? widgetEventKey;
}

class NeoSwipeButtonBuilderModel extends JsonWidgetBuilderModel {
  const NeoSwipeButtonBuilderModel(
    super.args, {
    this.labelText,
    this.loadingLabelText,
    this.padding,
    this.startWorkflow = false,
    this.transitionId,
    this.transitionParams = const {},
    this.widgetEventKey,
  });

  final String? labelText;

  final String? loadingLabelText;

  final EdgeInsetsDirectional? padding;

  final bool startWorkflow;

  final String? transitionId;

  final Map<String, dynamic> transitionParams;

  final String? widgetEventKey;

  static NeoSwipeButtonBuilderModel fromDynamic(
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
        '[NeoSwipeButtonBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoSwipeButtonBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoSwipeButtonBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoSwipeButtonBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoSwipeButtonBuilderModel(
          args,
          labelText: map['labelText'],
          loadingLabelText: map['loadingLabelText'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );

            return parsed;
          }(),
          startWorkflow: JsonClass.parseBool(
            map['startWorkflow'],
            whenNull: false,
          ),
          transitionId: map['transitionId'],
          transitionParams: map['transitionParams'] ?? const {},
          widgetEventKey: map['widgetEventKey'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'labelText': labelText,
      'loadingLabelText': loadingLabelText,
      'padding': ThemeEncoder.encodeEdgeInsetsDirectional(
        padding,
      ),
      'startWorkflow': false == startWorkflow ? null : startWorkflow,
      'transitionId': transitionId,
      'transitionParams':
          const {} == transitionParams ? null : transitionParams,
      'widgetEventKey': widgetEventKey,
      ...args,
    });
  }
}

class NeoSwipeButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_swipe_button.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoSwipeButton',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'labelText': SchemaHelper.stringSchema,
      'loadingLabelText': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'startWorkflow': SchemaHelper.boolSchema,
      'transitionId': SchemaHelper.stringSchema,
      'transitionParams': SchemaHelper.anySchema,
      'widgetEventKey': SchemaHelper.stringSchema,
    },
  };
}
