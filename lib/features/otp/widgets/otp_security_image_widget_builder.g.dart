// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_security_image_widget_builder.dart';

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

class OtpSecurityImageWidgetBuilder extends _OtpSecurityImageWidgetBuilder {
  const OtpSecurityImageWidgetBuilder({required super.args});

  static const kType = 'otp_security_image_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static OtpSecurityImageWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      OtpSecurityImageWidgetBuilder(
        args: map,
      );

  @override
  OtpSecurityImageWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = OtpSecurityImageWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  OtpSecurityImageWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return OtpSecurityImageWidget(
      key: key,
      phoneNumber: model.phoneNumber,
    );
  }
}

class JsonOtpSecurityImageWidget extends JsonWidgetData {
  JsonOtpSecurityImageWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.phoneNumber,
  }) : super(
          jsonWidgetArgs: OtpSecurityImageWidgetBuilderModel.fromDynamic(
            {
              'phoneNumber': phoneNumber,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => OtpSecurityImageWidgetBuilder(
            args: OtpSecurityImageWidgetBuilderModel.fromDynamic(
              {
                'phoneNumber': phoneNumber,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: OtpSecurityImageWidgetBuilder.kType,
        );

  final String phoneNumber;
}

class OtpSecurityImageWidgetBuilderModel extends JsonWidgetBuilderModel {
  const OtpSecurityImageWidgetBuilderModel(
    super.args, {
    required this.phoneNumber,
  });

  final String phoneNumber;

  static OtpSecurityImageWidgetBuilderModel fromDynamic(
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
        '[OtpSecurityImageWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static OtpSecurityImageWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    OtpSecurityImageWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is OtpSecurityImageWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = OtpSecurityImageWidgetBuilderModel(
          args,
          phoneNumber: map['phoneNumber'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'phoneNumber': phoneNumber,
      ...args,
    });
  }
}

class OtpSecurityImageWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/otp_security_image_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'OtpSecurityImageWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'phoneNumber': SchemaHelper.stringSchema,
    },
  };
}
