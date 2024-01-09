import 'package:backoffice/reusable_widgets/neo_bullet_list_view/neo_bullet_list_view.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:widgetbook/widgetbook.dart';

// STOPSHIP: Delete this ignore
// ignore_for_file: deprecated_member_use_from_same_package
WidgetbookComponent get widgetbookNeoBulletListView => WidgetbookComponent(
      name: 'BrgBulletListView',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => const NeoBulletListView(
            bulletList: [
              "Şifreniz 6 karakter olmalıdır.",
              "Şifreniz numaralardan oluşmalıdır.",
              "Şifreniz ardışık ve tekrar rakamlardan oluşmamalıdır.",
            ],
          ).paddingAll(16),
        ),
      ],
    );
