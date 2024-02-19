// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_navigation_button_builder.dart';

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

class NeoNavigationButtonBuilder extends _NeoNavigationButtonBuilder {
  const NeoNavigationButtonBuilder({required super.args});

  static const kType = 'neo_navigation_button';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoNavigationButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoNavigationButtonBuilder(
        args: map,
      );

  @override
  NeoNavigationButtonBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoNavigationButtonBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoNavigationButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoNavigationButton(
      key: key,
      navigationPath: model.navigationPath,
      navigationType: model.navigationType,
      child: model.child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

class JsonNeoNavigationButton extends JsonWidgetData {
  JsonNeoNavigationButton({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.navigationPath,
    required this.navigationType,
    required this.child,
  }) : super(
          jsonWidgetArgs: NeoNavigationButtonBuilderModel.fromDynamic(
            {
              'navigationPath': navigationPath,
              'navigationType': navigationType,
              'child': child,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoNavigationButtonBuilder(
            args: NeoNavigationButtonBuilderModel.fromDynamic(
              {
                'navigationPath': navigationPath,
                'navigationType': navigationType,
                'child': child,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoNavigationButtonBuilder.kType,
        );

  final String navigationPath;

  final NeoNavigationType navigationType;

  final JsonWidgetData child;
}

class NeoNavigationButtonBuilderModel extends JsonWidgetBuilderModel {
  const NeoNavigationButtonBuilderModel(
    super.args, {
    required this.navigationPath,
    required this.navigationType,
    required this.child,
  });

  final String navigationPath;

  final NeoNavigationType navigationType;

  final JsonWidgetData child;

  static NeoNavigationButtonBuilderModel fromDynamic(
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
        '[NeoNavigationButtonBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoNavigationButtonBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoNavigationButtonBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoNavigationButtonBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoNavigationButtonBuilderModel(
          args,
          navigationPath: map['navigationPath'],
          navigationType: map['navigationType'],
          child: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['child'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [child].');
            }
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
      'navigationPath': navigationPath,
      'navigationType': navigationType,
      'child': child.toJson(),
      ...args,
    });
  }
}

class NeoNavigationButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_navigation_button.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoNavigationButton',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'navigationPath': SchemaHelper.stringSchema,
      'navigationType': SchemaHelper.anySchema,
      'child': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
    },
  };
}
