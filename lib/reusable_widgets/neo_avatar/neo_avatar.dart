import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/reusable_widgets/neo_avatar/bloc/neo_avatar_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_avatar/model/neo_avatar_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_avatar/widgets/neo_avatar_border_painter.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/adapters/neo_image_picker_dropdown_adapter.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/neo_dropdown.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/bus/neo_bus.dart';

abstract class _Constants {
  static const double borderWidth = 3;
  static const double borderDividerWidth = 3;
  static const maxLines = 2;
}

class NeoAvatar extends StatelessWidget {
  final String? imageUrn;
  final String? setImageTransitionId;
  final String? labelText;
  final String? subText;
  final NeoAvatarDisplayMode displayMode;
  final bool showImage;
  final Axis axis;
  final EdgeInsetsDirectional padding;

  const NeoAvatar({
    this.imageUrn,
    this.setImageTransitionId,
    this.labelText,
    this.subText,
    this.showImage = true,
    this.displayMode = NeoAvatarDisplayMode.defaultMode,
    this.axis = Axis.vertical,
    this.padding = EdgeInsetsDirectional.zero,
    super.key,
  });

  NeoWidgetEventBus get _widgetEventBus => getIt.get<NeoWidgetEventBus>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NeoAvatarBloc, NeoAvatarState>(
      bloc: NeoAvatarBloc()
        ..add(NeoAvatarEventInitialize(displayMode))
        ..add(const NeoAvatarEventGetAvatarImage())
        ..add(const NeoAvatarEventGetCustomerNameAndSurname()),
      builder: (context, state) {
        return Flex(
          mainAxisSize: MainAxisSize.min,
          direction: axis,
          children: [
            if (showImage)
              CustomPaint(
                painter: const NeoGradientBorderPainter(
                  width: _Constants.borderWidth,
                  borderGradient: NeoGradientBorder.green50,
                ),
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
      if (labelText != null || state.nameAndSurname != null || subText != null)
        SizedBox(
          width: axis == Axis.horizontal ? NeoDimens.px12 : null,
          height: axis == Axis.vertical ? NeoDimens.px12 : null,
        ),
      Flexible(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: axis == Axis.horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            if (subText != null) NeoText(subText, style: state.subTitleStyle),
            if (labelText != null || state.nameAndSurname != null)
              Flexible(
                child: NeoText(
                  textAlign: axis == Axis.vertical ? TextAlign.center : null,
                  labelText ?? state.nameAndSurname,
                  style: state.labelTitleStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: _Constants.maxLines,
                ).paddingOnly(top: NeoDimens.px4),
              ),
          ],
        ),
      ),
    ];
  }

  Widget _buildEditableImage(BuildContext context, NeoAvatarState state) {
    return Stack(
      children: [
        if (state.avatarImage != null) _buildAvatarImage(state.avatarImage!) else _buildPlaceholderImage(),
        Positioned.fill(child: _buildEditButton(state)),
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
          iconUrn: NeoAssets.userFill24px.urn,
          color: NeoColors.bgDark,
        ),
      ),
    );
  }

  Widget _buildEditButton(NeoAvatarState state) {
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
          child: NeoDropdown(
            adapter: NeoImagePickerDropdownAdapter(
              getImageFromCamera: () => _widgetEventBus.addEvent(
                NeoWidgetEvent(eventId: NeoWidgetEventKeys.globalPickImageFromCamera.name),
              ),
              getImageFromGallery: () => _widgetEventBus.addEvent(
                NeoWidgetEvent(eventId: NeoWidgetEventKeys.globalPickImageFromGallery.name),
              ),
              deleteImageDataVisibility: state.avatarImage != null,
            ),
          ),
        ),
      ),
    );
  }
}
