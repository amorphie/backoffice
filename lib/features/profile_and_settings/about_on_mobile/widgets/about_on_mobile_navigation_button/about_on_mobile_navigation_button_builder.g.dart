// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_on_mobile_navigation_button_builder.dart';

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

class AboutOnMobileNavigationButtonBuilder
    extends _AboutOnMobileNavigationButtonBuilder {
  const AboutOnMobileNavigationButtonBuilder({required super.args});

  static const kType = 'about_on_mobile_navigation_button';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static AboutOnMobileNavigationButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      AboutOnMobileNavigationButtonBuilder(
        args: map,
      );

  @override
  AboutOnMobileNavigationButtonBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = AboutOnMobileNavigationButtonBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  AboutOnMobileNavigationButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return AboutOnMobileNavigationButton(
      key: key,
    );
  }
}

class JsonAboutOnMobileNavigationButton extends JsonWidgetData {
  JsonAboutOnMobileNavigationButton({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) : super(
          jsonWidgetArgs: AboutOnMobileNavigationButtonBuilderModel.fromDynamic(
            {
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => AboutOnMobileNavigationButtonBuilder(
            args: AboutOnMobileNavigationButtonBuilderModel.fromDynamic(
              {
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: AboutOnMobileNavigationButtonBuilder.kType,
        );
}

class AboutOnMobileNavigationButtonBuilderModel extends JsonWidgetBuilderModel {
  const AboutOnMobileNavigationButtonBuilderModel(super.args);

  static AboutOnMobileNavigationButtonBuilderModel fromDynamic(
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
        '[AboutOnMobileNavigationButtonBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static AboutOnMobileNavigationButtonBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    AboutOnMobileNavigationButtonBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is AboutOnMobileNavigationButtonBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = AboutOnMobileNavigationButtonBuilderModel(
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

class AboutOnMobileNavigationButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/about_on_mobile_navigation_button.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'AboutOnMobileNavigationButton',
    'type': 'object',
    'additionalProperties': false,
    'properties': {},
  };
}
