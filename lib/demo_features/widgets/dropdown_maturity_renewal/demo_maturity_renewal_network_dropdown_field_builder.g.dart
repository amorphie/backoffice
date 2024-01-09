// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_maturity_renewal_network_dropdown_field_builder.dart';

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

class DemoMaturityRenewalNetworkDropdownFieldBuilder
    extends _DemoMaturityRenewalNetworkDropdownFieldBuilder {
  const DemoMaturityRenewalNetworkDropdownFieldBuilder({required super.args});

  static const kType = 'demo_maturity_renewal_network_dropdown_form_field';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static DemoMaturityRenewalNetworkDropdownFieldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      DemoMaturityRenewalNetworkDropdownFieldBuilder(
        args: map,
      );

  @override
  DemoMaturityRenewalNetworkDropdownFieldBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model =
        DemoMaturityRenewalNetworkDropdownFieldBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  DemoMaturiytRenewalNetworkDropdownField buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return DemoMaturiytRenewalNetworkDropdownField(
      dataKey: model.dataKey,
      endpoint: model.endpoint,
      key: key,
      labelText: model.labelText,
    );
  }
}

class JsonDemoMaturiytRenewalNetworkDropdownField extends JsonWidgetData {
  JsonDemoMaturiytRenewalNetworkDropdownField({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.dataKey,
    required this.endpoint,
    this.labelText,
  }) : super(
          jsonWidgetArgs:
              DemoMaturityRenewalNetworkDropdownFieldBuilderModel.fromDynamic(
            {
              'dataKey': dataKey,
              'endpoint': endpoint,
              'labelText': labelText,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () =>
              DemoMaturityRenewalNetworkDropdownFieldBuilder(
            args:
                DemoMaturityRenewalNetworkDropdownFieldBuilderModel.fromDynamic(
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
          jsonWidgetType: DemoMaturityRenewalNetworkDropdownFieldBuilder.kType,
        );

  final String dataKey;

  final String endpoint;

  final String? labelText;
}

class DemoMaturityRenewalNetworkDropdownFieldBuilderModel
    extends JsonWidgetBuilderModel {
  const DemoMaturityRenewalNetworkDropdownFieldBuilderModel(
    super.args, {
    required this.dataKey,
    required this.endpoint,
    this.labelText,
  });

  final String dataKey;

  final String endpoint;

  final String? labelText;

  static DemoMaturityRenewalNetworkDropdownFieldBuilderModel fromDynamic(
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
        '[DemoMaturityRenewalNetworkDropdownFieldBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static DemoMaturityRenewalNetworkDropdownFieldBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    DemoMaturityRenewalNetworkDropdownFieldBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is DemoMaturityRenewalNetworkDropdownFieldBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = DemoMaturityRenewalNetworkDropdownFieldBuilderModel(
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

class DemoMaturiytRenewalNetworkDropdownFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/demo_maturiyt_renewal_network_dropdown_field.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'DemoMaturiytRenewalNetworkDropdownField',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dataKey': SchemaHelper.stringSchema,
      'endpoint': SchemaHelper.stringSchema,
      'labelText': SchemaHelper.stringSchema,
    },
  };
}
