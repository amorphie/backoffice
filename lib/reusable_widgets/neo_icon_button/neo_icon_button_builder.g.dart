// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_icon_button_builder.dart';

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

class NeoIconButtonBuilder extends _NeoIconButtonBuilder {
  const NeoIconButtonBuilder({required super.args});

  static const kType = 'neo_icon_button';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoIconButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoIconButtonBuilder(
        args: map,
      );

  @override
  NeoIconButtonBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoIconButtonBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoIconButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoIconButton(
      color: model.color,
      iconUrn: model.iconUrn,
      key: key,
      padding: model.padding,
      widgetEventKey: model.widgetEventKey,
    );
  }
}

class JsonNeoIconButton extends JsonWidgetData {
  JsonNeoIconButton({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.color,
    required this.iconUrn,
    this.padding = EdgeInsetsDirectional.zero,
    this.widgetEventKey,
  }) : super(
          jsonWidgetArgs: NeoIconButtonBuilderModel.fromDynamic(
            {
              'color': color,
              'iconUrn': iconUrn,
              'padding': padding,
              'widgetEventKey': widgetEventKey,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoIconButtonBuilder(
            args: NeoIconButtonBuilderModel.fromDynamic(
              {
                'color': color,
                'iconUrn': iconUrn,
                'padding': padding,
                'widgetEventKey': widgetEventKey,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoIconButtonBuilder.kType,
        );

  final Color? color;

  final String iconUrn;

  final EdgeInsetsDirectional padding;

  final String? widgetEventKey;
}

class NeoIconButtonBuilderModel extends JsonWidgetBuilderModel {
  const NeoIconButtonBuilderModel(
    super.args, {
    this.color,
    required this.iconUrn,
    this.padding = EdgeInsetsDirectional.zero,
    this.widgetEventKey,
  });

  final Color? color;

  final String iconUrn;

  final EdgeInsetsDirectional padding;

  final String? widgetEventKey;

  static NeoIconButtonBuilderModel fromDynamic(
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
        '[NeoIconButtonBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoIconButtonBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoIconButtonBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoIconButtonBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoIconButtonBuilderModel(
          args,
          color: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['color'],
              validate: false,
            );

            return parsed;
          }(),
          iconUrn: map['iconUrn'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          widgetEventKey: map['widgetEventKey'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'color': ThemeEncoder.encodeColor(
        color,
      ),
      'iconUrn': iconUrn,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'widgetEventKey': widgetEventKey,
      ...args,
    });
  }
}

class NeoIconButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_icon_button.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoIconButton',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'iconUrn': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'widgetEventKey': SchemaHelper.stringSchema,
    },
  };
}
