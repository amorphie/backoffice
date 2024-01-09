// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_phone_number_form_field_builder.dart';

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

class NeoPhoneNumberFormFieldBuilder extends _NeoPhoneNumberFormFieldBuilder {
  const NeoPhoneNumberFormFieldBuilder({required super.args});

  static const kType = 'neo_phone_number_form_field';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoPhoneNumberFormFieldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoPhoneNumberFormFieldBuilder(
        args: map,
      );

  @override
  NeoPhoneNumberFormFieldBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoPhoneNumberFormFieldBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoPhoneNumberFormField buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoPhoneNumberFormField(
      dataKey: model.dataKey,
      key: key,
      labelText: model.labelText,
      padding: model.padding,
    );
  }
}

class JsonNeoPhoneNumberFormField extends JsonWidgetData {
  JsonNeoPhoneNumberFormField({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.dataKey,
    this.labelText,
    this.padding,
  }) : super(
          jsonWidgetArgs: NeoPhoneNumberFormFieldBuilderModel.fromDynamic(
            {
              'dataKey': dataKey,
              'labelText': labelText,
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoPhoneNumberFormFieldBuilder(
            args: NeoPhoneNumberFormFieldBuilderModel.fromDynamic(
              {
                'dataKey': dataKey,
                'labelText': labelText,
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoPhoneNumberFormFieldBuilder.kType,
        );

  final String? dataKey;

  final String? labelText;

  final EdgeInsetsDirectional? padding;
}

class NeoPhoneNumberFormFieldBuilderModel extends JsonWidgetBuilderModel {
  const NeoPhoneNumberFormFieldBuilderModel(
    super.args, {
    this.dataKey,
    this.labelText,
    this.padding,
  });

  final String? dataKey;

  final String? labelText;

  final EdgeInsetsDirectional? padding;

  static NeoPhoneNumberFormFieldBuilderModel fromDynamic(
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
        '[NeoPhoneNumberFormFieldBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoPhoneNumberFormFieldBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoPhoneNumberFormFieldBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoPhoneNumberFormFieldBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoPhoneNumberFormFieldBuilderModel(
          args,
          dataKey: map['dataKey'],
          labelText: map['labelText'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );

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
      'labelText': labelText,
      'padding': ThemeEncoder.encodeEdgeInsetsDirectional(
        padding,
      ),
      ...args,
    });
  }
}

class NeoPhoneNumberFormFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_phone_number_form_field.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoPhoneNumberFormField',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dataKey': SchemaHelper.stringSchema,
      'labelText': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
