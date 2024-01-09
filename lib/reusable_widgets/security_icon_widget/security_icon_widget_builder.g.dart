// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_icon_widget_builder.dart';

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

class SecurityIconWidgetBuilder extends _SecurityIconWidgetBuilder {
  const SecurityIconWidgetBuilder({required super.args});

  static const kType = 'security_icon_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static SecurityIconWidgetBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      SecurityIconWidgetBuilder(
        args: map,
      );

  @override
  SecurityIconWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = SecurityIconWidgetBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  SecurityIconWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return SecurityIconWidget(
      key: key,
      securityImagePath: model.securityImagePath,
      text: model.text,
    );
  }
}

class JsonSecurityIconWidget extends JsonWidgetData {
  JsonSecurityIconWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.securityImagePath = "assets/images/ic_security.png",
    this.text = "SECURITY",
  }) : super(
          jsonWidgetArgs: SecurityIconWidgetBuilderModel.fromDynamic(
            {
              'securityImagePath': securityImagePath,
              'text': text,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => SecurityIconWidgetBuilder(
            args: SecurityIconWidgetBuilderModel.fromDynamic(
              {
                'securityImagePath': securityImagePath,
                'text': text,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: SecurityIconWidgetBuilder.kType,
        );

  final String securityImagePath;

  final String text;
}

class SecurityIconWidgetBuilderModel extends JsonWidgetBuilderModel {
  const SecurityIconWidgetBuilderModel(
    super.args, {
    this.securityImagePath = "assets/images/ic_security.png",
    this.text = "SECURITY",
  });

  final String securityImagePath;

  final String text;

  static SecurityIconWidgetBuilderModel fromDynamic(
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
        '[SecurityIconWidgetBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static SecurityIconWidgetBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    SecurityIconWidgetBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is SecurityIconWidgetBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = SecurityIconWidgetBuilderModel(
          args,
          securityImagePath:
              map['securityImagePath'] ?? "assets/images/ic_security.png",
          text: map['text'] ?? "SECURITY",
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'securityImagePath': "assets/images/ic_security.png" == securityImagePath
          ? null
          : securityImagePath,
      'text': "SECURITY" == text ? null : text,
      ...args,
    });
  }
}

class SecurityIconWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/security_icon_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'SecurityIconWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'securityImagePath': SchemaHelper.stringSchema,
      'text': SchemaHelper.stringSchema,
    },
  };
}
