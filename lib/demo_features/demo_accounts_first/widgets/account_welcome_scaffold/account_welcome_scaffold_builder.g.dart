// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_welcome_scaffold_builder.dart';

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

class AccountWelcomeScaffoldBuilder extends _AccountWelcomeScaffoldBuilder {
  const AccountWelcomeScaffoldBuilder({required super.args});

  static const kType = 'account_welcome_scaffold';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static AccountWelcomeScaffoldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      AccountWelcomeScaffoldBuilder(
        args: map,
      );

  @override
  AccountWelcomeScaffoldBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = AccountWelcomeScaffoldBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  AccountWelcomeScaffold buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return AccountWelcomeScaffold(
      key: key,
      child: model.child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}

class JsonAccountWelcomeScaffold extends JsonWidgetData {
  JsonAccountWelcomeScaffold({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.child,
  }) : super(
          jsonWidgetArgs: AccountWelcomeScaffoldBuilderModel.fromDynamic(
            {
              'child': child,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => AccountWelcomeScaffoldBuilder(
            args: AccountWelcomeScaffoldBuilderModel.fromDynamic(
              {
                'child': child,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: AccountWelcomeScaffoldBuilder.kType,
        );

  final JsonWidgetData child;
}

class AccountWelcomeScaffoldBuilderModel extends JsonWidgetBuilderModel {
  const AccountWelcomeScaffoldBuilderModel(
    super.args, {
    required this.child,
  });

  final JsonWidgetData child;

  static AccountWelcomeScaffoldBuilderModel fromDynamic(
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
        '[AccountWelcomeScaffoldBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static AccountWelcomeScaffoldBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    AccountWelcomeScaffoldBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is AccountWelcomeScaffoldBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = AccountWelcomeScaffoldBuilderModel(
          args,
          child: () {
            dynamic parsed = JsonWidgetData.fromDynamic(
              map['child'],
              registry: registry,
            );

            if (parsed == null) {
              throw Exception(
                  'Null value encountered for required parameter: [child].');
            }
            return parsed;
          }(),
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'child': child.toJson(),
      ...args,
    });
  }
}

class AccountWelcomeScaffoldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/account_welcome_scaffold.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'AccountWelcomeScaffold',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'child': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
    },
  };
}
