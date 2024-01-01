import 'package:admin/core/util/neo_util.dart';

enum NeoAssets {
  icKeyboardNumeric('urn:local:images:ic_keyboard_numeric:svg'),
  icSecurity('urn:local:images:ic_security:png'),
  loginLock('urn:local:images:login_lock:png'),
  chevronRight('urn:local:icons:chevronRight:svg'),
  helpCircle('urn:local:icons:helpCircle:svg'),
  plusCircle('urn:local:icons:plusCircle:svg'),
  checkmark('urn:local:icons:checkmark:svg'),
  chevronDown('urn:local:icons:chevronDown:svg'),
  profileWidgetPlaceholder('urn:local:icons:user:svg'),
  edit02('urn:local:icons:edit02:svg'),
  duotoneHome('urn:local:icons:duotoneHome:svg'),
  duotoneCreditCard('urn:local:icons:duotoneCreditCard:svg'),
  iconLineMenuV2('urn:local:icons:iconLineMenuV2:svg'),
  duotoneTransfer('urn:local:icons:duotoneTransfer:svg'),
  duotoneAccount('urn:local:icons:duotoneAccount:svg'),
  onAppBarIcon('urn:local:icons:onAppBarLogo:svg'),
  arrowLeft01('urn:local:icons:arrowLeft01:svg'),
  xClose('urn:local:icons:xClose:svg'),
  welcomeBackground('urn:local:animations:welcomeBackground:json'),
  languageSwitchSquareTr('urn:local:icons:languageSwitchSquareTr:svg'),
  languageSwitchSquareEn('urn:local:icons:languageSwitchSquareEn:svg'),
  arrowRightDouble('urn:local:icons:arrowRightDouble:svg'),
  popupIconError('urn:local:icons:popupIconError:svg'),
  popupIconInfo('urn:local:icons:popupIconInfo:svg'),
  popupIconSuccess('urn:local:icons:popupIconSuccess:svg'),
  popupIconWarning('urn:local:icons:popupIconWarning:svg'),
  takePicture('urn:local:icons:takePicture:svg'),
  selectFromGallery('urn:local:icons:selectFromGallery:svg'),
  trash('urn:local:icons:trash:svg'),
  notificationSquare('urn:local:icons:notificationSquare:svg'),
  clock('urn:local:icons:clock:svg'),
  eye('urn:local:icons:eye:svg'),
  eyeSlash('urn:local:icons:eyeSlash:svg'),
  gridBackground('urn:local:images:gridBackground:svg'),
  check('urn:local:icons:check:svg');

  final String urn;

  const NeoAssets(this.urn);

  String get path => AssetUrn.fromString(urn)?.path ?? "";
}
