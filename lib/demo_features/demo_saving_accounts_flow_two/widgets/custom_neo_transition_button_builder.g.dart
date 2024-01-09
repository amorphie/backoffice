// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_neo_transition_button_builder.dart';

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

class CustomNeoTransitionButtonBuilder
    extends _CustomNeoTransitionButtonBuilder {
  const CustomNeoTransitionButtonBuilder({required super.args});

  static const kType = 'custom_neo_transition_button';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static CustomNeoTransitionButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      CustomNeoTransitionButtonBuilder(
        args: map,
      );

  @override
  CustomNeoTransitionButtonBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = CustomNeoTransitionButtonBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  CustomNeoTransitionButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return CustomNeoTransitionButton(
      entity: model.entity,
      key: key,
      text: model.text,
      transitionId: model.transitionId,
    );
  }
}

class JsonCustomNeoTransitionButton extends JsonWidgetData {
  JsonCustomNeoTransitionButton({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.entity,
    required this.text,
    required this.transitionId,
  }) : super(
          jsonWidgetArgs: CustomNeoTransitionButtonBuilderModel.fromDynamic(
            {
              'entity': entity,
              'text': text,
              'transitionId': transitionId,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => CustomNeoTransitionButtonBuilder(
            args: CustomNeoTransitionButtonBuilderModel.fromDynamic(
              {
                'entity': entity,
                'text': text,
                'transitionId': transitionId,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: CustomNeoTransitionButtonBuilder.kType,
        );

  final String entity;

  final String text;

  final String transitionId;
}

class CustomNeoTransitionButtonBuilderModel extends JsonWidgetBuilderModel {
  const CustomNeoTransitionButtonBuilderModel(
    super.args, {
    required this.entity,
    required this.text,
    required this.transitionId,
  });

  final String entity;

  final String text;

  final String transitionId;

  static CustomNeoTransitionButtonBuilderModel fromDynamic(
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
        '[CustomNeoTransitionButtonBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static CustomNeoTransitionButtonBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    CustomNeoTransitionButtonBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is CustomNeoTransitionButtonBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = CustomNeoTransitionButtonBuilderModel(
          args,
          entity: map['entity'],
          text: map['text'],
          transitionId: map['transitionId'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'entity': entity,
      'text': text,
      'transitionId': transitionId,
      ...args,
    });
  }
}

class CustomNeoTransitionButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/custom_neo_transition_button.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'CustomNeoTransitionButton',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'entity': SchemaHelper.stringSchema,
      'text': SchemaHelper.stringSchema,
      'transitionId': SchemaHelper.stringSchema,
    },
  };
}
