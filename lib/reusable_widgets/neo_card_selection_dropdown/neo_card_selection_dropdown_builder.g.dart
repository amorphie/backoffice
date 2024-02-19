// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_card_selection_dropdown_builder.dart';

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

class NeoCardSelectionDropdownBuilder extends _NeoCardSelectionDropdownBuilder {
  const NeoCardSelectionDropdownBuilder({required super.args});

  static const kType = 'neo_card_selection_dropdown';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoCardSelectionDropdownBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoCardSelectionDropdownBuilder(
        args: map,
      );

  @override
  NeoCardSelectionDropdownBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoCardSelectionDropdownBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoCardSelectionDropdown buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoCardSelectionDropdown(
      dataKey: model.dataKey,
      key: key,
      padding: model.padding,
      transitionId: model.transitionId,
    );
  }
}

class JsonNeoCardSelectionDropdown extends JsonWidgetData {
  JsonNeoCardSelectionDropdown({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.dataKey,
    this.padding = EdgeInsetsDirectional.zero,
    required this.transitionId,
  }) : super(
          jsonWidgetArgs: NeoCardSelectionDropdownBuilderModel.fromDynamic(
            {
              'dataKey': dataKey,
              'padding': padding,
              'transitionId': transitionId,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoCardSelectionDropdownBuilder(
            args: NeoCardSelectionDropdownBuilderModel.fromDynamic(
              {
                'dataKey': dataKey,
                'padding': padding,
                'transitionId': transitionId,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoCardSelectionDropdownBuilder.kType,
        );

  final String dataKey;

  final EdgeInsetsDirectional padding;

  final String transitionId;
}

class NeoCardSelectionDropdownBuilderModel extends JsonWidgetBuilderModel {
  const NeoCardSelectionDropdownBuilderModel(
    super.args, {
    required this.dataKey,
    this.padding = EdgeInsetsDirectional.zero,
    required this.transitionId,
  });

  final String dataKey;

  final EdgeInsetsDirectional padding;

  final String transitionId;

  static NeoCardSelectionDropdownBuilderModel fromDynamic(
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
        '[NeoCardSelectionDropdownBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoCardSelectionDropdownBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoCardSelectionDropdownBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoCardSelectionDropdownBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoCardSelectionDropdownBuilderModel(
          args,
          dataKey: map['dataKey'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          transitionId: map['transitionId'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'dataKey': dataKey,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'transitionId': transitionId,
      ...args,
    });
  }
}

class NeoCardSelectionDropdownSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_card_selection_dropdown.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoCardSelectionDropdown',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dataKey': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'transitionId': SchemaHelper.stringSchema,
    },
  };
}
