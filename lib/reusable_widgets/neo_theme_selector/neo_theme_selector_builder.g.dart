// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_theme_selector_builder.dart';

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

class NeoThemeSelectorBuilder extends _NeoThemeSelectorBuilder {
  const NeoThemeSelectorBuilder({required super.args});

  static const kType = 'neo_theme_selector';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoThemeSelectorBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoThemeSelectorBuilder(
        args: map,
      );

  @override
  NeoThemeSelectorBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoThemeSelectorBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoThemeSelector buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoThemeSelector(
      iconUrn: model.iconUrn,
      key: key,
      padding: model.padding,
      title: model.title,
    );
  }
}

class JsonNeoThemeSelector extends JsonWidgetData {
  JsonNeoThemeSelector({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.iconUrn,
    this.padding = EdgeInsetsDirectional.zero,
    this.title,
  }) : super(
          jsonWidgetArgs: NeoThemeSelectorBuilderModel.fromDynamic(
            {
              'iconUrn': iconUrn,
              'padding': padding,
              'title': title,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoThemeSelectorBuilder(
            args: NeoThemeSelectorBuilderModel.fromDynamic(
              {
                'iconUrn': iconUrn,
                'padding': padding,
                'title': title,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoThemeSelectorBuilder.kType,
        );

  final String? iconUrn;

  final EdgeInsetsDirectional padding;

  final String? title;
}

class NeoThemeSelectorBuilderModel extends JsonWidgetBuilderModel {
  const NeoThemeSelectorBuilderModel(
    super.args, {
    this.iconUrn,
    this.padding = EdgeInsetsDirectional.zero,
    this.title,
  });

  final String? iconUrn;

  final EdgeInsetsDirectional padding;

  final String? title;

  static NeoThemeSelectorBuilderModel fromDynamic(
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
        '[NeoThemeSelectorBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoThemeSelectorBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoThemeSelectorBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoThemeSelectorBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoThemeSelectorBuilderModel(
          args,
          iconUrn: map['iconUrn'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          title: map['title'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'iconUrn': iconUrn,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'title': title,
      ...args,
    });
  }
}

class NeoThemeSelectorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_theme_selector.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoThemeSelector',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'iconUrn': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'title': SchemaHelper.stringSchema,
    },
  };
}
