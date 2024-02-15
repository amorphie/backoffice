// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segmented_language_switch_builder.dart';

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

class SegmentedLanguageSwitchBuilder extends _SegmentedLanguageSwitchBuilder {
  const SegmentedLanguageSwitchBuilder({required super.args});

  static const kType = 'segmented_language_switch';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static SegmentedLanguageSwitchBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      SegmentedLanguageSwitchBuilder(
        args: map,
      );

  @override
  SegmentedLanguageSwitchBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = SegmentedLanguageSwitchBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  SegmentedLanguageSwitch buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return SegmentedLanguageSwitch(
      key: key,
      padding: model.padding,
    );
  }
}

class JsonSegmentedLanguageSwitch extends JsonWidgetData {
  JsonSegmentedLanguageSwitch({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs: SegmentedLanguageSwitchBuilderModel.fromDynamic(
            {
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => SegmentedLanguageSwitchBuilder(
            args: SegmentedLanguageSwitchBuilderModel.fromDynamic(
              {
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: SegmentedLanguageSwitchBuilder.kType,
        );

  final EdgeInsetsDirectional padding;
}

class SegmentedLanguageSwitchBuilderModel extends JsonWidgetBuilderModel {
  const SegmentedLanguageSwitchBuilderModel(
    super.args, {
    this.padding = EdgeInsetsDirectional.zero,
  });

  final EdgeInsetsDirectional padding;

  static SegmentedLanguageSwitchBuilderModel fromDynamic(
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
        '[SegmentedLanguageSwitchBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static SegmentedLanguageSwitchBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    SegmentedLanguageSwitchBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is SegmentedLanguageSwitchBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = SegmentedLanguageSwitchBuilderModel(
          args,
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
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      ...args,
    });
  }
}

class SegmentedLanguageSwitchSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/segmented_language_switch.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'SegmentedLanguageSwitch',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
