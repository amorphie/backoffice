part of '../neo_stepper.dart';

class _NeoStepperDetailVertical extends StatelessWidget {
  final String? title;
  final String? description;
  final String? datetime;

  const _NeoStepperDetailVertical({
    this.title,
    this.description,
    this.datetime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NeoText(title, style: NeoTextStyles.bodyTwelveSemibold),
        NeoText(description, style: NeoTextStyles.bodyTwelveMedium),
        NeoText(datetime, style: NeoTextStyles.bodyTwelveRegular),
      ],
    ).paddingOnly(start: NeoDimens.px12);
  }
}
