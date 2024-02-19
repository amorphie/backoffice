import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:widgetbook/widgetbook.dart';

class LoginAttemptListItemWidget extends StatelessWidget {
  final DateTime attemptDate;
  final String channel;
  final bool isSuccessful;
  final EdgeInsetsDirectional padding;

  const LoginAttemptListItemWidget({
    required this.attemptDate,
    required this.channel,
    required this.isSuccessful,
    this.padding = EdgeInsetsDirectional.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildListRow(
          // STOPSHIP: Add Localization
          "Durum",
          isSuccessful ? "Başarılı Giriş" : "Başarısız Deneme",
        ).paddingOnly(bottom: NeoDimens.px12),
        // STOPSHIP: Add Localization
        _buildListRow("Tarih / Saat", attemptDate.toSimpleFormat()).paddingOnly(bottom: NeoDimens.px12),
        // STOPSHIP: Add Localization
        _buildListRow("Giriş Kanalı", channel),
      ],
    ).padding(padding);
  }

  Widget _buildListRow(String title, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NeoText(
          title,
          style: NeoTextStyles.bodyTwelveMedium,
        ),
        NeoText(
          description,
          style: NeoTextStyles.bodyFourteenSemibold,
        ),
      ],
    );
  }
}
