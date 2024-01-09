// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_avatar_builder.dart';

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

class NeoAvatarBuilder extends _NeoAvatarBuilder {
  const NeoAvatarBuilder({required super.args});

  static const kType = 'neo_avatar';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoAvatarBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoAvatarBuilder(
        args: map,
      );

  @override
  NeoAvatarBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoAvatarBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoAvatar buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoAvatar(
      imageUrn: model.imageUrn,
      key: key,
      labelText: model.labelText,
      padding: model.padding,
      setImageTransitionId: model.setImageTransitionId,
      showImage: model.showImage,
      subText: model.subText,
    );
  }
}

class JsonNeoAvatar extends JsonWidgetData {
  JsonNeoAvatar({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.imageUrn,
    this.labelText,
    this.padding = EdgeInsetsDirectional.zero,
    this.setImageTransitionId,
    this.showImage = true,
    this.subText,
  }) : super(
          jsonWidgetArgs: NeoAvatarBuilderModel.fromDynamic(
            {
              'imageUrn': imageUrn,
              'labelText': labelText,
              'padding': padding,
              'setImageTransitionId': setImageTransitionId,
              'showImage': showImage,
              'subText': subText,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoAvatarBuilder(
            args: NeoAvatarBuilderModel.fromDynamic(
              {
                'imageUrn': imageUrn,
                'labelText': labelText,
                'padding': padding,
                'setImageTransitionId': setImageTransitionId,
                'showImage': showImage,
                'subText': subText,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoAvatarBuilder.kType,
        );

  final String? imageUrn;

  final String? labelText;

  final EdgeInsetsDirectional padding;

  final String? setImageTransitionId;

  final bool showImage;

  final String? subText;
}

class NeoAvatarBuilderModel extends JsonWidgetBuilderModel {
  const NeoAvatarBuilderModel(
    super.args, {
    this.imageUrn,
    this.labelText,
    this.padding = EdgeInsetsDirectional.zero,
    this.setImageTransitionId,
    this.showImage = true,
    this.subText,
  });

  final String? imageUrn;

  final String? labelText;

  final EdgeInsetsDirectional padding;

  final String? setImageTransitionId;

  final bool showImage;

  final String? subText;

  static NeoAvatarBuilderModel fromDynamic(
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
        '[NeoAvatarBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoAvatarBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoAvatarBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoAvatarBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoAvatarBuilderModel(
          args,
          imageUrn: map['imageUrn'],
          labelText: map['labelText'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          setImageTransitionId: map['setImageTransitionId'],
          showImage: JsonClass.parseBool(
            map['showImage'],
            whenNull: true,
          ),
          subText: map['subText'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'imageUrn': imageUrn,
      'labelText': labelText,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'setImageTransitionId': setImageTransitionId,
      'showImage': true == showImage ? null : showImage,
      'subText': subText,
      ...args,
    });
  }
}

class NeoAvatarSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_avatar.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoAvatar',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'imageUrn': SchemaHelper.stringSchema,
      'labelText': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'setImageTransitionId': SchemaHelper.stringSchema,
      'showImage': SchemaHelper.boolSchema,
      'subText': SchemaHelper.stringSchema,
    },
  };
}
