// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_dropdown_form_field_builder.dart';

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

class NeoDropdownFormFieldBuilder extends _NeoDropdownFormFieldBuilder {
  const NeoDropdownFormFieldBuilder({required super.args});

  static const kType = 'neo_dropdown_form_field';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoDropdownFormFieldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoDropdownFormFieldBuilder(
        args: map,
      );

  @override
  NeoDropdownFormFieldBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoDropdownFormFieldBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoDropdownFormField buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final itemListDecoded = _decodeItemList(
      data: data,
    );

    return NeoDropdownFormField(
      bottomSheetTitle: model.bottomSheetTitle,
      dataKey: model.dataKey,
      displayMode: model.displayMode,
      dropdownType: model.dropdownType,
      hint: model.hint,
      isHighlighted: model.isHighlighted,
      itemList: itemListDecoded,
      key: key,
      labelText: model.labelText,
      padding: model.padding,
      validationErrorMessage: model.validationErrorMessage,
    );
  }
}

class JsonNeoDropdownFormField extends JsonWidgetData {
  JsonNeoDropdownFormField({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.bottomSheetTitle,
    this.dataKey,
    this.displayMode = NeoDropdownFormFieldDisplayMode.defaultMode,
    required this.dropdownType,
    this.hint,
    this.isHighlighted = false,
    required this.itemList,
    this.labelText = "",
    this.padding = EdgeInsetsDirectional.zero,
    this.validationErrorMessage,
  }) : super(
          jsonWidgetArgs: NeoDropdownFormFieldBuilderModel.fromDynamic(
            {
              'bottomSheetTitle': bottomSheetTitle,
              'dataKey': dataKey,
              'displayMode': displayMode,
              'dropdownType': dropdownType,
              'hint': hint,
              'isHighlighted': isHighlighted,
              'itemList': itemList,
              'labelText': labelText,
              'padding': padding,
              'validationErrorMessage': validationErrorMessage,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoDropdownFormFieldBuilder(
            args: NeoDropdownFormFieldBuilderModel.fromDynamic(
              {
                'bottomSheetTitle': bottomSheetTitle,
                'dataKey': dataKey,
                'displayMode': displayMode,
                'dropdownType': dropdownType,
                'hint': hint,
                'isHighlighted': isHighlighted,
                'itemList': itemList,
                'labelText': labelText,
                'padding': padding,
                'validationErrorMessage': validationErrorMessage,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoDropdownFormFieldBuilder.kType,
        );

  final String? bottomSheetTitle;

  final String? dataKey;

  final NeoDropdownFormFieldDisplayMode displayMode;

  final NeoDropdownType dropdownType;

  final String? hint;

  final bool isHighlighted;

  final dynamic itemList;

  final String labelText;

  final EdgeInsetsDirectional padding;

  final String? validationErrorMessage;
}

class NeoDropdownFormFieldBuilderModel extends JsonWidgetBuilderModel {
  const NeoDropdownFormFieldBuilderModel(
    super.args, {
    this.bottomSheetTitle,
    this.dataKey,
    this.displayMode = NeoDropdownFormFieldDisplayMode.defaultMode,
    required this.dropdownType,
    this.hint,
    this.isHighlighted = false,
    required this.itemList,
    this.labelText = "",
    this.padding = EdgeInsetsDirectional.zero,
    this.validationErrorMessage,
  });

  final String? bottomSheetTitle;

  final String? dataKey;

  final NeoDropdownFormFieldDisplayMode displayMode;

  final NeoDropdownType dropdownType;

  final String? hint;

  final bool isHighlighted;

  final dynamic itemList;

  final String labelText;

  final EdgeInsetsDirectional padding;

  final String? validationErrorMessage;

  static NeoDropdownFormFieldBuilderModel fromDynamic(
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
        '[NeoDropdownFormFieldBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoDropdownFormFieldBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoDropdownFormFieldBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoDropdownFormFieldBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoDropdownFormFieldBuilderModel(
          args,
          bottomSheetTitle: map['bottomSheetTitle'],
          dataKey: map['dataKey'],
          displayMode:
              map['displayMode'] ?? NeoDropdownFormFieldDisplayMode.defaultMode,
          dropdownType: map['dropdownType'],
          hint: map['hint'],
          isHighlighted: JsonClass.parseBool(
            map['isHighlighted'],
            whenNull: false,
          ),
          itemList: map['itemList'],
          labelText: map['labelText'] ?? "",
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          validationErrorMessage: map['validationErrorMessage'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'bottomSheetTitle': bottomSheetTitle,
      'dataKey': dataKey,
      'displayMode': NeoDropdownFormFieldDisplayMode.defaultMode == displayMode
          ? null
          : displayMode,
      'dropdownType': dropdownType,
      'hint': hint,
      'isHighlighted': false == isHighlighted ? null : isHighlighted,
      'itemList': itemList,
      'labelText': "" == labelText ? null : labelText,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'validationErrorMessage': validationErrorMessage,
      ...args,
    });
  }
}

class NeoDropdownFormFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_dropdown_form_field.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoDropdownFormField',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'bottomSheetTitle': SchemaHelper.stringSchema,
      'dataKey': SchemaHelper.stringSchema,
      'displayMode': SchemaHelper.anySchema,
      'dropdownType': SchemaHelper.anySchema,
      'hint': SchemaHelper.stringSchema,
      'isHighlighted': SchemaHelper.boolSchema,
      'itemList': SchemaHelper.anySchema,
      'labelText': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'validationErrorMessage': SchemaHelper.stringSchema,
    },
  };
}
