// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_segmented_button_builder.dart';

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

class NeoSegmentedButtonBuilder extends _NeoSegmentedButtonBuilder {
  const NeoSegmentedButtonBuilder({required super.args});

  static const kType = 'neo_segmented_button';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoSegmentedButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoSegmentedButtonBuilder(
        args: map,
      );

  @override
  NeoSegmentedButtonBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoSegmentedButtonBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoSegmentedButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final segmentsDecoded = _decodeSegmentStrings(
      data: data,
    );

    return NeoSegmentedButton(
      initiallySelectedSegment: model.initiallySelectedSegment,
      key: key,
      padding: model.padding,
      segments: segmentsDecoded,
      widgetEventKey: model.widgetEventKey,
    );
  }
}

class JsonNeoSegmentedButton extends JsonWidgetData {
  JsonNeoSegmentedButton({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.initiallySelectedSegment,
    this.padding = EdgeInsetsDirectional.zero,
    required this.segments,
    this.widgetEventKey,
  }) : super(
          jsonWidgetArgs: NeoSegmentedButtonBuilderModel.fromDynamic(
            {
              'initiallySelectedSegment': initiallySelectedSegment,
              'padding': padding,
              'segments': segments,
              'widgetEventKey': widgetEventKey,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoSegmentedButtonBuilder(
            args: NeoSegmentedButtonBuilderModel.fromDynamic(
              {
                'initiallySelectedSegment': initiallySelectedSegment,
                'padding': padding,
                'segments': segments,
                'widgetEventKey': widgetEventKey,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoSegmentedButtonBuilder.kType,
        );

  final String? initiallySelectedSegment;

  final EdgeInsetsDirectional padding;

  final dynamic segments;

  final String? widgetEventKey;
}

class NeoSegmentedButtonBuilderModel extends JsonWidgetBuilderModel {
  const NeoSegmentedButtonBuilderModel(
    super.args, {
    this.initiallySelectedSegment,
    this.padding = EdgeInsetsDirectional.zero,
    required this.segments,
    this.widgetEventKey,
  });

  final String? initiallySelectedSegment;

  final EdgeInsetsDirectional padding;

  final dynamic segments;

  final String? widgetEventKey;

  static NeoSegmentedButtonBuilderModel fromDynamic(
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
        '[NeoSegmentedButtonBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoSegmentedButtonBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoSegmentedButtonBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoSegmentedButtonBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoSegmentedButtonBuilderModel(
          args,
          initiallySelectedSegment: map['initiallySelectedSegment'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          segments: map['segments'],
          widgetEventKey: map['widgetEventKey'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'initiallySelectedSegment': initiallySelectedSegment,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'segments': segments,
      'widgetEventKey': widgetEventKey,
      ...args,
    });
  }
}

class NeoSegmentedButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_segmented_button.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoSegmentedButton',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'initiallySelectedSegment': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'segments': SchemaHelper.anySchema,
      'widgetEventKey': SchemaHelper.stringSchema,
    },
  };
}
