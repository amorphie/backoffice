import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_expandable_information_card/bloc/neo_expandable_information_card_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_information_card/model/neo_information_card_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoExpandableInformationCard extends StatelessWidget {
  final NeoInformationCardDisplayMode displayMode;
  final Widget collapsedWidget;
  final Widget expandedWidget;
  final String expandButtonText;
  final String collapseButtonText;

  const NeoExpandableInformationCard({
    required this.displayMode,
    required this.collapsedWidget,
    required this.expandedWidget,
    required this.expandButtonText,
    required this.collapseButtonText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoExpandableInformationCardBloc(),
      child: BlocBuilder<NeoExpandableInformationCardBloc, NeoExpandableInformationCardState>(
        builder: (context, state) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(NeoRadius.px8),
              color: displayMode.color,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                state is NeoExpandableInformationCardCollapsedState ? collapsedWidget : expandedWidget,
                GestureDetector(
                  onTap: () {
                    context.read<NeoExpandableInformationCardBloc>().add(
                          const NeoExpandableInformationCardEventToggleCard(),
                        );
                  },
                  child: NeoText(
                    state is NeoExpandableInformationCardCollapsedState ? expandButtonText : collapseButtonText,
                    style: NeoTextStyles.titleTwelveBold.copyWith(decoration: TextDecoration.underline),
                  ).paddingOnly(top: NeoDimens.px16),
                ),
              ],
            ).paddingAll(NeoDimens.px16),
          );
        },
      ),
    );
  }
}
