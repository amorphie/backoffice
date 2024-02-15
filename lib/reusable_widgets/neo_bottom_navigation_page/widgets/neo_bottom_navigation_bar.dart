import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/bloc/neo_bottom_navigation_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/models/neo_bottom_navigation_model.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/widgets/bottom_navigation_item.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/util/neo_util.dart';

class _Constants {
  static const int middleItemIndex = 2;
}

class NeoBottomNavigationBar extends StatelessWidget {
  final List<NeoBottomNavigationModel> tabs;
  final VoidCallback onMoreOptionsTapped;

  const NeoBottomNavigationBar({required this.tabs, required this.onMoreOptionsTapped, super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: NeoColors.bgDarker,
      child: Row(
        children: [
          for (int i = 0; i < tabs.length; i++)
            if (i == _Constants.middleItemIndex) Expanded(child: _buildMiddleItem(context, i)) else Expanded(child: _buildNavigationItem(context, i)),
        ],
      ).paddingOnly(
        start: NeoDimens.px8,
        end: NeoDimens.px8,
        top: NeoDimens.px12,
        bottom: max(NeoDimens.px12, context.mediaQuery.padding.bottom),
      ),
    );
  }

  Widget _buildMiddleItem(BuildContext context, int i) {
    return InkWell(
      onTap: onMoreOptionsTapped,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: NeoColors.bgPrimaryGreen,
        ),
        child: NeoIcon(
          iconUrn: tabs[i].iconUrn,
        ).paddingAll(NeoDimens.px12),
      ),
    );
  }

  Widget _buildNavigationItem(BuildContext context, int i) {
    return InkWell(
      onTap: () => context.read<NeoBottomNavigationBloc>().add(NeoBottomNavigationEventChangeTab(i)),
      child: SizedBox(
        height: NeoDimens.px48,
        child: NeoBottomNavigationItem(
          iconUrn: tabs[i].iconUrn,
          labelText: tabs[i].labelText,
          isSelected: context.read<NeoBottomNavigationBloc>().state.currentIndex == i,
        ),
      ),
    );
  }
}
