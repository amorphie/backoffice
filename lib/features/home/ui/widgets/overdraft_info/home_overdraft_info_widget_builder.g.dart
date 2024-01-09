// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_overdraft_info_widget_builder.dart';

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

class HomeOverdraftInfoWidgetBuilder extends _HomeOverdraftInfoWidgetBuilder {
  const HomeOverdraftInfoWidgetBuilder({required super.args});

  static const kType = 'home_overdraft_info_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static HomeOverdraftInfoWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      HomeOverdraftInfoWidgetBuilder(
        args: map,
      );

  @override
  HomeOverdraftInfoWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = HomeOverdraftInfoWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  HomeOverdraftInfoWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return HomeOverdraftInfoWidget(
      closeAccountButtonText: model.closeAccountButtonText,
      key: key,
      title: model.title,
      updateLimitButtonText: model.updateLimitButtonText,
    );
  }
}

class JsonHomeOverdraftInfoWidget extends JsonWidgetData {
  JsonHomeOverdraftInfoWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.closeAccountButtonText,
    required this.title,
    required this.updateLimitButtonText,
  }) : super(
          jsonWidgetArgs: HomeOverdraftInfoWidgetBuilderModel.fromDynamic(
            {
              'closeAccountButtonText': closeAccountButtonText,
              'title': title,
              'updateLimitButtonText': updateLimitButtonText,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => HomeOverdraftInfoWidgetBuilder(
            args: HomeOverdraftInfoWidgetBuilderModel.fromDynamic(
              {
                'closeAccountButtonText': closeAccountButtonText,
                'title': title,
                'updateLimitButtonText': updateLimitButtonText,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: HomeOverdraftInfoWidgetBuilder.kType,
        );

  final String closeAccountButtonText;

  final String title;

  final String updateLimitButtonText;
}

class HomeOverdraftInfoWidgetBuilderModel extends JsonWidgetBuilderModel {
  const HomeOverdraftInfoWidgetBuilderModel(
    super.args, {
    required this.closeAccountButtonText,
    required this.title,
    required this.updateLimitButtonText,
  });

  final String closeAccountButtonText;

  final String title;

  final String updateLimitButtonText;

  static HomeOverdraftInfoWidgetBuilderModel fromDynamic(
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
        '[HomeOverdraftInfoWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static HomeOverdraftInfoWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    HomeOverdraftInfoWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is HomeOverdraftInfoWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = HomeOverdraftInfoWidgetBuilderModel(
          args,
          closeAccountButtonText: map['closeAccountButtonText'],
          title: map['title'],
          updateLimitButtonText: map['updateLimitButtonText'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'closeAccountButtonText': closeAccountButtonText,
      'title': title,
      'updateLimitButtonText': updateLimitButtonText,
      ...args,
    });
  }
}

class HomeOverdraftInfoWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/home_overdraft_info_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'HomeOverdraftInfoWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'closeAccountButtonText': SchemaHelper.stringSchema,
      'title': SchemaHelper.stringSchema,
      'updateLimitButtonText': SchemaHelper.stringSchema,
    },
  };
}
