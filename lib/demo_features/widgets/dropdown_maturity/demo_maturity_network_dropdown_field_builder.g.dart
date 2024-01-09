// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_maturity_network_dropdown_field_builder.dart';

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

class DemoMaturityNetworkDropdownFieldBuilder
    extends _DemoMaturityNetworkDropdownFieldBuilder {
  const DemoMaturityNetworkDropdownFieldBuilder({required super.args});

  static const kType = 'demo_maturity_network_dropdown_form_field';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static DemoMaturityNetworkDropdownFieldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      DemoMaturityNetworkDropdownFieldBuilder(
        args: map,
      );

  @override
  DemoMaturityNetworkDropdownFieldBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = DemoMaturityNetworkDropdownFieldBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  DemoMaturityNetworkDropdownField buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return DemoMaturityNetworkDropdownField(
      dataKey: model.dataKey,
      endpoint: model.endpoint,
      key: key,
      labelText: model.labelText,
    );
  }
}

class JsonDemoMaturityNetworkDropdownField extends JsonWidgetData {
  JsonDemoMaturityNetworkDropdownField({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.dataKey,
    required this.endpoint,
    this.labelText,
  }) : super(
          jsonWidgetArgs:
              DemoMaturityNetworkDropdownFieldBuilderModel.fromDynamic(
            {
              'dataKey': dataKey,
              'endpoint': endpoint,
              'labelText': labelText,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => DemoMaturityNetworkDropdownFieldBuilder(
            args: DemoMaturityNetworkDropdownFieldBuilderModel.fromDynamic(
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
          jsonWidgetType: DemoMaturityNetworkDropdownFieldBuilder.kType,
        );

  final String dataKey;

  final String endpoint;

  final String? labelText;
}

class DemoMaturityNetworkDropdownFieldBuilderModel
    extends JsonWidgetBuilderModel {
  const DemoMaturityNetworkDropdownFieldBuilderModel(
    super.args, {
    required this.dataKey,
    required this.endpoint,
    this.labelText,
  });

  final String dataKey;

  final String endpoint;

  final String? labelText;

  static DemoMaturityNetworkDropdownFieldBuilderModel fromDynamic(
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
        '[DemoMaturityNetworkDropdownFieldBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static DemoMaturityNetworkDropdownFieldBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    DemoMaturityNetworkDropdownFieldBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is DemoMaturityNetworkDropdownFieldBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = DemoMaturityNetworkDropdownFieldBuilderModel(
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

class DemoMaturityNetworkDropdownFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/demo_maturity_network_dropdown_field.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'DemoMaturityNetworkDropdownField',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dataKey': SchemaHelper.stringSchema,
      'endpoint': SchemaHelper.stringSchema,
      'labelText': SchemaHelper.stringSchema,
    },
  };
}
