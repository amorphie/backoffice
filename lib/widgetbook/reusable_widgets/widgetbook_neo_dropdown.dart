/*
 * 
 * Neobank.Client
 * 
 * Created on 27/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:backoffice/reusable_widgets/neo_dropdown/adapters/neo_image_picker_dropdown_adapter.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/neo_dropdown.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoDropdown => WidgetbookComponent(
      name: 'NeoDropdown',
      useCases: [
        WidgetbookUseCase(
          name: 'Image Picker',
          builder: (context) => NeoDropdown(
            adapter: NeoImagePickerDropdownAdapter(
              getImageFromCamera: () {},
              getImageFromGallery: () {},
              deleteImageDataVisibility: true,
            ),
          ).paddingAll(NeoDimens.px16),
        ),
      ],
    );
