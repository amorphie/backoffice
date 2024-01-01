// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_scaffold_builder.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: deprecated_member_use

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class NeoScaffoldBuilder extends _NeoScaffoldBuilder {
  const NeoScaffoldBuilder({required super.args});

  static const kType = 'neo_scaffold';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static NeoScaffoldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      NeoScaffoldBuilder(
        args: map,
      );
  @override
  NeoScaffoldBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = NeoScaffoldBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  NeoScaffold buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return NeoScaffold(
      appBar: model.appBar?.build(
        childBuilder: childBuilder,
        context: context,
      ) as PreferredSizeWidget?,
      backgroundColor: model.backgroundColor,
      body: model.body?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      bottomNavigationBar: model.bottomNavigationBar?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      bottomSheet: model.bottomSheet?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      drawer: model.drawer?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      drawerDragStartBehavior: model.drawerDragStartBehavior,
      drawerEdgeDragWidth: model.drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: model.drawerEnableOpenDragGesture,
      drawerScrimColor: model.drawerScrimColor,
      endDrawer: model.endDrawer?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      endDrawerEnableOpenDragGesture: model.endDrawerEnableOpenDragGesture,
      extendBody: model.extendBody,
      extendBodyBehindAppBar: model.extendBodyBehindAppBar,
      floatingActionButton: model.floatingActionButton?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      floatingActionButtonAnimator: model.floatingActionButtonAnimator,
      floatingActionButtonLocation: model.floatingActionButtonLocation,
      key: key,
      onDrawerChanged: model.onDrawerChanged,
      onEndDrawerChanged: model.onEndDrawerChanged,
      padding: model.padding,
      persistentFooterAlignment: model.persistentFooterAlignment,
      persistentFooterButtons: model.persistentFooterButtons == null
          ? null
          : [
              for (var d in model.persistentFooterButtons!)
                d.build(
                  childBuilder: childBuilder,
                  context: context,
                ),
            ],
      primary: model.primary,
      resizeToAvoidBottomInset: model.resizeToAvoidBottomInset,
      restorationId: model.restorationId,
      useSafeArea: model.useSafeArea,
    );
  }
}

class JsonNeoScaffold extends JsonWidgetData {
  JsonNeoScaffold({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.appBar,
    this.backgroundColor,
    this.body,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.drawerScrimColor,
    this.endDrawer,
    this.endDrawerEnableOpenDragGesture = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.padding = EdgeInsetsDirectional.zero,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.persistentFooterButtons,
    this.primary = true,
    this.resizeToAvoidBottomInset,
    this.restorationId,
    this.useSafeArea = false,
  }) : super(
          jsonWidgetArgs: NeoScaffoldBuilderModel.fromDynamic(
            {
              'appBar': appBar,
              'backgroundColor': backgroundColor,
              'body': body,
              'bottomNavigationBar': bottomNavigationBar,
              'bottomSheet': bottomSheet,
              'drawer': drawer,
              'drawerDragStartBehavior': drawerDragStartBehavior,
              'drawerEdgeDragWidth': drawerEdgeDragWidth,
              'drawerEnableOpenDragGesture': drawerEnableOpenDragGesture,
              'drawerScrimColor': drawerScrimColor,
              'endDrawer': endDrawer,
              'endDrawerEnableOpenDragGesture': endDrawerEnableOpenDragGesture,
              'extendBody': extendBody,
              'extendBodyBehindAppBar': extendBodyBehindAppBar,
              'floatingActionButton': floatingActionButton,
              'floatingActionButtonAnimator': floatingActionButtonAnimator,
              'floatingActionButtonLocation': floatingActionButtonLocation,
              'onDrawerChanged': onDrawerChanged,
              'onEndDrawerChanged': onEndDrawerChanged,
              'padding': padding,
              'persistentFooterAlignment': persistentFooterAlignment,
              'persistentFooterButtons': persistentFooterButtons,
              'primary': primary,
              'resizeToAvoidBottomInset': resizeToAvoidBottomInset,
              'restorationId': restorationId,
              'useSafeArea': useSafeArea,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => NeoScaffoldBuilder(
            args: NeoScaffoldBuilderModel.fromDynamic(
              {
                'appBar': appBar,
                'backgroundColor': backgroundColor,
                'body': body,
                'bottomNavigationBar': bottomNavigationBar,
                'bottomSheet': bottomSheet,
                'drawer': drawer,
                'drawerDragStartBehavior': drawerDragStartBehavior,
                'drawerEdgeDragWidth': drawerEdgeDragWidth,
                'drawerEnableOpenDragGesture': drawerEnableOpenDragGesture,
                'drawerScrimColor': drawerScrimColor,
                'endDrawer': endDrawer,
                'endDrawerEnableOpenDragGesture':
                    endDrawerEnableOpenDragGesture,
                'extendBody': extendBody,
                'extendBodyBehindAppBar': extendBodyBehindAppBar,
                'floatingActionButton': floatingActionButton,
                'floatingActionButtonAnimator': floatingActionButtonAnimator,
                'floatingActionButtonLocation': floatingActionButtonLocation,
                'onDrawerChanged': onDrawerChanged,
                'onEndDrawerChanged': onEndDrawerChanged,
                'padding': padding,
                'persistentFooterAlignment': persistentFooterAlignment,
                'persistentFooterButtons': persistentFooterButtons,
                'primary': primary,
                'resizeToAvoidBottomInset': resizeToAvoidBottomInset,
                'restorationId': restorationId,
                'useSafeArea': useSafeArea,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: NeoScaffoldBuilder.kType,
        );

  final JsonWidgetData? appBar;

  final Color? backgroundColor;

  final JsonWidgetData? body;

  final JsonWidgetData? bottomNavigationBar;

  final JsonWidgetData? bottomSheet;

  final JsonWidgetData? drawer;

  final DragStartBehavior drawerDragStartBehavior;

  final double? drawerEdgeDragWidth;

  final bool drawerEnableOpenDragGesture;

  final Color? drawerScrimColor;

  final JsonWidgetData? endDrawer;

  final bool endDrawerEnableOpenDragGesture;

  final bool extendBody;

  final bool extendBodyBehindAppBar;

  final JsonWidgetData? floatingActionButton;

  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final void Function(bool)? onDrawerChanged;

  final void Function(bool)? onEndDrawerChanged;

  final EdgeInsetsDirectional padding;

  final AlignmentDirectional persistentFooterAlignment;

  final List<JsonWidgetData>? persistentFooterButtons;

  final bool primary;

  final bool? resizeToAvoidBottomInset;

  final String? restorationId;

  final bool useSafeArea;
}

class NeoScaffoldBuilderModel extends JsonWidgetBuilderModel {
  const NeoScaffoldBuilderModel(
    super.args, {
    this.appBar,
    this.backgroundColor,
    this.body,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.drawerScrimColor,
    this.endDrawer,
    this.endDrawerEnableOpenDragGesture = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.padding = EdgeInsetsDirectional.zero,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.persistentFooterButtons,
    this.primary = true,
    this.resizeToAvoidBottomInset,
    this.restorationId,
    this.useSafeArea = false,
  });

  final JsonWidgetData? appBar;

  final Color? backgroundColor;

  final JsonWidgetData? body;

  final JsonWidgetData? bottomNavigationBar;

  final JsonWidgetData? bottomSheet;

  final JsonWidgetData? drawer;

  final DragStartBehavior drawerDragStartBehavior;

  final double? drawerEdgeDragWidth;

  final bool drawerEnableOpenDragGesture;

  final Color? drawerScrimColor;

  final JsonWidgetData? endDrawer;

  final bool endDrawerEnableOpenDragGesture;

  final bool extendBody;

  final bool extendBodyBehindAppBar;

  final JsonWidgetData? floatingActionButton;

  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final void Function(bool)? onDrawerChanged;

  final void Function(bool)? onEndDrawerChanged;

  final EdgeInsetsDirectional padding;

  final AlignmentDirectional persistentFooterAlignment;

  final List<JsonWidgetData>? persistentFooterButtons;

  final bool primary;

  final bool? resizeToAvoidBottomInset;

  final String? restorationId;

  final bool useSafeArea;

  static NeoScaffoldBuilderModel fromDynamic(
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
        '[NeoScaffoldBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static NeoScaffoldBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    NeoScaffoldBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is NeoScaffoldBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = NeoScaffoldBuilderModel(
          args,
          appBar: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamic(
              map['appBar'],
              registry: registry,
            );

            return parsed;
          }(),
          backgroundColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['backgroundColor'],
              validate: false,
            );

            return parsed;
          }(),
          body: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamic(
              map['body'],
              registry: registry,
            );

            return parsed;
          }(),
          bottomNavigationBar: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamic(
              map['bottomNavigationBar'],
              registry: registry,
            );

            return parsed;
          }(),
          bottomSheet: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamic(
              map['bottomSheet'],
              registry: registry,
            );

            return parsed;
          }(),
          drawer: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamic(
              map['drawer'],
              registry: registry,
            );

            return parsed;
          }(),
          drawerDragStartBehavior: () {
            dynamic parsed = ThemeDecoder.decodeDragStartBehavior(
              map['drawerDragStartBehavior'],
              validate: false,
            );
            parsed ??= DragStartBehavior.start;

            return parsed;
          }(),
          drawerEdgeDragWidth: () {
            dynamic parsed =
                JsonClass.maybeParseDouble(map['drawerEdgeDragWidth']);

            return parsed;
          }(),
          drawerEnableOpenDragGesture: JsonClass.parseBool(
            map['drawerEnableOpenDragGesture'],
            whenNull: true,
          ),
          drawerScrimColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['drawerScrimColor'],
              validate: false,
            );

            return parsed;
          }(),
          endDrawer: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamic(
              map['endDrawer'],
              registry: registry,
            );

            return parsed;
          }(),
          endDrawerEnableOpenDragGesture: JsonClass.parseBool(
            map['endDrawerEnableOpenDragGesture'],
            whenNull: true,
          ),
          extendBody: JsonClass.parseBool(
            map['extendBody'],
            whenNull: false,
          ),
          extendBodyBehindAppBar: JsonClass.parseBool(
            map['extendBodyBehindAppBar'],
            whenNull: false,
          ),
          floatingActionButton: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamic(
              map['floatingActionButton'],
              registry: registry,
            );

            return parsed;
          }(),
          floatingActionButtonAnimator: () {
            dynamic parsed = ThemeDecoder.decodeFloatingActionButtonAnimator(
              map['floatingActionButtonAnimator'],
              validate: false,
            );

            return parsed;
          }(),
          floatingActionButtonLocation: () {
            dynamic parsed = ThemeDecoder.decodeFloatingActionButtonLocation(
              map['floatingActionButtonLocation'],
              validate: false,
            );

            return parsed;
          }(),
          onDrawerChanged: map['onDrawerChanged'],
          onEndDrawerChanged: map['onEndDrawerChanged'],
          padding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsDirectional(
              map['padding'],
              validate: false,
            );
            parsed ??= EdgeInsetsDirectional.zero;

            return parsed;
          }(),
          persistentFooterAlignment: () {
            dynamic parsed = ThemeDecoder.decodeAlignmentDirectional(
              map['persistentFooterAlignment'],
              validate: false,
            );
            parsed ??= AlignmentDirectional.centerEnd;

            return parsed;
          }(),
          persistentFooterButtons: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamicList(
              map['persistentFooterButtons'],
              registry: registry,
            );

            return parsed;
          }(),
          primary: JsonClass.parseBool(
            map['primary'],
            whenNull: true,
          ),
          resizeToAvoidBottomInset: JsonClass.maybeParseBool(
            map['resizeToAvoidBottomInset'],
          ),
          restorationId: map['restorationId'],
          useSafeArea: JsonClass.parseBool(
            map['useSafeArea'],
            whenNull: false,
          ),
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'appBar': appBar?.toJson(),
      'backgroundColor': ThemeEncoder.encodeColor(
        backgroundColor,
      ),
      'body': body?.toJson(),
      'bottomNavigationBar': bottomNavigationBar?.toJson(),
      'bottomSheet': bottomSheet?.toJson(),
      'drawer': drawer?.toJson(),
      'drawerDragStartBehavior':
          DragStartBehavior.start == drawerDragStartBehavior
              ? null
              : ThemeEncoder.encodeDragStartBehavior(
                  drawerDragStartBehavior,
                ),
      'drawerEdgeDragWidth': drawerEdgeDragWidth,
      'drawerEnableOpenDragGesture': true == drawerEnableOpenDragGesture
          ? null
          : drawerEnableOpenDragGesture,
      'drawerScrimColor': ThemeEncoder.encodeColor(
        drawerScrimColor,
      ),
      'endDrawer': endDrawer?.toJson(),
      'endDrawerEnableOpenDragGesture': true == endDrawerEnableOpenDragGesture
          ? null
          : endDrawerEnableOpenDragGesture,
      'extendBody': false == extendBody ? null : extendBody,
      'extendBodyBehindAppBar':
          false == extendBodyBehindAppBar ? null : extendBodyBehindAppBar,
      'floatingActionButton': floatingActionButton?.toJson(),
      'floatingActionButtonAnimator':
          ThemeEncoder.encodeFloatingActionButtonAnimator(
        floatingActionButtonAnimator,
      ),
      'floatingActionButtonLocation':
          ThemeEncoder.encodeFloatingActionButtonLocation(
        floatingActionButtonLocation,
      ),
      'onDrawerChanged': onDrawerChanged,
      'onEndDrawerChanged': onEndDrawerChanged,
      'padding': EdgeInsetsDirectional.zero == padding
          ? null
          : ThemeEncoder.encodeEdgeInsetsDirectional(
              padding,
            ),
      'persistentFooterAlignment':
          AlignmentDirectional.centerEnd == persistentFooterAlignment
              ? null
              : ThemeEncoder.encodeAlignmentDirectional(
                  persistentFooterAlignment,
                ),
      'persistentFooterButtons':
          JsonClass.maybeToJsonList(persistentFooterButtons),
      'primary': true == primary ? null : primary,
      'resizeToAvoidBottomInset': resizeToAvoidBottomInset,
      'restorationId': restorationId,
      'useSafeArea': false == useSafeArea ? null : useSafeArea,
      ...args,
    });
  }
}

class NeoScaffoldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/neo_bank/neo_scaffold.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'NeoScaffold',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'appBar': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'body': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'bottomNavigationBar': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'bottomSheet': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'drawer': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'drawerDragStartBehavior':
          SchemaHelper.objectSchema(DragStartBehaviorSchema.id),
      'drawerEdgeDragWidth': SchemaHelper.numberSchema,
      'drawerEnableOpenDragGesture': SchemaHelper.boolSchema,
      'drawerScrimColor': SchemaHelper.objectSchema(ColorSchema.id),
      'endDrawer': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'endDrawerEnableOpenDragGesture': SchemaHelper.boolSchema,
      'extendBody': SchemaHelper.boolSchema,
      'extendBodyBehindAppBar': SchemaHelper.boolSchema,
      'floatingActionButton':
          SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'floatingActionButtonAnimator':
          SchemaHelper.objectSchema(FloatingActionButtonAnimatorSchema.id),
      'floatingActionButtonLocation':
          SchemaHelper.objectSchema(FloatingActionButtonLocationSchema.id),
      'onDrawerChanged': SchemaHelper.anySchema,
      'onEndDrawerChanged': SchemaHelper.anySchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsDirectionalSchema.id),
      'persistentFooterAlignment':
          SchemaHelper.objectSchema(AlignmentDirectionalSchema.id),
      'persistentFooterButtons':
          SchemaHelper.arraySchema(JsonWidgetDataSchema.id),
      'primary': SchemaHelper.boolSchema,
      'resizeToAvoidBottomInset': SchemaHelper.boolSchema,
      'restorationId': SchemaHelper.stringSchema,
      'useSafeArea': SchemaHelper.boolSchema,
    },
  };
}
