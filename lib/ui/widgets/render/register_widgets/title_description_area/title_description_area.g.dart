// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_description_area.dart';

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

class TitleDescriptionArea extends _TitleDescriptionArea {
  const TitleDescriptionArea({required super.args});

  static const kType = 'title_description_area_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static TitleDescriptionArea fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      TitleDescriptionArea(
        args: map,
      );

  @override
  TitleDescriptionAreaModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = TitleDescriptionAreaModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  TitleDescriptionAreaWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );
    print(model);

    return TitleDescriptionAreaWidget(
      copyValue: model.copyValue,
      key: key,
      text: model.text,
      title: model.title,
    );
  }
}

class JsonTitleDescriptionAreaWidget extends JsonWidgetData {
  JsonTitleDescriptionAreaWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.copyValue = false,
    this.text = "",
    this.title = "",
  }) : super(
          jsonWidgetArgs: TitleDescriptionAreaModel.fromDynamic(
            {
              'copyValue': copyValue,
              'text': text,
              'title': title,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => TitleDescriptionArea(
            args: TitleDescriptionAreaModel.fromDynamic(
              {
                'copyValue': copyValue,
                'text': text,
                'title': title,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: TitleDescriptionArea.kType,
        );

  final bool copyValue;

  final String text;

  final String title;
}

class TitleDescriptionAreaModel extends JsonWidgetBuilderModel {
  const TitleDescriptionAreaModel(
    super.args, {
    this.copyValue = false,
    this.text = "",
    this.title = "",
  });

  final bool copyValue;

  final String text;

  final String title;

  static TitleDescriptionAreaModel fromDynamic(
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
        '[TitleDescriptionArea]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static TitleDescriptionAreaModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    TitleDescriptionAreaModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is TitleDescriptionAreaModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = TitleDescriptionAreaModel(
          args,
          copyValue: JsonClass.parseBool(
            map['copyValue'],
            whenNull: false,
          ),
          text: map['text'] ?? "",
          title: map['title'] ?? "",
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'copyValue': false == copyValue ? null : copyValue,
      'text': "" == text ? null : text,
      'title': "" == title ? null : title,
      ...args,
    });
  }
}

class TitleDescriptionAreaWidgetSchema {
  static const id = 'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/admin/title_description_area_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'TitleDescriptionAreaWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'copyValue': SchemaHelper.boolSchema,
      'text': SchemaHelper.stringSchema,
      'title': SchemaHelper.stringSchema,
    },
  };
}
