import 'dart:convert';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookFolder get widgetbookFolderDynamicPages => WidgetbookFolder(
      name: 'Dynamic Page Builder',
      children: [
        WidgetbookComponent(
          name: "Dynamic Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => JsonWidgetData.fromDynamic(
                json.decode(
                  context.knobs
                      .string(
                        label: 'Json widget tree',
                        initialValue:
                            '{"type":"padding","args":{"padding":{"left":32,"right":32}},"child":{"type":"column","children":[{"type":"otp_title_widget","args":{"title":"Şifre Doğrulama"}},{"type":"otp_message_widget","args":{"message":"Lütfen 5** ** 45 ile biten cep telefonunuza gelen doğrulama kodunu giriniz."}},{"type":"otp_count_down_timer_widget","args":{"duration":120}},{"type":"otp_input_with_submit_button_widget","args":{"title":"SMS Doğrulama Kodu","button_text":"Devam","otp_length":4,"workflow":"register","transition_id":"openbanking-sms-key-send"}},{"type":"spacer"},{"type":"security_icon_widget","args":{"paddingAll":32}}]}}',
                      )
                      .replaceAll(RegExp(r'\s+'), ''),
                ),
              ).build(context: context),
            ),
          ],
        ),
      ],
    );
