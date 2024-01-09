// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_tckn_form_field_builder.dart';

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

class NeoTcknFormFieldBuilder extends _NeoTcknFormFieldBuilder {
  const NeoTcknFormFieldBuilder({required super.args});

  static const kType = 'neo_tckn_form_field';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoTcknFormFieldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoTcknFormFieldBuilder(
        args: map,
      );

  @override
  NeoTcknFormFieldBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoTcknFormFieldBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoTcknFormField buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoTcknFormField(
      dataKey: model.dataKey,
      enabled: model.enabled,
      errorText: model.errorText,
      focusNode: model.focusNode,
      key: key,
      labelText: model.labelText,
      padding: model.padding,
    );
  }
}

class JsonNeoTcknFormField extends JsonWidgetData {
  JsonNeoTcknFormField({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.dataKey,
    this.enabled = true,
    this.errorText,
    this.focusNode,
    this.labelText,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs: NeoTcknFormFieldBuilderModel.fromDynamic(
            {
              'dataKey': dataKey,
              'enabled': enabled,
              'errorText': errorText,
              'focusNode': focusNode,
              'labelText': labelText,
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoTcknFormFieldBuilder(
            args: NeoTcknFormFieldBuilderModel.fromDynamic(
              {
                'dataKey': dataKey,
                'enabled': enabled,
                'errorText': errorText,
                'focusNode': focusNode,
                'labelText': labelText,
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoTcknFormFieldBuilder.kType,
        );

  final String? dataKey;

  final bool enabled;

  final String? errorText;

  final FocusNode? focusNode;

  final String? labelText;

  final EdgeInsetsDirectional padding;
}

class NeoTcknFormFieldBuilderModel extends JsonWidgetBuilderModel {
  const NeoTcknFormFieldBuilderModel(
    super.args, {
    this.dataKey,
    this.enabled = true,
    this.errorText,
    this.focusNode,
    this.labelText,
    this.padding = EdgeInsetsDirectional.zero,
  });

  final String? dataKey;

  final bool enabled;

  final String? errorText;

  final FocusNode? focusNode;

  final String? labelText;

  final EdgeInsetsDirectional padding;

  static NeoTcknFormFieldBuilderModel fromDynamic(
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
        '[NeoTcknFormFieldBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoTcknFormFieldBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoTcknFormFieldBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoTcknFormFieldBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoTcknFormFieldBuilderModel(
          args,
          dataKey: map['dataKey'],
          enabled: JsonClass.parseBool(
            map['enabled'],
            whenNull: true,
          ),
          errorText: map['errorText'],
          focusNode: map['focusNode'],
          labelText: map['labelText'],
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
      'enabled': true == enabled ? null : enabled,
      'errorText': errorText,
      'focusNode': focusNode,
      'labelText': labelText,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      ...args,
    });
  }
}

class NeoTcknFormFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_tckn_form_field.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoTcknFormField',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dataKey': SchemaHelper.stringSchema,
      'enabled': SchemaHelper.boolSchema,
      'errorText': SchemaHelper.stringSchema,
      'focusNode': SchemaHelper.anySchema,
      'labelText': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
