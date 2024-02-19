/*
 * neo_bank
 *
 * Created on 5/2/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoIcon => WidgetbookComponent(
      name: 'NeoIcon',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 50),
            children: [
              ...NeoAssets.values.map(
                (e) => GestureDetector(
                  child: NeoIcon(
                    iconUrn: e.urn,
                    color: context.knobs.colorOrNull(label: "Icon Color"),
                  ),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Text(
                        AssetUrn.fromString(e.urn)?.name ?? "",
                        textAlign: TextAlign.center,
                      ).paddingAll(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
