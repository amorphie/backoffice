// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_bo_pdf_view.dart';

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

class NeoBoPdfView extends _NeoBoPdfView {
  const NeoBoPdfView({required super.args});

  static const kType = 'neo_bo_pdf_view_widget';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoBoPdfView fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoBoPdfView(
        args: map,
      );

  @override
  NeoBoPdfViewModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoBoPdfViewModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoBoPdfViewWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoBoPdfViewWidget(
      bytes: model.bytes,
      key: key,
    );
  }
}

class JsonNeoBoPdfViewWidget extends JsonWidgetData {
  JsonNeoBoPdfViewWidget({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.bytes,
  }) : super(
          jsonWidgetArgs: NeoBoPdfViewModel.fromDynamic(
            {
              'bytes': bytes,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoBoPdfView(
            args: NeoBoPdfViewModel.fromDynamic(
              {
                'bytes': bytes,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoBoPdfView.kType,
        );

  final Uint8List? bytes;
}

class NeoBoPdfViewModel extends JsonWidgetBuilderModel {
  const NeoBoPdfViewModel(
    super.args, {
    this.bytes,
  });

  final Uint8List? bytes;

  static NeoBoPdfViewModel fromDynamic(
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
        '[NeoBoPdfView]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoBoPdfViewModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoBoPdfViewModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoBoPdfViewModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoBoPdfViewModel(
          args,
          bytes: map['bytes'],
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'bytes': bytes,
      ...args,
    });
  }
}

class NeoBoPdfViewWidgetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/backoffice/neo_bo_pdf_view_widget.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoBoPdfViewWidget',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'bytes': SchemaHelper.anySchema,
    },
  };
}
