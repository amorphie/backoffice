/*
 * neo_bank
 *
 * Created on 10/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_size.dart';
import 'package:backoffice/reusable_widgets/neo_button/neo_button.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/adapters/neo_dropdown_base_adapter.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/bottom_sheet/bloc/neo_dropdown_bottom_sheet_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/base_dropdown_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

abstract class _Constants {
  static const double bottomSheetMaxHeightRatio = 0.926;
  static const int minSearchItemLength = 3;
  static const int minCharLength = 2;
}

class DisplayNeoDropdownBottomSheetUseCase<T extends BaseDropdownItemData> {
  DisplayNeoDropdownBottomSheetUseCase();

  int initialItemCount = 0;
  bool isSearching = false;

  Future<T?> call({
    required BuildContext context,
    required NeoDropdownBaseAdapter adapter,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * _Constants.bottomSheetMaxHeightRatio),
      builder: (BuildContext context) {
        initialItemCount = adapter.itemList.length;
        return BlocProvider(
          create: (context) => NeoDropdownBottomSheetBloc(adapter.itemList),
          child: BlocConsumer<NeoDropdownBottomSheetBloc, NeoDropdownBottomSheetState>(
            listener: (context, state) {
              if (state is NeoDropdownBottomSheetStateSelected && state.closeBottomSheet) {
                Navigator.of(context).pop(state.selectedItem);
              }
              if (state is NeoDropdownBottomSheetStateSearchResult) {
                isSearching = true;
              }
            },
            builder: (context, state) {
              final itemList = context.read<NeoDropdownBottomSheetBloc>().itemListFiltered;
              return _buildBottomSheetContents(adapter, itemList, context).paddingSymmetric(horizontal: NeoDimens.px24);
            },
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetContents(
    NeoDropdownBaseAdapter<BaseDropdownItemData> adapter,
    List<BaseDropdownItemData> itemList,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildDragIndicator(),
        _buildTitle(adapter.bottomSheetTitle),
        _buildSearchBar(context, adapter.searchHintText, adapter),
        _buildItemList(itemList, adapter, context),
        adapter.displaySubmitButton ? buildNeoButton(context, adapter) : const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildItemList(
    List<BaseDropdownItemData> itemList,
    NeoDropdownBaseAdapter<BaseDropdownItemData> adapter,
    BuildContext context,
  ) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: !isSearching,
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = itemList[index];
          return Column(
            children: <Widget>[
              adapter.bottomSheetItemBuilder(context, item).paddingOnly(bottom: NeoDimens.px16),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDragIndicator() {
    return Align(
      child: Container(
        width: NeoDimens.px44,
        height: NeoDimens.px4,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(NeoRadius.px4), color: NeoColors.bgMediumDark),
      ).paddingOnly(top: NeoDimens.px12),
    );
  }

  Widget _buildTitle(String? title) {
    return title != null
        ? Center(
            child: NeoText(title, style: NeoTextStyles.labelSixteenSemibold).paddingOnly(top: NeoDimens.px16, bottom: NeoDimens.px28),
          )
        : const SizedBox.shrink();
  }

  Widget _buildSearchBar(
    BuildContext context,
    String? searchHintText,
    NeoDropdownBaseAdapter<BaseDropdownItemData> adapter,
  ) {
    return initialItemCount > _Constants.minSearchItemLength && !searchHintText.isNullOrBlank
        ? Container(
            height: NeoDimens.px52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(NeoRadius.px8),
              color: NeoColors.bgMedium,
            ),
            child: TextField(
              style: NeoTextStyles.bodyTwelveMedium.copyWith(color: NeoColors.textPlaceholder),
              onChanged: (value) {
                // Call empty string to reset the list
                context.read<NeoDropdownBottomSheetBloc>().add(
                      NeoDropdownBottomSheetEventSearchItem(
                        adapter.filterItems.call(value.length > _Constants.minCharLength ? value : "").orEmptyList,
                      ),
                    );
              },
              decoration: InputDecoration(
                hintText: searchHintText,
                contentPadding: const EdgeInsetsDirectional.all(NeoDimens.px16),
                hintStyle: NeoTextStyles.bodyTwelveMedium.copyWith(color: NeoColors.textPlaceholder),
                prefixIcon: NeoIcon(iconUrn: NeoAssets.search20px.urn),
                border: InputBorder.none,
              ),
            ).paddingSymmetric(horizontal: NeoDimens.px16),
          ).paddingOnly(bottom: NeoDimens.px16)
        : const SizedBox.shrink();
  }

  Widget buildNeoButton(BuildContext context, NeoDropdownBaseAdapter adapter) {
    return Listener(
      onPointerDown: (_) {
        if (adapter.itemList.isNotEmpty) {
          context.read<NeoDropdownBottomSheetBloc>().add(NeoDropdownBottomSheetEventConfirmSelection());
        }
      },
      child: NeoButton(
        labelText: adapter.submitButtonText,
        size: NeoButtonSize.large,
        padding: const EdgeInsetsDirectional.only(
          bottom: NeoDimens.px40,
          top: NeoDimens.px16,
        ),
      ),
    );
  }
}
