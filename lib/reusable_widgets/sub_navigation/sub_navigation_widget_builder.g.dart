// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_navigation_widget_builder.dart';

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

class SubNavigationWidgetBuilder extends _SubNavigationWidgetBuilder {
  const SubNavigationWidgetBuilder({required super.args});

  static const kType = 'sub_navigation_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static SubNavigationWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      SubNavigationWidgetBuilder(
        args: map,
      );

  @override
  SubNavigationWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = SubNavigationWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  SubNavigationWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final componentDetailsListDecoded = _decodeComponentDetailsList(
      data: data,
    );

    return SubNavigationWidget(
      componentDetailsList: componentDetailsListDecoded,
      key: key,
    );
  }
}

class JsonSubNavigationWidget extends JsonWidgetData {
  JsonSubNavigationWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.componentDetailsList,
  }) : super(
          jsonWidgetArgs: SubNavigationWidgetBuilderModel.fromDynamic(
            {
              'componentDetailsList': componentDetailsList,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => SubNavigationWidgetBuilder(
            args: SubNavigationWidgetBuilderModel.fromDynamic(
              {
                'componentDetailsList': componentDetailsList,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: SubNavigationWidgetBuilder.kType,
        );

  final dynamic componentDetailsList;
}

class SubNavigationWidgetBuilderModel extends JsonWidgetBuilderModel {
  const SubNavigationWidgetBuilderModel(
    super.args, {
    required this.componentDetailsList,
  });

  final dynamic componentDetailsList;

  static SubNavigationWidgetBuilderModel fromDynamic(
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
        '[SubNavigationWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static SubNavigationWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    SubNavigationWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is SubNavigationWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = SubNavigationWidgetBuilderModel(
          args,
          componentDetailsList: map['componentDetailsList'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'componentDetailsList': componentDetailsList,
      ...args,
    });
  }
}

class SubNavigationWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/sub_navigation_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'SubNavigationWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'componentDetailsList': SchemaHelper.anySchema,
    },
  };
}
