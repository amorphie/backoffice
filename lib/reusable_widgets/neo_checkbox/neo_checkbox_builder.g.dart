// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_checkbox_builder.dart';

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

class NeoCheckboxBuilder extends _NeoCheckboxBuilder {
  const NeoCheckboxBuilder({required super.args});

  static const kType = 'neo_checkbox';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoCheckboxBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoCheckboxBuilder(
        args: map,
      );

  @override
  NeoCheckboxBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoCheckboxBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoCheckbox buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoCheckbox(
      checkboxSpacing: model.checkboxSpacing,
      itemModel: model.itemModel,
      key: key,
      padding: model.padding,
    );
  }
}

class JsonNeoCheckbox extends JsonWidgetData {
  JsonNeoCheckbox({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.checkboxSpacing = NeoDimens.px8,
    required this.itemModel,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs: NeoCheckboxBuilderModel.fromDynamic(
            {
              'checkboxSpacing': checkboxSpacing,
              'itemModel': itemModel,
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoCheckboxBuilder(
            args: NeoCheckboxBuilderModel.fromDynamic(
              {
                'checkboxSpacing': checkboxSpacing,
                'itemModel': itemModel,
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoCheckboxBuilder.kType,
        );

  final double checkboxSpacing;

  final NeoCheckboxItemModel itemModel;

  final EdgeInsetsDirectional padding;
}

class NeoCheckboxBuilderModel extends JsonWidgetBuilderModel {
  const NeoCheckboxBuilderModel(
    super.args, {
    this.checkboxSpacing = NeoDimens.px8,
    required this.itemModel,
    this.padding = EdgeInsetsDirectional.zero,
  });

  final double checkboxSpacing;

  final NeoCheckboxItemModel itemModel;

  final EdgeInsetsDirectional padding;

  static NeoCheckboxBuilderModel fromDynamic(
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
        '[NeoCheckboxBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoCheckboxBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoCheckboxBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoCheckboxBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoCheckboxBuilderModel(
          args,
          checkboxSpacing: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['checkboxSpacing']);

            parsed ??= NeoDimens.px8;

            return parsed;
          }(),
          itemModel: map['itemModel'],
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
      'checkboxSpacing':
          NeoDimens.px8 == checkboxSpacing ? null : checkboxSpacing,
      'itemModel': itemModel,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      ...args,
    });
  }
}

class NeoCheckboxSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_checkbox.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoCheckbox',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'checkboxSpacing': SchemaHelper.numberSchema,
      'itemModel': SchemaHelper.anySchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
