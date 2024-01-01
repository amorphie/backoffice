// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_image_selector_widget_builder.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: deprecated_member_use

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class NeoImageSelectorWidgetBuilder extends _NeoImageSelectorWidgetBuilder {
  const NeoImageSelectorWidgetBuilder({required super.args});

  static const kType = 'neo_image_selector_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoImageSelectorWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoImageSelectorWidgetBuilder(
        args: map,
      );
  @override
  NeoImageSelectorWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoImageSelectorWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoImageSelectorWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoImageSelectorWidget(
      crossAxisCount: model.crossAxisCount,
      crossAxisSpacing: model.crossAxisSpacing,
      dataKey: model.dataKey,
      horizontalPadding: model.horizontalPadding,
      key: key,
      mainAxisSpacing: model.mainAxisSpacing,
      padding: model.padding,
      width: model.width,
    );
  }
}

class JsonNeoImageSelectorWidget extends JsonWidgetData {
  JsonNeoImageSelectorWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 20,
    this.dataKey,
    this.horizontalPadding = 24,
    this.mainAxisSpacing = 20,
    this.padding,
    this.width,
  }) : super(
          jsonWidgetArgs: NeoImageSelectorWidgetBuilderModel.fromDynamic(
            {
              'crossAxisCount': crossAxisCount,
              'crossAxisSpacing': crossAxisSpacing,
              'dataKey': dataKey,
              'horizontalPadding': horizontalPadding,
              'mainAxisSpacing': mainAxisSpacing,
              'padding': padding,
              'width': width,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoImageSelectorWidgetBuilder(
            args: NeoImageSelectorWidgetBuilderModel.fromDynamic(
              {
                'crossAxisCount': crossAxisCount,
                'crossAxisSpacing': crossAxisSpacing,
                'dataKey': dataKey,
                'horizontalPadding': horizontalPadding,
                'mainAxisSpacing': mainAxisSpacing,
                'padding': padding,
                'width': width,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoImageSelectorWidgetBuilder.kType,
        );

  final int crossAxisCount;

  final double crossAxisSpacing;

  final String? dataKey;

  final double horizontalPadding;

  final double mainAxisSpacing;

  final EdgeInsetsDirectional? padding;

  final double? width;
}

class NeoImageSelectorWidgetBuilderModel extends JsonWidgetBuilderModel {
  const NeoImageSelectorWidgetBuilderModel(
    super.args, {
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 20,
    this.dataKey,
    this.horizontalPadding = 24,
    this.mainAxisSpacing = 20,
    this.padding,
    this.width,
  });

  final int crossAxisCount;

  final double crossAxisSpacing;

  final String? dataKey;

  final double horizontalPadding;

  final double mainAxisSpacing;

  final EdgeInsetsDirectional? padding;

  final double? width;

  static NeoImageSelectorWidgetBuilderModel fromDynamic(
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
        '[NeoImageSelectorWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoImageSelectorWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoImageSelectorWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoImageSelectorWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoImageSelectorWidgetBuilderModel(
          args,
          crossAxisCount: () {
            dynamic parsed = JsonClass.maybeParseInt(map['crossAxisCount']);
            parsed ??= 2;

            return parsed;
          }(),
          crossAxisSpacing: () {
            dynamic parsed =
                JsonClass.maybeParseDouble(map['crossAxisSpacing']);
            parsed ??= 20.0;

            return parsed;
          }(),
          dataKey: map['dataKey'],
          horizontalPadding: () {
            dynamic parsed =
                JsonClass.maybeParseDouble(map['horizontalPadding']);
            parsed ??= 24.0;

            return parsed;
          }(),
          mainAxisSpacing: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['mainAxisSpacing']);
            parsed ??= 20.0;

            return parsed;
          }(),
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );

            return parsed;
          }(),
          width: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['width']);

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
      'crossAxisCount': 2 == crossAxisCount ? null : crossAxisCount,
      'crossAxisSpacing': 20 == crossAxisSpacing ? null : crossAxisSpacing,
      'dataKey': dataKey,
      'horizontalPadding': 24 == horizontalPadding ? null : horizontalPadding,
      'mainAxisSpacing': 20 == mainAxisSpacing ? null : mainAxisSpacing,
      'padding': ThemeEncoder.encodeEdgeInsetsDirectional(
        padding,
      ),
      'width': width,
      ...args,
    });
  }
}

class NeoImageSelectorWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_image_selector_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoImageSelectorWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'crossAxisCount': SchemaHelper.numberSchema,
      'crossAxisSpacing': SchemaHelper.numberSchema,
      'dataKey': SchemaHelper.stringSchema,
      'horizontalPadding': SchemaHelper.numberSchema,
      'mainAxisSpacing': SchemaHelper.numberSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'width': SchemaHelper.numberSchema,
    },
  };
}
