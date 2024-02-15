// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_address_selection_dropdown_builder.dart';

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

class NeoAddressSelectionDropdownBuilder
    extends _NeoAddressSelectionDropdownBuilder {
  const NeoAddressSelectionDropdownBuilder({required super.args});

  static const kType = 'neo_address_selection_dropdown';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoAddressSelectionDropdownBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoAddressSelectionDropdownBuilder(
        args: map,
      );

  @override
  NeoAddressSelectionDropdownBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoAddressSelectionDropdownBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoAddressSelectionDropdown buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoAddressSelectionDropdown(
      dataKey: model.dataKey,
      key: key,
      padding: model.padding,
    );
  }
}

class JsonNeoAddressSelectionDropdown extends JsonWidgetData {
  JsonNeoAddressSelectionDropdown({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.dataKey,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs: NeoAddressSelectionDropdownBuilderModel.fromDynamic(
            {
              'dataKey': dataKey,
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoAddressSelectionDropdownBuilder(
            args: NeoAddressSelectionDropdownBuilderModel.fromDynamic(
              {
                'dataKey': dataKey,
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoAddressSelectionDropdownBuilder.kType,
        );

  final String dataKey;

  final EdgeInsetsDirectional padding;
}

class NeoAddressSelectionDropdownBuilderModel extends JsonWidgetBuilderModel {
  const NeoAddressSelectionDropdownBuilderModel(
    super.args, {
    required this.dataKey,
    this.padding = EdgeInsetsDirectional.zero,
  });

  final String dataKey;

  final EdgeInsetsDirectional padding;

  static NeoAddressSelectionDropdownBuilderModel fromDynamic(
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
        '[NeoAddressSelectionDropdownBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoAddressSelectionDropdownBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoAddressSelectionDropdownBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoAddressSelectionDropdownBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoAddressSelectionDropdownBuilderModel(
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
      ...args,
    });
  }
}

class NeoAddressSelectionDropdownSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_address_selection_dropdown.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoAddressSelectionDropdown',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dataKey': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
