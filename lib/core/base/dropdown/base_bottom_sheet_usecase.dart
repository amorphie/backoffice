/*
 * neo_bank
 *
 * Created on 25/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/core/base/dropdown/base_dropdown_item_data.dart';

abstract class BaseBottomSheetUseCase<T extends BaseDropdownItemData> {
  const BaseBottomSheetUseCase();

  Future<T?> call(BuildContext context, String? title, List<T> itemList);
}
