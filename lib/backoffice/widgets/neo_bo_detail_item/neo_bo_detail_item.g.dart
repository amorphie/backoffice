// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_bo_detail_item.dart';

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

class NeoBoDetailItem extends _NeoBoDetailItem {
  const NeoBoDetailItem({required super.args});

  static const kType = 'neo_bo_detail_item_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoBoDetailItem fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoBoDetailItem(
        args: map,
      );

  @override
  NeoBoDetailItemModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoBoDetailItemModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoBoDetailItemWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoBoDetailItemWidget(
      copyValue: model.copyValue,
      key: key,
      text: model.text,
      title: model.title,
    );
  }
}

class JsonNeoBoDetailItemWidget extends JsonWidgetData {
  JsonNeoBoDetailItemWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.copyValue = false,
    this.text = "",
    this.title = "",
  }) : super(
          jsonWidgetArgs: NeoBoDetailItemModel.fromDynamic(
            {
              'copyValue': copyValue,
              'text': text,
              'title': title,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoBoDetailItem(
            args: NeoBoDetailItemModel.fromDynamic(
              {
                'copyValue': copyValue,
                'text': text,
                'title': title,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoBoDetailItem.kType,
        );

  final bool copyValue;

  final String text;

  final String title;
}

class NeoBoDetailItemModel extends JsonWidgetBuilderModel {
  const NeoBoDetailItemModel(
    super.args, {
    this.copyValue = false,
    this.text = "",
    this.title = "",
  });

  final bool copyValue;

  final String text;

  final String title;

  static NeoBoDetailItemModel fromDynamic(
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
        '[NeoBoDetailItem]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoBoDetailItemModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoBoDetailItemModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoBoDetailItemModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoBoDetailItemModel(
          args,
          copyValue: JsonClass.parseBool(
            map['copyValue'],
            whenNull: false,
          ),
          text: map['text'] ?? "",
          title: map['title'] ?? "",
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'copyValue': false == copyValue ? null : copyValue,
      'text': "" == text ? null : text,
      'title': "" == title ? null : title,
      ...args,
    });
  }
}

class NeoBoDetailItemWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_bo_detail_item_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoBoDetailItemWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'copyValue': SchemaHelper.boolSchema,
      'text': SchemaHelper.stringSchema,
      'title': SchemaHelper.stringSchema,
    },
  };
}
