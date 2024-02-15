import 'package:flutter/cupertino.dart';
import 'package:backoffice/reusable_widgets/login_attempt_list_item_widget/login_attempt_list_item_widget.dart';
import 'package:backoffice/util/constants/neo_constants.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookLoginAttemptListItemWidget => WidgetbookComponent(
      name: 'LoginAttemptListItemWidget',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => LoginAttemptListItemWidget(
            attemptDate: DateTime.now(),
            channel: "İnternet Bankacılığı",
            isSuccessful: true,
            padding: const EdgeInsetsDirectional.all(NeoDimens.px20),
          ),
        ),
      ],
    );
