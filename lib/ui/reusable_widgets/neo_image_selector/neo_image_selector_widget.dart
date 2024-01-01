import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/core/dependency_injection/dependency_injection.dart';
import 'package:admin/ui/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:admin/ui/reusable_widgets/neo_image_selector/models/neo_image_selector_item_data.dart';
import 'package:admin/core/util/constants/neo_widget_event_keys.dart';
import 'package:admin/core/util/neo_util.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event_bus.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

// ignore_for_file: unnecessary_lambdas
abstract class _Constants {
  static const double borderThickness = 2;
  static const double gridViewAspectRatio = 155.5 / 108;
  static const double imageAspectRatio = 147.5 / 100;
  static const String securityImagesKey = "securityImages";
}

class NeoImageSelectorWidget extends StatefulWidget {
  final String? dataKey;
  final double horizontalPadding;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double? width;
  final EdgeInsetsDirectional? padding;

  const NeoImageSelectorWidget({
    this.dataKey,
    this.width,
    this.padding,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 20,
    this.crossAxisSpacing = 20,
    this.horizontalPadding = 24,
    Key? key,
  }) : super(key: key);

  @override
  State<NeoImageSelectorWidget> createState() => _NeoImageSelectorWidgetState();
}

class _NeoImageSelectorWidgetState extends State<NeoImageSelectorWidget> {
  int? selectedItemIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const BouncingScrollPhysics(),
      primary: true,
      shrinkWrap: true,
      childAspectRatio: _Constants.gridViewAspectRatio,
      mainAxisSpacing: widget.mainAxisSpacing,
      crossAxisSpacing: widget.crossAxisSpacing,
      crossAxisCount: widget.crossAxisCount,
      padding: widget.padding ?? EdgeInsetsDirectional.zero,
      children: _getImageUrlList(context).mapIndexed(_buildImageWithBorder).toList(),
    );
  }

  Widget _buildImageWithBorder(int itemIndex, NeoImageSelectorItemData itemData) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: NeoColors.borderMediumDark, width: _Constants.borderThickness),
        borderRadius: BorderRadius.circular(NeoRadius.px12),
      ),
      child: _buildImageCard(itemIndex, itemData).paddingAll(NeoDimens.px4),
    );
  }

  Widget _buildImageCard(int itemIndex, NeoImageSelectorItemData itemData) {
    return Stack(
      children: [
        _buildImageItem(itemIndex, itemData),
        _buildSelectionCircle(itemIndex, itemData),
      ],
    );
  }

  Widget _buildImageItem(int itemIndex, NeoImageSelectorItemData itemData) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(NeoDimens.px8),
      child: GestureDetector(
        onTap: () => _onImageSelected(itemIndex, itemData),
        child: AspectRatio(
          aspectRatio: _Constants.imageAspectRatio,
          // STOPSHIP: Change this to NeoImage
          child: Image.network(
            itemData.imagePath,
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionCircle(int itemIndex, NeoImageSelectorItemData itemData) {
    return Positioned(
      top: NeoDimens.px12,
      right: NeoDimens.px12,
      child: GestureDetector(
        onTap: () => _onImageSelected(itemIndex, itemData),
        child: Container(
          width: NeoDimens.px24,
          height: NeoDimens.px24,
          decoration: BoxDecoration(
            color: selectedItemIndex != itemIndex ? NeoColors.bgMedium : NeoColors.bgPrimaryGreen,
            border: selectedItemIndex != itemIndex ? Border.all(color: NeoColors.borderMediumDark, width: _Constants.borderThickness) : const Border.fromBorderSide(BorderSide.none),
            borderRadius: BorderRadius.circular(NeoRadius.rounded),
          ),
          child: selectedItemIndex != itemIndex ? const SizedBox.shrink() : NeoIcon(iconUrn: NeoAssets.check.urn, height: NeoDimens.px16, width: NeoDimens.px16).paddingAll(NeoDimens.px4),
        ),
      ),
    );
  }

  void _onImageSelected(int itemIndex, NeoImageSelectorItemData itemData) {
    if (selectedItemIndex != itemIndex) {
      setState(() => selectedItemIndex = itemIndex);
      if (widget.dataKey.isNotNull) {
        context.read<WorkflowFormBloc>().add(
              WorkflowFormEventUpdateTextFormField(key: widget.dataKey.orEmpty, value: itemData.id),
            );
      }

      getIt.get<NeoWidgetEventBus>().addEvent(
            NeoWidgetEvent(eventId: NeoWidgetEventKeys.neoButtonChangeEnableStatusEventKey.name, data: true),
          );
    }
  }

  List<NeoImageSelectorItemData> _getImageUrlList(BuildContext context) =>
      (context.read<WorkflowFormBloc>().formData[_Constants.securityImagesKey] as List).map((e) => NeoImageSelectorItemData.fromJson(e)).toList();
}
