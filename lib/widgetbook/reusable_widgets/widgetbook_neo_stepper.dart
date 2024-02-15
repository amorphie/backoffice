import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_stepper/model/neo_stepper_item_model.dart';
import 'package:backoffice/reusable_widgets/neo_stepper/neo_stepper.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoStepper => WidgetbookComponent(
      name: 'NeoStepper',
      useCases: [
        WidgetbookUseCase(
          name: 'Horizontal Step 1',
          builder: (context) => NeoStepper(
            padding: const EdgeInsetsDirectional.all(NeoDimens.px12),
            steps: [
              NeoStepperItemModel(isSelected: true, iconUrn: NeoAssets.permission24px.urn),
              NeoStepperItemModel(isSelected: false, iconUrn: NeoAssets.check16px.urn),
              NeoStepperItemModel(isSelected: false, iconUrn: NeoAssets.check16px.urn),
            ],
          ),
        ),
        WidgetbookUseCase(
          name: 'Horizontal Step 2',
          builder: (context) => NeoStepper(
            steps: [
              NeoStepperItemModel(isSelected: false, iconUrn: NeoAssets.check16px.urn),
              NeoStepperItemModel(isSelected: true, iconUrn: NeoAssets.permission24px.urn),
              NeoStepperItemModel(isSelected: false, iconUrn: NeoAssets.check16px.urn),
            ],
          ),
        ),
        WidgetbookUseCase(
          name: 'Horizontal Step 3',
          builder: (context) => NeoStepper(
            steps: [
              NeoStepperItemModel(isSelected: false, iconUrn: NeoAssets.check16px.urn),
              NeoStepperItemModel(isSelected: false, iconUrn: NeoAssets.check16px.urn),
              NeoStepperItemModel(isSelected: true, iconUrn: NeoAssets.permission24px.urn),
            ],
          ),
        ),
        WidgetbookUseCase(
          name: 'Vertical Step 1',
          builder: (context) => NeoStepper(
            verticalMaxHeight: 350,
            steps: [
              NeoStepperItemModel(
                isSelected: false,
                iconUrn: NeoAssets.permission24px.urn,
                title: 'Basım Aşamasında',
                description: 'Başvurunuz alındı, teslimat için hazırlanıyor.',
                datetime: '20 Kasım 2023',
              ),
              NeoStepperItemModel(
                isSelected: true,
                iconUrn: NeoAssets.permission24px.urn,
                title: 'Yola Çıktı',
                description: 'Kartınızın size ulaşması için dağıtıma çıkmıştır.',
                datetime: '23 Kasım 2023',
              ),
              NeoStepperItemModel(
                isSelected: false,
                iconUrn: NeoAssets.permission24px.urn,
                title: 'Teslim Edildi',
                description: 'Kartınız Zeynep Yılmaz tarafından teslim alınmıştır.',
              ),
            ],
            axis: Axis.vertical,
          ),
        ),
        WidgetbookUseCase(
          name: 'Vertical Step 2',
          builder: (context) => NeoStepper(
            steps: [
              NeoStepperItemModel(
                isSelected: false,
                iconUrn: NeoAssets.permission24px.urn,
                title: 'Basım Aşamasında',
                description: 'Başvurunuz alındı, teslimat için hazırlanıyor.',
                datetime: '20 Kasım 2023',
              ),
              NeoStepperItemModel(
                isSelected: true,
                iconUrn: NeoAssets.permission24px.urn,
                title: 'Yola Çıktı',
                description: 'Kartınızın size ulaşması için dağıtıma çıkmıştır.',
                datetime: '23 Kasım 2023',
              ),
              NeoStepperItemModel(
                isSelected: false,
                iconUrn: NeoAssets.permission24px.urn,
                title: 'Teslim Edildi',
                description: 'Kartınız Zeynep Yılmaz tarafından teslim alınmıştır.',
              ),
            ],
            axis: Axis.vertical,
          ),
        ),
      ],
    );
