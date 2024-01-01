// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_bullet_list_view_builder.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: deprecated_member_use

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class NeoBulletListViewBuilder extends _NeoBulletListViewBuilder {
  const NeoBulletListViewBuilder({required super.args});

  static const kType = 'neo_bullet_list_view';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoBulletListViewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoBulletListViewBuilder(
        args: map,
      );
  @override
  NeoBulletListViewBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoBulletListViewBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoBulletListView buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final bulletListDecoded = _decodeBulletList(
      data: data,
    );

    return NeoBulletListView(
      bulletList: bulletListDecoded,
      key: key,
    );
  }
}

class JsonNeoBulletListView extends JsonWidgetData {
  JsonNeoBulletListView({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.bulletList,
  }) : super(
          jsonWidgetArgs: NeoBulletListViewBuilderModel.fromDynamic(
            {
              'bulletList': bulletList,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoBulletListViewBuilder(
            args: NeoBulletListViewBuilderModel.fromDynamic(
              {
                'bulletList': bulletList,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoBulletListViewBuilder.kType,
        );

  final dynamic bulletList;
}

class NeoBulletListViewBuilderModel extends JsonWidgetBuilderModel {
  const NeoBulletListViewBuilderModel(
    super.args, {
    required this.bulletList,
  });

  final dynamic bulletList;

  static NeoBulletListViewBuilderModel fromDynamic(
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
        '[NeoBulletListViewBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoBulletListViewBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoBulletListViewBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoBulletListViewBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoBulletListViewBuilderModel(
          args,
          bulletList: map['bulletList'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'bulletList': bulletList,
      ...args,
    });
  }
}

class NeoBulletListViewSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_bullet_list_view.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoBulletListView',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'bulletList': SchemaHelper.anySchema,
    },
  };
}
