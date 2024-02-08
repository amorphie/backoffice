// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_bo_detail_item_title.dart';

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

class NeoBoDetailItemTitle extends _NeoBoDetailItemTitle {
  const NeoBoDetailItemTitle({required super.args});

  static const kType = 'neo_bo_detail_item_title_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoBoDetailItemTitle fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoBoDetailItemTitle(
        args: map,
      );

  @override
  NeoBoDetailItemTitleModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoBoDetailItemTitleModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoBoDetailItemTitleWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoBoDetailItemTitleWidget(
      key: key,
      title: model.title,
    );
  }
}

class JsonNeoBoDetailItemTitleWidget extends JsonWidgetData {
  JsonNeoBoDetailItemTitleWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.title,
  }) : super(
          jsonWidgetArgs: NeoBoDetailItemTitleModel.fromDynamic(
            {
              'title': title,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoBoDetailItemTitle(
            args: NeoBoDetailItemTitleModel.fromDynamic(
              {
                'title': title,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoBoDetailItemTitle.kType,
        );

  final String title;
}

class NeoBoDetailItemTitleModel extends JsonWidgetBuilderModel {
  const NeoBoDetailItemTitleModel(
    super.args, {
    required this.title,
  });

  final String title;

  static NeoBoDetailItemTitleModel fromDynamic(
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
        '[NeoBoDetailItemTitle]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoBoDetailItemTitleModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoBoDetailItemTitleModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoBoDetailItemTitleModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoBoDetailItemTitleModel(
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

class NeoBoDetailItemTitleWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_bo_detail_item_title_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoBoDetailItemTitleWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'title': SchemaHelper.stringSchema,
    },
  };
}
