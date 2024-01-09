// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_custom_info_text_builder.dart';

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

class AccountsCustomInfoTextBuilder extends _AccountsCustomInfoTextBuilder {
  const AccountsCustomInfoTextBuilder({required super.args});

  static const kType = 'accounts_custom_info_text';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static AccountsCustomInfoTextBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      AccountsCustomInfoTextBuilder(
        args: map,
      );

  @override
  AccountsCustomInfoTextBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = AccountsCustomInfoTextBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  AccountsCustomInfoText buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return AccountsCustomInfoText(
      key: key,
      subTitle: model.subTitle,
      title: model.title,
    );
  }
}

class JsonAccountsCustomInfoText extends JsonWidgetData {
  JsonAccountsCustomInfoText({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.subTitle,
    required this.title,
  }) : super(
          jsonWidgetArgs: AccountsCustomInfoTextBuilderModel.fromDynamic(
            {
              'subTitle': subTitle,
              'title': title,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => AccountsCustomInfoTextBuilder(
            args: AccountsCustomInfoTextBuilderModel.fromDynamic(
              {
                'subTitle': subTitle,
                'title': title,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: AccountsCustomInfoTextBuilder.kType,
        );

  final String subTitle;

  final String title;
}

class AccountsCustomInfoTextBuilderModel extends JsonWidgetBuilderModel {
  const AccountsCustomInfoTextBuilderModel(
    super.args, {
    required this.subTitle,
    required this.title,
  });

  final String subTitle;

  final String title;

  static AccountsCustomInfoTextBuilderModel fromDynamic(
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
        '[AccountsCustomInfoTextBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static AccountsCustomInfoTextBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    AccountsCustomInfoTextBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is AccountsCustomInfoTextBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = AccountsCustomInfoTextBuilderModel(
          args,
          subTitle: map['subTitle'],
          title: map['title'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'subTitle': subTitle,
      'title': title,
      ...args,
    });
  }
}

class AccountsCustomInfoTextSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/accounts_custom_info_text.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'AccountsCustomInfoText',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'subTitle': SchemaHelper.stringSchema,
      'title': SchemaHelper.stringSchema,
    },
  };
}
