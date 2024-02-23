// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debit_card_limit_information_widget_builder.dart';

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

class DebitCardLimitInformationWidgetBuilder
    extends _DebitCardLimitInformationWidgetBuilder {
  const DebitCardLimitInformationWidgetBuilder({required super.args});

  static const kType = 'debit_card_limit_information_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static DebitCardLimitInformationWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      DebitCardLimitInformationWidgetBuilder(
        args: map,
      );

  @override
  DebitCardLimitInformationWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = DebitCardLimitInformationWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  DebitCardLimitInformationWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return DebitCardLimitInformationWidget(
      key: key,
      padding: model.padding,
    );
  }
}

class JsonDebitCardLimitInformationWidget extends JsonWidgetData {
  JsonDebitCardLimitInformationWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(
          jsonWidgetArgs:
              DebitCardLimitInformationWidgetBuilderModel.fromDynamic(
            {
              'padding': padding,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => DebitCardLimitInformationWidgetBuilder(
            args: DebitCardLimitInformationWidgetBuilderModel.fromDynamic(
              {
                'padding': padding,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: DebitCardLimitInformationWidgetBuilder.kType,
        );

  final EdgeInsetsDirectional padding;
}

class DebitCardLimitInformationWidgetBuilderModel
    extends JsonWidgetBuilderModel {
  const DebitCardLimitInformationWidgetBuilderModel(
    super.args, {
    this.padding = EdgeInsetsDirectional.zero,
  });

  final EdgeInsetsDirectional padding;

  static DebitCardLimitInformationWidgetBuilderModel fromDynamic(
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
        '[DebitCardLimitInformationWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static DebitCardLimitInformationWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    DebitCardLimitInformationWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is DebitCardLimitInformationWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = DebitCardLimitInformationWidgetBuilderModel(
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

class DebitCardLimitInformationWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/debit_card_limit_information_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'DebitCardLimitInformationWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
    },
  };
}
