import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/dynamic_widget_system/registerers/custom_arg_processor_registerer.dart';
import 'package:backoffice/core/dynamic_widget_system/registerers/custom_widget_registerer.dart';
import 'package:backoffice/core/localization/bloc/localization_bloc.dart';
import 'package:backoffice/core/localization/language.dart';
import 'package:backoffice/core/navigation/navigation_helper.dart';
import 'package:backoffice/util/app_constants.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:backoffice/widgetbook/addons/neo_localization_addon.dart';
import 'package:backoffice/widgetbook/pages/widgetbook_folder_dynamic_pages.dart';
import 'package:backoffice/widgetbook/register_widgets/widgetbook_set_password_bullet_view.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_animation.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_app_bar.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_avatar.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_bullet_list_view.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_button.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_dropdown_form_field.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_image_selector_widget.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_popup.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_swipe_button.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_tckn_form_field.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_text_form_field.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_time_counter.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_otp_countdown_timer_widget.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_terms_and_conditions_widget.dart';
import 'package:neo_core/core/util/neo_core_app_constants.dart';
import 'package:neo_core/core/widgets/neo_core_app/neo_core_app.dart';
import 'package:neo_core/neo_core.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await _initBurganSDKs();
  CustomWidgetRegisterer().init();
  CustomArgProcessorRegisterer().init();
  runApp(
    BlocProvider(
      create: (context) => LocalizationBloc()..add(LocalizationEventInit()),
      child: NeoCoreApp(
        appConstants: NeoCoreAppConstants(
          workflowHubUrl: AppConstants.workflowHubUrl,
          workflowMethodName: AppConstants.workflowMethodName,
        ),
        neoNavigationHelper: NeoNavigationHelper(),
        child: const WidgetbookApp(),
      ),
    ),
  );
}

Future _initBurganSDKs() async {
  await NeoCore.init();
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      buildWhen: (previousLanguage, newLanguage) => previousLanguage != newLanguage,
      builder: (context, state) {
        return Widgetbook.material(
          directories: [
            WidgetbookFolder(
              name: 'Widgets',
              children: [
                WidgetbookFolder(
                  name: 'Register Widgets',
                  children: [
                    widgetbookSetPasswordBulletView,
                  ],
                ),
                WidgetbookFolder(
                  name: 'Reusable Widgets',
                  children: [
                    widgetbookOtpCountdownTimerWidget,
                    widgetbookNeoBulletListView,
                    widgetbookNeoImageSelectorWidget,
                    widgetbookTermsAndConditionsWidget,
                    widgetbookNeoTextFormField,
                    widgetbookNeoButton,
                    widgetbookNeoSwipeButton,
                    widgetbookNeoDropdownFormField,
                    widgetbookNeoPopup,
                    widgetbookNeoAvatar,
                    widgetbookNeoAnimation,
                    widgetbookAppBar,
                    wigetbookNeoCountdownTimer,
                    widgetbookNeoTcknFormField,
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Pages',
              children: [
                widgetbookFolderDynamicPages,
              ],
            ),
          ],
          addons: [
            MaterialThemeAddon(
              themes: [
                WidgetbookTheme(name: 'Light', data: ThemeData.light()),
                WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
              ],
            ),
            DeviceFrameAddon(
              devices: [...Devices.ios.all, ...Devices.android.all],
            ),
            NeoLocalizationAddon(
              locales: [
                Language.turkish.locale,
                Language.english.locale,
                Language.arabic.locale,
              ],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              initialLocale: Language.english.locale,
              onChanged: (Locale locale) {
                final selectedLanguage = Language.values.firstWhereOrNull(
                  (language) => language.locale.languageCode == locale.languageCode,
                );
                if (selectedLanguage != null) {
                  context.read<LocalizationBloc>().add(LocalizationEventChangeLanguage(selectedLanguage));
                }
              },
            ),
          ],
        );
      },
    );
  }
}
