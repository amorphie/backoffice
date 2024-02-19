// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'used_technologies_html_widget_builder.dart';

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

class UsedTechnologiesHtmlWidgetBuilder
    extends _UsedTechnologiesHtmlWidgetBuilder {
  const UsedTechnologiesHtmlWidgetBuilder({required super.args});

  static const kType = 'used_technologies_html_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static UsedTechnologiesHtmlWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      UsedTechnologiesHtmlWidgetBuilder(
        args: map,
      );

  @override
  UsedTechnologiesHtmlWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = UsedTechnologiesHtmlWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  UsedTechnologiesHtmlWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return UsedTechnologiesHtmlWidget(
      key: key,
    );
  }
}

class JsonUsedTechnologiesHtmlWidget extends JsonWidgetData {
  JsonUsedTechnologiesHtmlWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) : super(
          jsonWidgetArgs: UsedTechnologiesHtmlWidgetBuilderModel.fromDynamic(
            {
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => UsedTechnologiesHtmlWidgetBuilder(
            args: UsedTechnologiesHtmlWidgetBuilderModel.fromDynamic(
              {
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: UsedTechnologiesHtmlWidgetBuilder.kType,
        );
}

class UsedTechnologiesHtmlWidgetBuilderModel extends JsonWidgetBuilderModel {
  const UsedTechnologiesHtmlWidgetBuilderModel(super.args);

  static UsedTechnologiesHtmlWidgetBuilderModel fromDynamic(
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
        '[UsedTechnologiesHtmlWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static UsedTechnologiesHtmlWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    UsedTechnologiesHtmlWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is UsedTechnologiesHtmlWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = UsedTechnologiesHtmlWidgetBuilderModel(
          args,
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      ...args,
    });
  }
}

class UsedTechnologiesHtmlWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/used_technologies_html_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'UsedTechnologiesHtmlWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {},
  };
}
