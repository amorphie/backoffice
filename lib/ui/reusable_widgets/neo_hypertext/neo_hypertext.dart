import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:admin/ui/reusable_widgets/neo_hypertext/model/neo_hypertext_highlighted_item.dart';
import 'package:admin/core/util/neo_util.dart';

// ignore: must_be_immutable
class NeoHypertext extends StatelessWidget {
  String text; //because text changed
  final List<NeoHypertextHighlightedItem> highlightedItems;
  final EdgeInsetsDirectional? padding;
  final TextAlign? textAlign;
  NeoHypertext({
    required this.text,
    required this.highlightedItems,
    super.key,
    this.padding,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    final List<InlineSpan> inlineSpans = [];

    int currentIndex = 0;
    final cleanedText = text.replaceAll(RegExp('[{}]+'), '');

    for (final item in highlightedItems) {
      final int startIndex = cleanedText.indexOf(item.itemKey, currentIndex);

      if (startIndex != -1) {
        // Eğer altı çizili olmayan bir kısım varsa, eklenir
        if (startIndex > currentIndex) {
          inlineSpans.add(
            TextSpan(
              text: cleanedText.substring(currentIndex, startIndex),
              style: NeoTextStyles.bodyTwelveMedium.copyWith(color: NeoColors.textNeutral),
            ),
          );
        }

        // Altı çizili kısım eklenir
        inlineSpans.add(
          TextSpan(
            text: item.text,
            style: NeoTextStyles.bodyTwelveMedium.copyWith(decoration: TextDecoration.underline, color: NeoColors.textLink),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // print("Arama başlatılıyor: ${item.data}");
              },
          ),
        );

        currentIndex = startIndex + item.itemKey.length;
      }
    }

    // Eğer metinde geriye altı çizili olmayan bir kısım varsa, eklenir
    if (currentIndex < cleanedText.length) {
      inlineSpans.add(
        TextSpan(
          text: cleanedText.substring(currentIndex),
          style: NeoTextStyles.bodyTwelveMedium.copyWith(color: NeoColors.textNeutral),
        ),
      );
    }

    return padding == null
        ? buildRichText(inlineSpans, textAlign!)
        : Padding(
            padding: padding!,
            child: buildRichText(inlineSpans, textAlign!),
          );
  }
}

Widget buildRichText(List<InlineSpan> inlineSpans, TextAlign textAlign) {
  return RichText(
    text: TextSpan(children: inlineSpans),
    textAlign: textAlign,
  );
}
