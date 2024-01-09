// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_terms_and_conditions_group_builder.dart';

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

class NeoTermsAndConditionsGroupBuilder
    extends _NeoTermsAndConditionsGroupBuilder {
  const NeoTermsAndConditionsGroupBuilder({required super.args});

  static const kType = 'neo_terms_and_conditions_group';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoTermsAndConditionsGroupBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoTermsAndConditionsGroupBuilder(
        args: map,
      );

  @override
  NeoTermsAndConditionsGroupBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoTermsAndConditionsGroupBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoTermsAndConditionsGroup buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoTermsAndConditionsGroup(
      buttonLabelText: model.buttonLabelText,
      key: key,
      transitionId: model.transitionId,
    );
  }
}

class JsonNeoTermsAndConditionsGroup extends JsonWidgetData {
  JsonNeoTermsAndConditionsGroup({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.buttonLabelText = "",
    required this.transitionId,
  }) : super(
          jsonWidgetArgs: NeoTermsAndConditionsGroupBuilderModel.fromDynamic(
            {
              'buttonLabelText': buttonLabelText,
              'transitionId': transitionId,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoTermsAndConditionsGroupBuilder(
            args: NeoTermsAndConditionsGroupBuilderModel.fromDynamic(
              {
                'buttonLabelText': buttonLabelText,
                'transitionId': transitionId,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoTermsAndConditionsGroupBuilder.kType,
        );

  final String buttonLabelText;

  final String transitionId;
}

class NeoTermsAndConditionsGroupBuilderModel extends JsonWidgetBuilderModel {
  const NeoTermsAndConditionsGroupBuilderModel(
    super.args, {
    this.buttonLabelText = "",
    required this.transitionId,
  });

  final String buttonLabelText;

  final String transitionId;

  static NeoTermsAndConditionsGroupBuilderModel fromDynamic(
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
        '[NeoTermsAndConditionsGroupBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoTermsAndConditionsGroupBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoTermsAndConditionsGroupBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoTermsAndConditionsGroupBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoTermsAndConditionsGroupBuilderModel(
          args,
          buttonLabelText: map['buttonLabelText'] ?? "",
          transitionId: map['transitionId'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'buttonLabelText': "" == buttonLabelText ? null : buttonLabelText,
      'transitionId': transitionId,
      ...args,
    });
  }
}

class NeoTermsAndConditionsGroupSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_terms_and_conditions_group.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoTermsAndConditionsGroup',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'buttonLabelText': SchemaHelper.stringSchema,
      'transitionId': SchemaHelper.stringSchema,
    },
  };
}
