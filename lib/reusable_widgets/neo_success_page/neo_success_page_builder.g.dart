// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_success_page_builder.dart';

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

class NeoSuccessPageBuilder extends _NeoSuccessPageBuilder {
  const NeoSuccessPageBuilder({required super.args});

  static const kType = 'neo_success_page';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoSuccessPageBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoSuccessPageBuilder(
        args: map,
      );

  @override
  NeoSuccessPageBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoSuccessPageBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoSuccessPage buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoSuccessPage(
      appBar: model.appBar?.build(
        childBuilder: childBuilder,
        context: context,
      ) as PreferredSizeWidget?,
      buttonList: [
        for (var d in model.buttonList)
          d.build(
            childBuilder: childBuilder,
            context: context,
          ),
      ],
      descriptionTextList: [
        for (var d in model.descriptionTextList)
          d.build(
            childBuilder: childBuilder,
            context: context,
          ),
      ],
      image: model.image.build(
        childBuilder: childBuilder,
        context: context,
      ),
      key: key,
      padding: model.padding,
      titleText: model.titleText.build(
        childBuilder: childBuilder,
        context: context,
      ),
      useSafeArea: model.useSafeArea,
    );
  }
}

class JsonNeoSuccessPage extends JsonWidgetData {
  JsonNeoSuccessPage({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.appBar,
    required this.buttonList,
    this.descriptionTextList = const [],
    required this.image,
    this.padding = EdgeInsetsDirectional.zero,
    required this.titleText,
    this.useSafeArea = true,
  }) : super(
          jsonWidgetArgs: NeoSuccessPageBuilderModel.fromDynamic(
            {
              'appBar': appBar,
              'buttonList': buttonList,
              'descriptionTextList': descriptionTextList,
              'image': image,
              'padding': padding,
              'titleText': titleText,
              'useSafeArea': useSafeArea,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoSuccessPageBuilder(
            args: NeoSuccessPageBuilderModel.fromDynamic(
              {
                'appBar': appBar,
                'buttonList': buttonList,
                'descriptionTextList': descriptionTextList,
                'image': image,
                'padding': padding,
                'titleText': titleText,
                'useSafeArea': useSafeArea,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoSuccessPageBuilder.kType,
        );

  final JsonWidgetData? appBar;

  final List<JsonWidgetData> buttonList;

  final List<JsonWidgetData> descriptionTextList;

  final JsonWidgetData image;

  final EdgeInsetsDirectional padding;

  final JsonWidgetData titleText;

  final bool useSafeArea;
}

class NeoSuccessPageBuilderModel extends JsonWidgetBuilderModel {
  const NeoSuccessPageBuilderModel(
    super.args, {
    this.appBar,
    required this.buttonList,
    this.descriptionTextList = const [],
    required this.image,
    this.padding = EdgeInsetsDirectional.zero,
    required this.titleText,
    this.useSafeArea = true,
  });

  final JsonWidgetData? appBar;

  final List<JsonWidgetData> buttonList;

  final List<JsonWidgetData> descriptionTextList;

  final JsonWidgetData image;

  final EdgeInsetsDirectional padding;

  final JsonWidgetData titleText;

  final bool useSafeArea;

  static NeoSuccessPageBuilderModel fromDynamic(
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
        '[NeoSuccessPageBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoSuccessPageBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoSuccessPageBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoSuccessPageBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoSuccessPageBuilderModel(
          args,
          appBar: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamic(
              map['appBar'],
              registry: registry,
            );

            return parsed;
          }(),
          buttonList: () {
            dynamic parsed = JsonWidgetData.fromDynamicList(
              map['buttonList'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [buttonList].');
            }
            return parsed;
          }(),
          descriptionTextList: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamicList(
              map['descriptionTextList'],
              registry: registry,
            );
            parsed ??= const [];

            return parsed;
          }(),
          image: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['image'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [image].');
            }
            return parsed;
          }(),
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          titleText: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['titleText'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [titleText].');
            }
            return parsed;
          }(),
          useSafeArea: JsonClass.parseBool(
            map['useSafeArea'],
            whenNull: true,
          ),
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'appBar': appBar?.toJson(),
      'buttonList': JsonClass.toJsonList(buttonList),
      'descriptionTextList': const [] == descriptionTextList
          ? null
          : JsonClass.toJsonList(descriptionTextList),
      'image': image.toJson(),
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'titleText': titleText.toJson(),
      'useSafeArea': true == useSafeArea ? null : useSafeArea,
      ...args,
    });
  }
}

class NeoSuccessPageSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_success_page.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoSuccessPage',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'appBar': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'buttonList': SchemaHelper.arraySchema(JsonWidgetDataSchema.id),
      'descriptionTextList': SchemaHelper.arraySchema(JsonWidgetDataSchema.id),
      'image': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'titleText': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'useSafeArea': SchemaHelper.boolSchema,
    },
  };
}
