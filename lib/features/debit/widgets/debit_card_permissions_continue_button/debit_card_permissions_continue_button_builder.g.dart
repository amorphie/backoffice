// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debit_card_permissions_continue_button_builder.dart';

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

class DebitCardPermissionsContinueButtonBuilder
    extends _DebitCardPermissionsContinueButtonBuilder {
  const DebitCardPermissionsContinueButtonBuilder({required super.args});

  static const kType = 'debit_card_permissions_continue_button';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static DebitCardPermissionsContinueButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      DebitCardPermissionsContinueButtonBuilder(
        args: map,
      );

  @override
  DebitCardPermissionsContinueButtonBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = DebitCardPermissionsContinueButtonBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  DebitCardPermissionsContinueButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return DebitCardPermissionsContinueButton(
      formValidationRequired: model.formValidationRequired,
      key: key,
      labelText: model.labelText,
      padding: model.padding,
      size: model.size,
      transitionId: model.transitionId,
    );
  }
}

class JsonDebitCardPermissionsContinueButton extends JsonWidgetData {
  JsonDebitCardPermissionsContinueButton({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.formValidationRequired = false,
    this.labelText = "",
    this.padding,
    this.size = NeoButtonSize.medium,
    this.transitionId,
  }) : super(
          jsonWidgetArgs:
              DebitCardPermissionsContinueButtonBuilderModel.fromDynamic(
            {
              'formValidationRequired': formValidationRequired,
              'labelText': labelText,
              'padding': padding,
              'size': size,
              'transitionId': transitionId,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => DebitCardPermissionsContinueButtonBuilder(
            args: DebitCardPermissionsContinueButtonBuilderModel.fromDynamic(
              {
                'formValidationRequired': formValidationRequired,
                'labelText': labelText,
                'padding': padding,
                'size': size,
                'transitionId': transitionId,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: DebitCardPermissionsContinueButtonBuilder.kType,
        );

  final bool formValidationRequired;

  final String labelText;

  final EdgeInsetsDirectional? padding;

  final NeoButtonSize size;

  final String? transitionId;
}

class DebitCardPermissionsContinueButtonBuilderModel
    extends JsonWidgetBuilderModel {
  const DebitCardPermissionsContinueButtonBuilderModel(
    super.args, {
    this.formValidationRequired = false,
    this.labelText = "",
    this.padding,
    this.size = NeoButtonSize.medium,
    this.transitionId,
  });

  final bool formValidationRequired;

  final String labelText;

  final EdgeInsetsDirectional? padding;

  final NeoButtonSize size;

  final String? transitionId;

  static DebitCardPermissionsContinueButtonBuilderModel fromDynamic(
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
        '[DebitCardPermissionsContinueButtonBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static DebitCardPermissionsContinueButtonBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    DebitCardPermissionsContinueButtonBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is DebitCardPermissionsContinueButtonBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = DebitCardPermissionsContinueButtonBuilderModel(
          args,
          formValidationRequired: JsonClass.parseBool(
            map['formValidationRequired'],
            whenNull: false,
          ),
          labelText: map['labelText'] ?? "",
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );

            return parsed;
          }(),
          size: map['size'] ?? NeoButtonSize.medium,
          transitionId: map['transitionId'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'formValidationRequired':
          false == formValidationRequired ? null : formValidationRequired,
      'labelText': "" == labelText ? null : labelText,
      'padding': ThemeEncoder.encodeEdgeInsetsDirectional(
        padding,
      ),
      'size': NeoButtonSize.medium == size ? null : size,
      'transitionId': transitionId,
      ...args,
    });
  }
}

class DebitCardPermissionsContinueButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/debit_card_permissions_continue_button.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'DebitCardPermissionsContinueButton',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'formValidationRequired': SchemaHelper.boolSchema,
      'labelText': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'size': SchemaHelper.anySchema,
      'transitionId': SchemaHelper.stringSchema,
    },
  };
}
