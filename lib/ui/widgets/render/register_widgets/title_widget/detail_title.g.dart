// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_title.dart';

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

class DetailTitle extends _DetailTitle {
  const DetailTitle({required super.args});

  static const kType = 'detail_title_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static DetailTitle fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      DetailTitle(
        args: map,
      );

  @override
  DetailTitleModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = DetailTitleModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  DetailTitleWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return DetailTitleWidget(
      key: key,
      title: model.title,
    );
  }
}

class JsonDetailTitleWidget extends JsonWidgetData {
  JsonDetailTitleWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.title,
  }) : super(
          jsonWidgetArgs: DetailTitleModel.fromDynamic(
            {
              'title': title,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => DetailTitle(
            args: DetailTitleModel.fromDynamic(
              {
                'title': title,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: DetailTitle.kType,
        );

  final String title;
}

class DetailTitleModel extends JsonWidgetBuilderModel {
  const DetailTitleModel(
    super.args, {
    required this.title,
  });

  final String title;

  static DetailTitleModel fromDynamic(
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
        '[DetailTitle]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static DetailTitleModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    DetailTitleModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is DetailTitleModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = DetailTitleModel(
          args,
          title: map['title'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'title': title,
      ...args,
    });
  }
}

class DetailTitleWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/admin/detail_title_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'DetailTitleWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'title': SchemaHelper.stringSchema,
    },
  };
}
