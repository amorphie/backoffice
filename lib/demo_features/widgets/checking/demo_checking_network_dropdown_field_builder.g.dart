// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_checking_network_dropdown_field_builder.dart';

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

class DemoCheckingNetworkDropdownFieldBuilder
    extends _DemoCheckingNetworkDropdownFieldBuilder {
  const DemoCheckingNetworkDropdownFieldBuilder({required super.args});

  static const kType = 'demo_checking_account_network_dropdown_form_field';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static DemoCheckingNetworkDropdownFieldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      DemoCheckingNetworkDropdownFieldBuilder(
        args: map,
      );

  @override
  DemoCheckingNetworkDropdownFieldBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = DemoCheckingNetworkDropdownFieldBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  DemoCheckingNetworkDropdownField buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return DemoCheckingNetworkDropdownField(
      dataKey: model.dataKey,
      endpoint: model.endpoint,
      key: key,
      labelText: model.labelText,
    );
  }
}

class JsonDemoCheckingNetworkDropdownField extends JsonWidgetData {
  JsonDemoCheckingNetworkDropdownField({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.dataKey,
    required this.endpoint,
    this.labelText,
  }) : super(
          jsonWidgetArgs:
              DemoCheckingNetworkDropdownFieldBuilderModel.fromDynamic(
            {
              'dataKey': dataKey,
              'endpoint': endpoint,
              'labelText': labelText,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => DemoCheckingNetworkDropdownFieldBuilder(
            args: DemoCheckingNetworkDropdownFieldBuilderModel.fromDynamic(
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
          jsonWidgetType: DemoCheckingNetworkDropdownFieldBuilder.kType,
        );

  final String dataKey;

  final String endpoint;

  final String? labelText;
}

class DemoCheckingNetworkDropdownFieldBuilderModel
    extends JsonWidgetBuilderModel {
  const DemoCheckingNetworkDropdownFieldBuilderModel(
    super.args, {
    required this.dataKey,
    required this.endpoint,
    this.labelText,
  });

  final String dataKey;

  final String endpoint;

  final String? labelText;

  static DemoCheckingNetworkDropdownFieldBuilderModel fromDynamic(
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
        '[DemoCheckingNetworkDropdownFieldBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static DemoCheckingNetworkDropdownFieldBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    DemoCheckingNetworkDropdownFieldBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is DemoCheckingNetworkDropdownFieldBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = DemoCheckingNetworkDropdownFieldBuilderModel(
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

class DemoCheckingNetworkDropdownFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/demo_checking_network_dropdown_field.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'DemoCheckingNetworkDropdownField',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dataKey': SchemaHelper.stringSchema,
      'endpoint': SchemaHelper.stringSchema,
      'labelText': SchemaHelper.stringSchema,
    },
  };
}
