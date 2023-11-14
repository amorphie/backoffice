// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_template.dart';

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

class NameTemplate extends _NameTemplate {
  const NameTemplate({required super.args});

  static const kType = 'name_template_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NameTemplate fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NameTemplate(
        args: map,
      );

  @override
  NameTemplateModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NameTemplateModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NameTemplateWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NameTemplateWidget(
      description: model.description,
      key: key,
      name: model.name,
    );
  }
}

class JsonNameTemplateWidget extends JsonWidgetData {
  JsonNameTemplateWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.description,
    required this.name,
  }) : super(
          jsonWidgetArgs: NameTemplateModel.fromDynamic(
            {
              'description': description,
              'name': name,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NameTemplate(
            args: NameTemplateModel.fromDynamic(
              {
                'description': description,
                'name': name,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NameTemplate.kType,
        );

  final String? description;

  final String name;
}

class NameTemplateModel extends JsonWidgetBuilderModel {
  const NameTemplateModel(
    super.args, {
    this.description,
    required this.name,
  });

  final String? description;

  final String name;

  static NameTemplateModel fromDynamic(
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
        '[NameTemplate]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NameTemplateModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NameTemplateModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NameTemplateModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NameTemplateModel(
          args,
          description: map['description'],
          name: map['name'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'description': description,
      'name': name,
      ...args,
    });
  }
}

class NameTemplateWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/admin/name_template_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NameTemplateWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'description': SchemaHelper.stringSchema,
      'name': SchemaHelper.stringSchema,
    },
  };
}
