// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_network_dropdown_form_field_builder.dart';

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

class NeoNetworkDropdownFormFieldBuilder
    extends _NeoNetworkDropdownFormFieldBuilder {
  const NeoNetworkDropdownFormFieldBuilder({required super.args});

  static const kType = 'neo_network_dropdown_form_field';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoNetworkDropdownFormFieldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoNetworkDropdownFormFieldBuilder(
        args: map,
      );

  @override
  NeoNetworkDropdownFormFieldBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoNetworkDropdownFormFieldBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoNetworkDropdownFormField buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoNetworkDropdownFormField(
      dataKey: model.dataKey,
      endpoint: model.endpoint,
      key: key,
      labelText: model.labelText,
    );
  }
}

class JsonNeoNetworkDropdownFormField extends JsonWidgetData {
  JsonNeoNetworkDropdownFormField({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.dataKey,
    required this.endpoint,
    this.labelText,
  }) : super(
          jsonWidgetArgs: NeoNetworkDropdownFormFieldBuilderModel.fromDynamic(
            {
              'dataKey': dataKey,
              'endpoint': endpoint,
              'labelText': labelText,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoNetworkDropdownFormFieldBuilder(
            args: NeoNetworkDropdownFormFieldBuilderModel.fromDynamic(
              {
                'dataKey': dataKey,
                'endpoint': endpoint,
                'labelText': labelText,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoNetworkDropdownFormFieldBuilder.kType,
        );

  final String dataKey;

  final String endpoint;

  final String? labelText;
}

class NeoNetworkDropdownFormFieldBuilderModel extends JsonWidgetBuilderModel {
  const NeoNetworkDropdownFormFieldBuilderModel(
    super.args, {
    required this.dataKey,
    required this.endpoint,
    this.labelText,
  });

  final String dataKey;

  final String endpoint;

  final String? labelText;

  static NeoNetworkDropdownFormFieldBuilderModel fromDynamic(
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
        '[NeoNetworkDropdownFormFieldBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoNetworkDropdownFormFieldBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoNetworkDropdownFormFieldBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoNetworkDropdownFormFieldBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoNetworkDropdownFormFieldBuilderModel(
          args,
          dataKey: map['dataKey'],
          endpoint: map['endpoint'],
          labelText: map['labelText'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'dataKey': dataKey,
      'endpoint': endpoint,
      'labelText': labelText,
      ...args,
    });
  }
}

class NeoNetworkDropdownFormFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_network_dropdown_form_field.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoNetworkDropdownFormField',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dataKey': SchemaHelper.stringSchema,
      'endpoint': SchemaHelper.stringSchema,
      'labelText': SchemaHelper.stringSchema,
    },
  };
}
