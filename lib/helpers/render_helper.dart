import 'package:admin/helpers/dialog_helper.dart';
import 'package:admin/ui/widgets/render/register_widgets/title_description_render_widget.dart';
import 'package:get/get.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/widgets/render/render_widget.dart';

appRenderInit() {
  jsonWidgetRegistry.registerCustomBuilder(
    TitleDescriptionRenderWidget().type,
    JsonWidgetBuilderContainer(builder: TitleDescriptionRenderWidget.fromDynamic),
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
