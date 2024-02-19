import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/core/dynamic_widget_system/registerers/custom_arg_processor_registerer.dart';
import 'package:backoffice/core/localization/bloc/localization_bloc.dart';
import 'package:backoffice/core/localization/language.dart';
import 'package:backoffice/features/splash/usecases/init_app_in_splash_usecase.dart';
import 'package:backoffice/widgetbook/addons/neo_localization_addon.dart';
import 'package:backoffice/widgetbook/pages/widgetbook_folder_dynamic_pages.dart';
import 'package:backoffice/widgetbook/register_widgets/widgetbook_set_password_bullet_view.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_login_attempt_list_item_widget.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_accordion.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_address_selection_dropdown.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_animation.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_app_bar.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_avatar.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_badge.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_bottom_navigation_bar.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_bullet_list_view.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_button.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_card_details.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_category_item.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_checkbox.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_checkbox_group_widget.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_countdown_timer.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_debit_card.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_dropdown.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_expandable_information_card.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_icon.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_icon_button.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_image.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_image_selector_widget.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_information_card.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_language_switch.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_popup.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_radio_button_group_widget.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_rounded_image.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_segmented_button.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_stepper.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_success_page.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_swipe_button.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_swipe_card.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_switch.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_tckn_form_field.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_text_form_field.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_neo_theme_selector.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_profile_greetings_card.dart';
import 'package:backoffice/widgetbook/reusable_widgets/widgetbook_terms_and_conditions_widget.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitAppInSplashUseCase().call(GlobalKey());
  CustomArgProcessorRegisterer().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WorkflowFormBloc()),
        BlocProvider(create: (context) => LocalizationBloc()..add(LocalizationEventInit())),
      ],
      child: WidgetbookApp(pageResponseAndNamePairs: await _getPages()),
    ),
  );
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  final Map<String, List<List<String>>> pageResponseAndNamePairs;

  const WidgetbookApp({required this.pageResponseAndNamePairs, Key? key}) : super(key: key);

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
                    // TODO: Order enum values alphabetically to prevent possible conflicts!
                    widgetbookAppBar,
                    widgetbookNeoAccordion,
                    widgetbookNeoAddressSelectionDropdown,
                    widgetbookNeoAnimation,
                    widgetbookNeoAvatar,
                    widgetbookNeoBottomNavigationBar,
                    widgetbookNeoBulletListView,
                    widgetbookNeoButton,
                    widgetbookNeoCardDetails,
                    widgetbookNeoCategoryItemWidget,
                    widgetbookNeoCheckbox,
                    widgetbookNeoCheckboxGroup,
                    widgetbookNeoCountdownTimer,
                    widgetbookNeoDebitCard,
                    widgetbookNeoDropdown,
                    widgetbookNeoExpandableInformationCard,
                    widgetbookNeoIcon,
                    widgetbookNeoIconButton,
                    widgetbookNeoImage,
                    widgetbookNeoImageSelectorWidget,
                    widgetbookNeoInformationCard,
                    widgetbookNeoLanguageSwitch,
                    widgetbookNeoPopup,
                    widgetbookNeoRadioButtonGroupWidget,
                    widgetbookNeoRoundedImage,
                    widgetbookNeoStepper,
                    widgetbookNeoSuccessPage,
                    widgetbookNeoSegmentedButton,
                    widgetbookNeoStepper,
                    widgetbookNeoSwipeButton,
                    widgetbookNeoSwipeCard,
                    widgetbookNeoSwitch,
                    widgetbookNeoTagView,
                    widgetbookNeoTcknFormField,
                    widgetbookNeoTextFormField,
                    widgetbookNeoThemeSelector,
                    widgetbookLoginAttemptListItemWidget,
                    widgetbookProfileGreetingsCard,
                    widgetbookTermsAndConditionsWidget,
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Pages',
              children: [
                widgetbookFolderDynamicPages(pageResponseAndNamePairs),
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

Future<List<List<String>>> _getPagesByFolderName(String folderName) async {
  final paths = (json.decode(await rootBundle.loadString('AssetManifest.json')) as Map<String, dynamic>).keys.where((key) => key.contains('assets/json/pages/$folderName')).toList();
  final content = await Stream.fromIterable(paths).asyncMap(rootBundle.loadString).toList();
  final pages = content.map((e) => json.decode(e)).map<dynamic>((e) => e["page"] ?? e["componentJson"]).map<String>((e) => json.encode(e));
  return IterableZip([pages, paths]).toList();
}

Future<Map<String, List<List<String>>>> _getPages() async {
  // TODO: Order folders alphabetically!
  final folders = [
    "debit_card",
    "login",
    "permissions",
    "profile_and_settings",
    "settings",
  ];
  return {for (final folder in folders) folder: await _getPagesByFolderName(folder)};
}
