// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_text_form_field_builder.dart';

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

class NeoTextFormFieldBuilder extends _NeoTextFormFieldBuilder {
  const NeoTextFormFieldBuilder({required super.args});

  static const kType = 'neo_text_form_field';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoTextFormFieldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoTextFormFieldBuilder(
        args: map,
      );

  @override
  NeoTextFormFieldBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoTextFormFieldBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoTextFormField buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final inputFormattersDecoded = _decodeInputFormatters(
      data: data,
    );
    final validationsDecoded = _decodeValidations(
      data: data,
    );

    return NeoTextFormField(
      bottomText: model.bottomText,
      buttonRight: model.buttonRight,
      dataKey: model.dataKey,
      enableInitialValue: model.enableInitialValue,
      enableInteractiveSelection: model.enableInteractiveSelection,
      enabled: model.enabled,
      focusNode: model.focusNode,
      iconLeftUrn: model.iconLeftUrn,
      iconRightUrn: model.iconRightUrn,
      inputFormatters: inputFormattersDecoded,
      key: key,
      keyboardType: model.keyboardType,
      labelInitialText: model.labelInitialText,
      labelText: model.labelText,
      maxLength: model.maxLength,
      obscureText: model.obscureText,
      padding: model.padding,
      showObscureStatusChangeButton: model.showObscureStatusChangeButton,
      subtitleText: model.subtitleText,
      titleIconUrn: model.titleIconUrn,
      titleText: model.titleText,
      validations: validationsDecoded,
      widgetEventKey: model.widgetEventKey,
    );
  }
}

class JsonNeoTextFormField extends JsonWidgetData {
  JsonNeoTextFormField({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.bottomText,
    this.buttonRight,
    this.dataKey,
    this.enableInitialValue = true,
    this.enableInteractiveSelection,
    this.enabled = true,
    this.focusNode,
    this.iconLeftUrn,
    this.iconRightUrn,
    required this.inputFormatters,
    this.keyboardType,
    this.labelInitialText = '',
    this.labelText,
    this.maxLength,
    this.obscureText = false,
    this.padding,
    this.showObscureStatusChangeButton = false,
    this.subtitleText = '',
    this.titleIconUrn,
    this.titleText = '',
    required this.validations,
    this.widgetEventKey,
  }) : super(
          jsonWidgetArgs: NeoTextFormFieldBuilderModel.fromDynamic(
            {
              'bottomText': bottomText,
              'buttonRight': buttonRight,
              'dataKey': dataKey,
              'enableInitialValue': enableInitialValue,
              'enableInteractiveSelection': enableInteractiveSelection,
              'enabled': enabled,
              'focusNode': focusNode,
              'iconLeftUrn': iconLeftUrn,
              'iconRightUrn': iconRightUrn,
              'inputFormatters': inputFormatters,
              'keyboardType': keyboardType,
              'labelInitialText': labelInitialText,
              'labelText': labelText,
              'maxLength': maxLength,
              'obscureText': obscureText,
              'padding': padding,
              'showObscureStatusChangeButton': showObscureStatusChangeButton,
              'subtitleText': subtitleText,
              'titleIconUrn': titleIconUrn,
              'titleText': titleText,
              'validations': validations,
              'widgetEventKey': widgetEventKey,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoTextFormFieldBuilder(
            args: NeoTextFormFieldBuilderModel.fromDynamic(
              {
                'bottomText': bottomText,
                'buttonRight': buttonRight,
                'dataKey': dataKey,
                'enableInitialValue': enableInitialValue,
                'enableInteractiveSelection': enableInteractiveSelection,
                'enabled': enabled,
                'focusNode': focusNode,
                'iconLeftUrn': iconLeftUrn,
                'iconRightUrn': iconRightUrn,
                'inputFormatters': inputFormatters,
                'keyboardType': keyboardType,
                'labelInitialText': labelInitialText,
                'labelText': labelText,
                'maxLength': maxLength,
                'obscureText': obscureText,
                'padding': padding,
                'showObscureStatusChangeButton': showObscureStatusChangeButton,
                'subtitleText': subtitleText,
                'titleIconUrn': titleIconUrn,
                'titleText': titleText,
                'validations': validations,
                'widgetEventKey': widgetEventKey,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoTextFormFieldBuilder.kType,
        );

  final NeoTextFormFieldBottomTextModel? bottomText;

  final NeoButtonDataModel? buttonRight;

  final String? dataKey;

  final bool enableInitialValue;

  final bool? enableInteractiveSelection;

  final bool enabled;

  final FocusNode? focusNode;

  final String? iconLeftUrn;

  final String? iconRightUrn;

  final dynamic inputFormatters;

  final NeoKeyboardType? keyboardType;

  final String labelInitialText;

  final String? labelText;

  final int? maxLength;

  final bool obscureText;

  final EdgeInsetsDirectional? padding;

  final bool showObscureStatusChangeButton;

  final String subtitleText;

  final String? titleIconUrn;

  final String titleText;

  final dynamic validations;

  final String? widgetEventKey;
}

class NeoTextFormFieldBuilderModel extends JsonWidgetBuilderModel {
  const NeoTextFormFieldBuilderModel(
    super.args, {
    this.bottomText,
    this.buttonRight,
    this.dataKey,
    this.enableInitialValue = true,
    this.enableInteractiveSelection,
    this.enabled = true,
    this.focusNode,
    this.iconLeftUrn,
    this.iconRightUrn,
    required this.inputFormatters,
    this.keyboardType,
    this.labelInitialText = '',
    this.labelText,
    this.maxLength,
    this.obscureText = false,
    this.padding,
    this.showObscureStatusChangeButton = false,
    this.subtitleText = '',
    this.titleIconUrn,
    this.titleText = '',
    required this.validations,
    this.widgetEventKey,
  });

  final NeoTextFormFieldBottomTextModel? bottomText;

  final NeoButtonDataModel? buttonRight;

  final String? dataKey;

  final bool enableInitialValue;

  final bool? enableInteractiveSelection;

  final bool enabled;

  final FocusNode? focusNode;

  final String? iconLeftUrn;

  final String? iconRightUrn;

  final dynamic inputFormatters;

  final NeoKeyboardType? keyboardType;

  final String labelInitialText;

  final String? labelText;

  final int? maxLength;

  final bool obscureText;

  final EdgeInsetsDirectional? padding;

  final bool showObscureStatusChangeButton;

  final String subtitleText;

  final String? titleIconUrn;

  final String titleText;

  final dynamic validations;

  final String? widgetEventKey;

  static NeoTextFormFieldBuilderModel fromDynamic(
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
        '[NeoTextFormFieldBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoTextFormFieldBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoTextFormFieldBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoTextFormFieldBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoTextFormFieldBuilderModel(
          args,
          bottomText: map['bottomText'],
          buttonRight: map['buttonRight'],
          dataKey: map['dataKey'],
          enableInitialValue: JsonClass.parseBool(
            map['enableInitialValue'],
            whenNull: true,
          ),
          enableInteractiveSelection: JsonClass.maybeParseBool(
            map['enableInteractiveSelection'],
          ),
          enabled: JsonClass.parseBool(
            map['enabled'],
            whenNull: true,
          ),
          focusNode: map['focusNode'],
          iconLeftUrn: map['iconLeftUrn'],
          iconRightUrn: map['iconRightUrn'],
          inputFormatters: map['inputFormatters'],
          keyboardType: map['keyboardType'],
          labelInitialText: map['labelInitialText'] ?? '',
          labelText: map['labelText'],
          maxLength: () {
            dynamic parsed = JsonClass.maybeParseInt(map['maxLength']);

            return parsed;
          }(),
          obscureText: JsonClass.parseBool(
            map['obscureText'],
            whenNull: false,
          ),
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );

            return parsed;
          }(),
          showObscureStatusChangeButton: JsonClass.parseBool(
            map['showObscureStatusChangeButton'],
            whenNull: false,
          ),
          subtitleText: map['subtitleText'] ?? '',
          titleIconUrn: map['titleIconUrn'],
          titleText: map['titleText'] ?? '',
          validations: map['validations'],
          widgetEventKey: map['widgetEventKey'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'bottomText': bottomText,
      'buttonRight': buttonRight,
      'dataKey': dataKey,
      'enableInitialValue':
          true == enableInitialValue ? null : enableInitialValue,
      'enableInteractiveSelection': enableInteractiveSelection,
      'enabled': true == enabled ? null : enabled,
      'focusNode': focusNode,
      'iconLeftUrn': iconLeftUrn,
      'iconRightUrn': iconRightUrn,
      'inputFormatters': inputFormatters,
      'keyboardType': keyboardType,
      'labelInitialText': '' == labelInitialText ? null : labelInitialText,
      'labelText': labelText,
      'maxLength': maxLength,
      'obscureText': false == obscureText ? null : obscureText,
      'padding': ThemeEncoder.encodeEdgeInsetsDirectional(
        padding,
      ),
      'showObscureStatusChangeButton': false == showObscureStatusChangeButton
          ? null
          : showObscureStatusChangeButton,
      'subtitleText': '' == subtitleText ? null : subtitleText,
      'titleIconUrn': titleIconUrn,
      'titleText': '' == titleText ? null : titleText,
      'validations': validations,
      'widgetEventKey': widgetEventKey,
      ...args,
    });
  }
}

class NeoTextFormFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_text_form_field.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoTextFormField',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'bottomText': SchemaHelper.anySchema,
      'buttonRight': SchemaHelper.anySchema,
      'dataKey': SchemaHelper.stringSchema,
      'enableInitialValue': SchemaHelper.boolSchema,
      'enableInteractiveSelection': SchemaHelper.boolSchema,
      'enabled': SchemaHelper.boolSchema,
      'focusNode': SchemaHelper.anySchema,
      'iconLeftUrn': SchemaHelper.stringSchema,
      'iconRightUrn': SchemaHelper.stringSchema,
      'inputFormatters': SchemaHelper.anySchema,
      'keyboardType': SchemaHelper.anySchema,
      'labelInitialText': SchemaHelper.stringSchema,
      'labelText': SchemaHelper.stringSchema,
      'maxLength': SchemaHelper.numberSchema,
      'obscureText': SchemaHelper.boolSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'showObscureStatusChangeButton': SchemaHelper.boolSchema,
      'subtitleText': SchemaHelper.stringSchema,
      'titleIconUrn': SchemaHelper.stringSchema,
      'titleText': SchemaHelper.stringSchema,
      'validations': SchemaHelper.anySchema,
      'widgetEventKey': SchemaHelper.stringSchema,
    },
  };
}
