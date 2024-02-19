// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_customer_name_widget_builder.dart';

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

class NeoCustomerNameWidgetBuilder extends _NeoCustomerNameWidgetBuilder {
  const NeoCustomerNameWidgetBuilder({required super.args});

  static const kType = 'neo_customer_name_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoCustomerNameWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoCustomerNameWidgetBuilder(
        args: map,
      );

  @override
  NeoCustomerNameWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoCustomerNameWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoCustomerNameWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoCustomerNameWidget(
      dataKey: model.dataKey,
      displayMode: model.displayMode,
      key: key,
      padding: model.padding,
    );
  }
}

class JsonNeoCustomerNameWidget extends JsonWidgetData {
  JsonNeoCustomerNameWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.dataKey,
    required this.displayMode,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs: NeoCustomerNameWidgetBuilderModel.fromDynamic(
            {
              'dataKey': dataKey,
              'displayMode': displayMode,
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoCustomerNameWidgetBuilder(
            args: NeoCustomerNameWidgetBuilderModel.fromDynamic(
              {
                'dataKey': dataKey,
                'displayMode': displayMode,
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoCustomerNameWidgetBuilder.kType,
        );

  final String dataKey;

  final NeoCustomerNameDisplayMode displayMode;

  final EdgeInsetsDirectional padding;
}

class NeoCustomerNameWidgetBuilderModel extends JsonWidgetBuilderModel {
  const NeoCustomerNameWidgetBuilderModel(
    super.args, {
    required this.dataKey,
    required this.displayMode,
    this.padding = EdgeInsetsDirectional.zero,
  });

  final String dataKey;

  final NeoCustomerNameDisplayMode displayMode;

  final EdgeInsetsDirectional padding;

  static NeoCustomerNameWidgetBuilderModel fromDynamic(
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
        '[NeoCustomerNameWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoCustomerNameWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoCustomerNameWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoCustomerNameWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoCustomerNameWidgetBuilderModel(
          args,
          dataKey: map['dataKey'],
          displayMode: map['displayMode'],
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
      'displayMode': displayMode,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      ...args,
    });
  }
}

class NeoCustomerNameWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_customer_name_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoCustomerNameWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dataKey': SchemaHelper.stringSchema,
      'displayMode': SchemaHelper.anySchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
