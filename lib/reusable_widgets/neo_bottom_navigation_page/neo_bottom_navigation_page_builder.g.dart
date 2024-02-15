// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_bottom_navigation_page_builder.dart';

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

class NeoBottomNavigationPageBuilder extends _NeoBottomNavigationPageBuilder {
  const NeoBottomNavigationPageBuilder({required super.args});

  static const kType = 'neo_bottom_navigation_page';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoBottomNavigationPageBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoBottomNavigationPageBuilder(
        args: map,
      );

  @override
  NeoBottomNavigationPageBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoBottomNavigationPageBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoBottomNavigationPage buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final tabsDecoded = _decodeBottomNavigationModelList(
      data: data,
    );

    return NeoBottomNavigationPage(
      key: key,
      tabs: tabsDecoded,
    );
  }
}

class JsonNeoBottomNavigationPage extends JsonWidgetData {
  JsonNeoBottomNavigationPage({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.tabs,
  }) : super(
          jsonWidgetArgs: NeoBottomNavigationPageBuilderModel.fromDynamic(
            {
              'tabs': tabs,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoBottomNavigationPageBuilder(
            args: NeoBottomNavigationPageBuilderModel.fromDynamic(
              {
                'tabs': tabs,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoBottomNavigationPageBuilder.kType,
        );

  final dynamic tabs;
}

class NeoBottomNavigationPageBuilderModel extends JsonWidgetBuilderModel {
  const NeoBottomNavigationPageBuilderModel(
    super.args, {
    required this.tabs,
  });

  final dynamic tabs;

  static NeoBottomNavigationPageBuilderModel fromDynamic(
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
        '[NeoBottomNavigationPageBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoBottomNavigationPageBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoBottomNavigationPageBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoBottomNavigationPageBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoBottomNavigationPageBuilderModel(
          args,
          tabs: map['tabs'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'tabs': tabs,
      ...args,
    });
  }
}

class NeoBottomNavigationPageSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_bottom_navigation_page.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoBottomNavigationPage',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'tabs': SchemaHelper.anySchema,
    },
  };
}
