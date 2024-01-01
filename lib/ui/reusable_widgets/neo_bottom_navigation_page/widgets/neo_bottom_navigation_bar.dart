import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/ui/reusable_widgets/neo_bottom_navigation_page/bloc/neo_bottom_navigation_bloc.dart';
import 'package:admin/ui/reusable_widgets/neo_bottom_navigation_page/models/neo_bottom_navigation_model.dart';
import 'package:admin/ui/reusable_widgets/neo_bottom_navigation_page/widgets/bottom_navigation_item.dart';
import 'package:admin/ui/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:admin/core/util/neo_util.dart';

class _Constants {
  static const int middleItemIndex = 2;
}

class NeoBottomNavigationBar extends StatefulWidget {
  final List<NeoBottomNavigationModel> tabs;
  final VoidCallback onMoreOptionsTapped;

  const NeoBottomNavigationBar({required this.tabs, required this.onMoreOptionsTapped, super.key});

  @override
  State<NeoBottomNavigationBar> createState() => _NeoBottomNavigationState();
}

class _NeoBottomNavigationState extends State<NeoBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: NeoColors.bgDarker,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        textBaseline: TextBaseline.alphabetic,
        children: [
          for (int i = 0; i < widget.tabs.length; i++)
            if (i == _Constants.middleItemIndex)
              InkWell(
                onTap: widget.onMoreOptionsTapped,
                child: SizedBox(
                  height: NeoDimens.px48,
                  width: NeoDimens.px48,
                  child: NeoIcon(
                    height: NeoDimens.px48,
                    width: NeoDimens.px48,
                    color: NeoColors.bgPrimaryGreen,
                    iconUrn: NeoAssets.iconLineMenuV2.urn,
                  ).paddingOnly(top: NeoDimens.px12, end: NeoDimens.px12),
                ),
              )
            else
              InkWell(
                onTap: () {
                  context.read<NeoBottomNavigationBloc>().add(NeoBottomNavigationEventChangeTab(i));
                },
                child: SizedBox(
                  height: NeoDimens.px48,
                  width: NeoDimens.px64,
                  child: NeoBottomNavigationItem(
                    iconUrn: widget.tabs[i].iconUrn,
                    labelText: widget.tabs[i].labelText,
                    isSelected: context.read<NeoBottomNavigationBloc>().state.currentIndex == i,
                  ),
                ).paddingOnly(top: NeoDimens.px12, end: NeoDimens.px12),
              ),
        ],
      ).paddingOnly(start: NeoDimens.px16, end: NeoDimens.px4, bottom: NeoDimens.px32),
    );
  }
}
