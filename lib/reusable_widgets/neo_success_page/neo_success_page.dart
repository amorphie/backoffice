import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_scaffold/neo_scaffold.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoSuccessPage extends StatelessWidget {
  final Widget image;
  final Widget titleText;
  final List<Widget> descriptionTextList;
  final PreferredSizeWidget? appBar;
  final List<Widget> buttonList;
  final EdgeInsetsDirectional padding;
  final bool useSafeArea;

  const NeoSuccessPage({
    required this.image,
    required this.titleText,
    required this.buttonList,
    this.descriptionTextList = const [],
    this.useSafeArea = true,
    this.appBar,
    this.padding = EdgeInsetsDirectional.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      backgroundColor: NeoColors.bgLight,
      appBar: appBar,
      padding: padding,
      useSafeArea: useSafeArea,
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: NeoColors.baseWhite,
                    borderRadius: BorderRadius.circular(NeoDimens.px20),
                    boxShadow: const [NeoShadows.xl],
                  ),
                  child: Column(
                    children: [
                      image,
                      titleText.paddingOnly(top: NeoDimens.px16),
                      for (final neoText in descriptionTextList) neoText,
                    ],
                  ).paddingAll(NeoDimens.px32),
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              for (final button in buttonList)
                Row(
                  children: [Expanded(child: button)],
                ).paddingOnly(top: NeoDimens.px16),
            ],
          ).paddingOnly(top: NeoDimens.px16),
        ],
      ),
    );
  }
}
