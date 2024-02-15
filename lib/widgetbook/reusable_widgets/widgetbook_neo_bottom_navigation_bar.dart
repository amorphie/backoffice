/*
 * neo_bank
 *
 * Created on 22/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/bloc/neo_bottom_navigation_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/models/neo_bottom_navigation_model.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/widgets/neo_bottom_navigation_bar.dart';
import 'package:backoffice/util/neo_assets.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoBottomNavigationBar => WidgetbookComponent(
      name: 'NeoBottomNavigationBar',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => BlocProvider(
            create: (context) => NeoBottomNavigationBloc(),
            child: Center(
              child: NeoBottomNavigationBar(
                tabs: [
                  NeoBottomNavigationModel(
                    pageId: "",
                    iconUrn: NeoAssets.home24px.urn,
                    labelText: "Ana Sayfa",
                    backWidgetEventKey: "",
                  ),
                  NeoBottomNavigationModel(
                    pageId: "",
                    iconUrn: NeoAssets.arrowTransfer24px.urn,
                    labelText: "Transfer",
                    backWidgetEventKey: "",
                  ),
                  NeoBottomNavigationModel(
                    pageId: "pageId",
                    iconUrn: "",
                    labelText: "",
                    backWidgetEventKey: "",
                  ),
                  NeoBottomNavigationModel(
                    pageId: "",
                    iconUrn: NeoAssets.account24px.urn,
                    labelText: "Account",
                    backWidgetEventKey: "",
                  ),
                  NeoBottomNavigationModel(
                    pageId: "",
                    iconUrn: NeoAssets.creditCard24px.urn,
                    labelText: "Credit Card",
                    backWidgetEventKey: "",
                  ),
                ],
                onMoreOptionsTapped: () {},
              ),
            ),
          ),
        ),
      ],
    );
