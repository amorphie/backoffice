import 'package:flutter/cupertino.dart';
import 'package:backoffice/features/register/widgets/set_password_bullet_view/set_password_bullet_view.dart';
import 'package:widgetbook/widgetbook.dart';

// STOPSHIP: Delete this ignore
// ignore_for_file: deprecated_member_use_from_same_package
WidgetbookComponent get widgetbookSetPasswordBulletView => WidgetbookComponent(
      name: 'SetPasswordBulletView',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => SetPasswordBulletView(
            passwordWidgetEventKey: 'test',
            repeatedPasswordWidgetEventKey: 'testRepeated',
            passwordLength: context.knobs.int.input(label: 'passwordLength'),
            padding: EdgeInsetsDirectional.only(
              top: context.knobs.double.input(label: 'topPadding'),
              bottom: context.knobs.double.input(label: 'bottomPadding'),
              start: context.knobs.double.input(label: 'startPadding'),
              end: context.knobs.double.input(label: 'endPadding'),
            ),
          ),
        ),
      ],
    );
