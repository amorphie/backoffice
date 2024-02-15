// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_radio_button_group_widget_builder.dart';

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

class NeoRadioButtonGroupWidgetBuilder
    extends _NeoRadioButtonGroupWidgetBuilder {
  const NeoRadioButtonGroupWidgetBuilder({required super.args});

  static const kType = 'neo_radio_button_group_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoRadioButtonGroupWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoRadioButtonGroupWidgetBuilder(
        args: map,
      );

  @override
  NeoRadioButtonGroupWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoRadioButtonGroupWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoRadioButtonGroupWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final itemsDecoded = _decodeRadioButtonItemModelList(
      data: data,
    );

    return NeoRadioButtonGroupWidget(
      dataKey: model.dataKey,
      items: itemsDecoded,
      key: key,
      padding: model.padding,
      selectedOption: model.selectedOption,
    );
  }
}

class JsonNeoRadioButtonGroupWidget extends JsonWidgetData {
  JsonNeoRadioButtonGroupWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.dataKey,
    required this.items,
    this.padding = EdgeInsetsDirectional.zero,
    this.selectedOption = 0,
  }) : super(
          jsonWidgetArgs: NeoRadioButtonGroupWidgetBuilderModel.fromDynamic(
            {
              'dataKey': dataKey,
              'items': items,
              'padding': padding,
              'selectedOption': selectedOption,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoRadioButtonGroupWidgetBuilder(
            args: NeoRadioButtonGroupWidgetBuilderModel.fromDynamic(
              {
                'dataKey': dataKey,
                'items': items,
                'padding': padding,
                'selectedOption': selectedOption,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoRadioButtonGroupWidgetBuilder.kType,
        );

  final String dataKey;

  final dynamic items;

  final EdgeInsetsDirectional padding;

  final int selectedOption;
}

class NeoRadioButtonGroupWidgetBuilderModel extends JsonWidgetBuilderModel {
  const NeoRadioButtonGroupWidgetBuilderModel(
    super.args, {
    required this.dataKey,
    required this.items,
    this.padding = EdgeInsetsDirectional.zero,
    this.selectedOption = 0,
  });

  final String dataKey;

  final dynamic items;

  final EdgeInsetsDirectional padding;

  final int selectedOption;

  static NeoRadioButtonGroupWidgetBuilderModel fromDynamic(
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
        '[NeoRadioButtonGroupWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoRadioButtonGroupWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoRadioButtonGroupWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoRadioButtonGroupWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoRadioButtonGroupWidgetBuilderModel(
          args,
          dataKey: map['dataKey'],
          items: map['items'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          selectedOption: () {
            dynamic parsed = JsonClass.maybeParseInt(map['selectedOption']);

            parsed ??= 0;

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
      'items': items,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'selectedOption': 0 == selectedOption ? null : selectedOption,
      ...args,
    });
  }
}

class NeoRadioButtonGroupWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_radio_button_group_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoRadioButtonGroupWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dataKey': SchemaHelper.stringSchema,
      'items': SchemaHelper.anySchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'selectedOption': SchemaHelper.numberSchema,
    },
  };
}
