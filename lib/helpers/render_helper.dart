import 'package:admin/helpers/exporter.dart';

appRenderInit() {
  jsonWidgetRegistry
    ..registerCustomBuilder(
      TitleDescriptionArea.kType,
      JsonWidgetBuilderContainer(builder: TitleDescriptionArea.fromDynamic),
    )
    ..registerCustomBuilder(
      NameTemplate.kType,
      JsonWidgetBuilderContainer(
        builder: NameTemplate.fromDynamic,
      ),
    )
    ..registerCustomBuilder(
      ExpandedRowArea.kType,
      JsonWidgetBuilderContainer(
        builder: ExpandedRowArea.fromDynamic,
      ),
    )
    ..registerCustomBuilder(
      DetailTitle.kType,
      JsonWidgetBuilderContainer(
        builder: DetailTitle.fromDynamic,
      ),
    );
  jsonWidgetRegistry.registerFunctions({
    "copy": ({args, required registry}) => () async {
          if (args != null && args.length > 0) {
            await Clipboard.setData(ClipboardData(text: args.first.toString()));
            Get.snackbar("Info", "Data copied to clipboard");
          }
        },
    "url": ({args, required registry}) => () async {
          if (args != null && args.length > 0) {
            if (!await launchUrl(
              Uri.parse(args.first.toString()),
              mode: LaunchMode.externalApplication,
            )) {
              throw Exception('Could not launch ${args.first.toString()}');
            }
          }
        },
    "tag_view": ({args, required registry}) => () async {
          if (args != null && args.length > 0) {
            showTag(args.first.toString());
          }
        },
    'set_value': ({args, required registry}) => () {
          final replace = registry.getValue(args![1]);
          registry.setValue(args[0], replace);

          print(args);
        },
    'validateForm': ({args, required registry}) => () {
          final BuildContext context = registry.getValue(args![0]);

          final valid = Form.of(context).validate();
          registry.setValue('form_validation', valid);
          jsonWidgetRegistry = registry;
        },
  });
}
