// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animated_icon_builder.dart';

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

class AnimatedIconBuilder extends _AnimatedIconBuilder {
  const AnimatedIconBuilder({required super.args});

  static const kType = 'animated_icon';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static AnimatedIconBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      AnimatedIconBuilder(
        args: map,
      );

  @override
  AnimatedIconBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = AnimatedIconBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  AnimatedIconExample buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return AnimatedIconExample(
      key: key,
    );
  }
}

class JsonAnimatedIconExample extends JsonWidgetData {
  JsonAnimatedIconExample({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) : super(
          jsonWidgetArgs: AnimatedIconBuilderModel.fromDynamic(
            {
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => AnimatedIconBuilder(
            args: AnimatedIconBuilderModel.fromDynamic(
              {
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: AnimatedIconBuilder.kType,
        );
}

class AnimatedIconBuilderModel extends JsonWidgetBuilderModel {
  const AnimatedIconBuilderModel(super.args);

  static AnimatedIconBuilderModel fromDynamic(
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
        '[AnimatedIconBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static AnimatedIconBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    AnimatedIconBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is AnimatedIconBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = AnimatedIconBuilderModel(
          args,
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      ...args,
    });
  }
}

class AnimatedIconExampleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/animated_icon_example.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'AnimatedIconExample',
    'type': 'object',
    'additionalProperties': false,
    'properties': {},
  };
}
