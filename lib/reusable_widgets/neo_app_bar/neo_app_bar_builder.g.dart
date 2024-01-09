// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_app_bar_builder.dart';

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

class NeoAppBarBuilder extends _NeoAppBarBuilder {
  const NeoAppBarBuilder({required super.args});

  static const kType = 'neo_app_bar';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoAppBarBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoAppBarBuilder(
        args: map,
      );

  @override
  NeoAppBarBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoAppBarBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoAppBar buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    final actionListDecoded = _decodeActions(
      data: data,
    );

    return NeoAppBar(
      actionList: actionListDecoded,
      backTransitionId: model.backTransitionId,
      key: key,
      leftWidgetType: model.leftWidgetType,
      title: model.title,
    );
  }
}

class JsonNeoAppBar extends JsonWidgetData {
  JsonNeoAppBar({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.actionList,
    this.backTransitionId,
    this.leftWidgetType,
    this.title,
  }) : super(
          jsonWidgetArgs: NeoAppBarBuilderModel.fromDynamic(
            {
              'actionList': actionList,
              'backTransitionId': backTransitionId,
              'leftWidgetType': leftWidgetType,
              'title': title,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoAppBarBuilder(
            args: NeoAppBarBuilderModel.fromDynamic(
              {
                'actionList': actionList,
                'backTransitionId': backTransitionId,
                'leftWidgetType': leftWidgetType,
                'title': title,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoAppBarBuilder.kType,
        );

  final dynamic actionList;

  final String? backTransitionId;

  final NeoAppBarLeftWidgetType? leftWidgetType;

  final String? title;
}

class NeoAppBarBuilderModel extends JsonWidgetBuilderModel {
  const NeoAppBarBuilderModel(
    super.args, {
    required this.actionList,
    this.backTransitionId,
    this.leftWidgetType,
    this.title,
  });

  final dynamic actionList;

  final String? backTransitionId;

  final NeoAppBarLeftWidgetType? leftWidgetType;

  final String? title;

  static NeoAppBarBuilderModel fromDynamic(
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
        '[NeoAppBarBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoAppBarBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoAppBarBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoAppBarBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoAppBarBuilderModel(
          args,
          actionList: map['actionList'],
          backTransitionId: map['backTransitionId'],
          leftWidgetType: map['leftWidgetType'],
          title: map['title'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'actionList': const [] == actionList ? null : actionList,
      'backTransitionId': backTransitionId,
      'leftWidgetType': leftWidgetType,
      'title': title,
      ...args,
    });
  }
}

class NeoAppBarSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_app_bar.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoAppBar',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'actionList': SchemaHelper.anySchema,
      'backTransitionId': SchemaHelper.stringSchema,
      'leftWidgetType': SchemaHelper.anySchema,
      'title': SchemaHelper.stringSchema,
    },
  };
}
