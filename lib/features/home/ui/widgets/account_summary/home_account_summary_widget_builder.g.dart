// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_account_summary_widget_builder.dart';

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

class HomeAccountSummaryWidgetBuilder extends _HomeAccountSummaryWidgetBuilder {
  const HomeAccountSummaryWidgetBuilder({required super.args});

  static const kType = 'home_account_summary_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static HomeAccountSummaryWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      HomeAccountSummaryWidgetBuilder(
        args: map,
      );

  @override
  HomeAccountSummaryWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = HomeAccountSummaryWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  HomeAccountSummaryWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return HomeAccountSummaryWidget(
      iban: model.iban,
      key: key,
    );
  }
}

class JsonHomeAccountSummaryWidget extends JsonWidgetData {
  JsonHomeAccountSummaryWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.iban,
  }) : super(
          jsonWidgetArgs: HomeAccountSummaryWidgetBuilderModel.fromDynamic(
            {
              'iban': iban,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => HomeAccountSummaryWidgetBuilder(
            args: HomeAccountSummaryWidgetBuilderModel.fromDynamic(
              {
                'iban': iban,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: HomeAccountSummaryWidgetBuilder.kType,
        );

  final String iban;
}

class HomeAccountSummaryWidgetBuilderModel extends JsonWidgetBuilderModel {
  const HomeAccountSummaryWidgetBuilderModel(
    super.args, {
    required this.iban,
  });

  final String iban;

  static HomeAccountSummaryWidgetBuilderModel fromDynamic(
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
        '[HomeAccountSummaryWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static HomeAccountSummaryWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    HomeAccountSummaryWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is HomeAccountSummaryWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = HomeAccountSummaryWidgetBuilderModel(
          args,
          iban: map['iban'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'iban': iban,
      ...args,
    });
  }
}

class HomeAccountSummaryWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/home_account_summary_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'HomeAccountSummaryWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'iban': SchemaHelper.stringSchema,
    },
  };
}
