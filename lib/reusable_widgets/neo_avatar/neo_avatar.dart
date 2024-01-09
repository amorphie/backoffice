import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_avatar/bloc/neo_avatar_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/usecases/display_image_picker_bottom_sheet.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/util/neo_util.dart';

part 'widgets/neo_avatar_border_painter.dart';

abstract class _Constants {
  static const double borderWidth = 3;
  static const double borderDividerWidth = 3;
}

class NeoAvatar extends StatelessWidget {
  final String? imageUrn;
  final String? setImageTransitionId;
  final String? labelText;
  final String? subText;
  final bool showImage;
  final EdgeInsetsDirectional padding;

  const NeoAvatar({
    this.imageUrn,
    this.setImageTransitionId,
    this.labelText,
    this.subText,
    this.showImage = true,
    this.padding = EdgeInsetsDirectional.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NeoAvatarBloc, NeoAvatarState>(
      bloc: NeoAvatarBloc()
        ..add(const NeoAvatarEventInitialize())
        ..add(const NeoAvatarEventGetAvatarImage()),
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showImage)
              CustomPaint(
                painter: const _NeoAvatarBorderPainter(width: _Constants.borderWidth),
                child: _buildEditableImage(context, state).paddingAll(_Constants.borderWidth + _Constants.borderDividerWidth),
              ),
            ..._buildLabelWidgetGroup(context, state),
          ],
        ).padding(padding);
      },
    );
  }

  List<Widget> _buildLabelWidgetGroup(BuildContext context, NeoAvatarState state) {
    return [
      if (labelText != null || subText != null)
        const SizedBox(
          height: NeoDimens.px12,
        ),
      if (subText != null)
        Text(
          subText!,
          style: state.subTitleStyle,
        ),
      if (labelText != null)
        Text(
          labelText!,
          style: state.labelTitleStyle,
        ).paddingOnly(top: NeoDimens.px4),
    ];
  }

  Widget _buildEditableImage(BuildContext context, NeoAvatarState state) {
    return Stack(
      children: [
        if (state.avatarImage != null) _buildAvatarImage(state.avatarImage!) else _buildPlaceholderImage(),
        Positioned.fill(child: _buildEditButton(context, state)),
      ],
    );
  }

  Widget _buildAvatarImage(Uint8List imageBytes) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(NeoRadius.rounded),
      child: Image.memory(
        imageBytes,
        width: NeoDimens.px64,
        height: NeoDimens.px64,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      width: NeoDimens.px64,
      height: NeoDimens.px64,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: NeoColors.bgMediumDark, borderRadius: BorderRadius.circular(NeoRadius.rounded)),
      child: Center(
        child: NeoIcon(
          iconUrn: NeoAssets.profileWidgetPlaceholder.urn,
          width: NeoDimens.px24,
          height: NeoDimens.px24,
          color: NeoColors.bgDark,
        ),
      ),
    );
  }

  Widget _buildEditButton(BuildContext context, NeoAvatarState state) {
    return Align(
      alignment: Alignment.bottomRight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: NeoColors.bgPrimaryGreenLight,
          border: Border.all(color: NeoColors.borderPrimaryGreen),
          borderRadius: BorderRadius.circular(NeoRadius.rounded),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              DisplayImagePickerBottomSheet().call(context, deleteImageDataVisibility: state.avatarImage != null);
            },
            borderRadius: BorderRadius.circular(NeoRadius.rounded),
            child: NeoIcon(
              iconUrn: NeoAssets.edit02.urn,
              height: NeoDimens.px12,
              width: NeoDimens.px12,
            ).paddingAll(NeoDimens.px4),
          ),
        ),
      ),
    );
  }
}
