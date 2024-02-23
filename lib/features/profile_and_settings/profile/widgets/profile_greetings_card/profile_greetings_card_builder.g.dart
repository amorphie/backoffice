// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_greetings_card_builder.dart';

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

class ProfileGreetingsCardBuilder extends _ProfileGreetingsCardBuilder {
  const ProfileGreetingsCardBuilder({required super.args});

  static const kType = 'profile_greetings_card';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static ProfileGreetingsCardBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      ProfileGreetingsCardBuilder(
        args: map,
      );

  @override
  ProfileGreetingsCardBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = ProfileGreetingsCardBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  ProfileGreetingsCard buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return ProfileGreetingsCard(
      key: key,
      padding: model.padding,
    );
  }
}

class JsonProfileGreetingsCard extends JsonWidgetData {
  JsonProfileGreetingsCard({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs: ProfileGreetingsCardBuilderModel.fromDynamic(
            {
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => ProfileGreetingsCardBuilder(
            args: ProfileGreetingsCardBuilderModel.fromDynamic(
              {
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: ProfileGreetingsCardBuilder.kType,
        );

  final EdgeInsetsDirectional padding;
}

class ProfileGreetingsCardBuilderModel extends JsonWidgetBuilderModel {
  const ProfileGreetingsCardBuilderModel(
    super.args, {
    this.padding = EdgeInsetsDirectional.zero,
  });

  final EdgeInsetsDirectional padding;

  static ProfileGreetingsCardBuilderModel fromDynamic(
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
        '[ProfileGreetingsCardBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static ProfileGreetingsCardBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    ProfileGreetingsCardBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is ProfileGreetingsCardBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = ProfileGreetingsCardBuilderModel(
          args,
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

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
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      ...args,
    });
  }
}

class ProfileGreetingsCardSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/profile_greetings_card.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'ProfileGreetingsCard',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
