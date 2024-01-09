// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_last_transactions_widget_builder.dart';

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

class HomeLastTransactionsWidgetBuilder
    extends _HomeLastTransactionsWidgetBuilder {
  const HomeLastTransactionsWidgetBuilder({required super.args});

  static const kType = 'home_last_transactions_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static HomeLastTransactionsWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      HomeLastTransactionsWidgetBuilder(
        args: map,
      );

  @override
  HomeLastTransactionsWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = HomeLastTransactionsWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  HomeLastTransactionsWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return HomeLastTransactionsWidget(
      key: key,
      newTransactionText: model.newTransactionText,
      title: model.title,
      userList: model.userList,
    );
  }
}

class JsonHomeLastTransactionsWidget extends JsonWidgetData {
  JsonHomeLastTransactionsWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.newTransactionText,
    required this.title,
    required this.userList,
  }) : super(
          jsonWidgetArgs: HomeLastTransactionsWidgetBuilderModel.fromDynamic(
            {
              'newTransactionText': newTransactionText,
              'title': title,
              'userList': userList,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => HomeLastTransactionsWidgetBuilder(
            args: HomeLastTransactionsWidgetBuilderModel.fromDynamic(
              {
                'newTransactionText': newTransactionText,
                'title': title,
                'userList': userList,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: HomeLastTransactionsWidgetBuilder.kType,
        );

  final String newTransactionText;

  final String title;

  final List<dynamic> userList;
}

class HomeLastTransactionsWidgetBuilderModel extends JsonWidgetBuilderModel {
  const HomeLastTransactionsWidgetBuilderModel(
    super.args, {
    required this.newTransactionText,
    required this.title,
    required this.userList,
  });

  final String newTransactionText;

  final String title;

  final List<dynamic> userList;

  static HomeLastTransactionsWidgetBuilderModel fromDynamic(
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
        '[HomeLastTransactionsWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static HomeLastTransactionsWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    HomeLastTransactionsWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is HomeLastTransactionsWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = HomeLastTransactionsWidgetBuilderModel(
          args,
          newTransactionText: map['newTransactionText'],
          title: map['title'],
          userList: map['userList'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'newTransactionText': newTransactionText,
      'title': title,
      'userList': userList,
      ...args,
    });
  }
}

class HomeLastTransactionsWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/home_last_transactions_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'HomeLastTransactionsWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'newTransactionText': SchemaHelper.stringSchema,
      'title': SchemaHelper.stringSchema,
      'userList': SchemaHelper.anySchema,
    },
  };
}
