// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_title_widget_builder.dart';

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

class OtpTitleWidgetBuilder extends _OtpTitleWidgetBuilder {
  const OtpTitleWidgetBuilder({required super.args});

  static const kType = 'otp_title_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static OtpTitleWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      OtpTitleWidgetBuilder(
        args: map,
      );

  @override
  OtpTitleWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = OtpTitleWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  OtpTitleWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return OtpTitleWidget(
      key: key,
      title: model.title,
    );
  }
}

class JsonOtpTitleWidget extends JsonWidgetData {
  JsonOtpTitleWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.title,
  }) : super(
          jsonWidgetArgs: OtpTitleWidgetBuilderModel.fromDynamic(
            {
              'title': title,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => OtpTitleWidgetBuilder(
            args: OtpTitleWidgetBuilderModel.fromDynamic(
              {
                'title': title,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: OtpTitleWidgetBuilder.kType,
        );

  final String title;
}

class OtpTitleWidgetBuilderModel extends JsonWidgetBuilderModel {
  const OtpTitleWidgetBuilderModel(
    super.args, {
    required this.title,
  });

  final String title;

  static OtpTitleWidgetBuilderModel fromDynamic(
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
        '[OtpTitleWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static OtpTitleWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    OtpTitleWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is OtpTitleWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = OtpTitleWidgetBuilderModel(
          args,
          title: map['title'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'title': title,
      ...args,
    });
  }
}

class OtpTitleWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/otp_title_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'OtpTitleWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'title': SchemaHelper.stringSchema,
    },
  };
}
