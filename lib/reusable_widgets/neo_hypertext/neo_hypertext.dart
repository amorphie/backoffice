import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_hypertext/model/neo_hypertext_action_type.dart';
import 'package:backoffice/reusable_widgets/neo_hypertext/model/neo_hypertext_highlighted_item.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class _Constants {
  static final highlightedRegex = RegExp(r'\{(.+?)\}');
}

class NeoHypertext extends StatelessWidget {
  final String text;
  final List<NeoHypertextHighlightedItem> highlightedItems;
  final EdgeInsetsDirectional padding;
  final TextAlign textAlign;
  final TextStyle? style;

  const NeoHypertext({
    required this.text,
    required this.highlightedItems,
    this.style,
    this.padding = EdgeInsetsDirectional.zero,
    this.textAlign = TextAlign.start,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final parametricList = [];
    text.splitMapJoin(
      _Constants.highlightedRegex,
      onMatch: (Match match) {
        if (highlightedItems.any((element) => element.itemKey == match.group(1))) {
          parametricList.add(match.group(1) ?? '');
        } else {
          parametricList.add(match.group(0) ?? '');
        }
        return '';
      },
      onNonMatch: (String nonMatch) {
        parametricList.add(nonMatch);
        return '';
      },
    );

    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: parametricList.map((e) {
          final highlightedItem = highlightedItems.firstWhereOrNull((element) => element.itemKey == e);
          if (highlightedItem == null) {
            return _buildDefaultText(e);
          }
          return highlightedItem.actionType != null ? _buildActionText(highlightedItem) : _buildBoldText(context, highlightedItem);
        }).toList(),
      ),
    ).padding(padding);
  }

  TextSpan _buildDefaultText(String e) {
    return TextSpan(text: e, style: style);
  }

  TextSpan _buildBoldText(BuildContext context, NeoHypertextHighlightedItem highlightedItem) {
    return TextSpan(
      text: highlightedItem.text ?? '{${highlightedItem.itemKey}}'.formatDataWithDataKey(context, highlightedItem.itemKey),
      style: style?.copyWith(fontWeight: FontWeight.bold) ?? const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  TextSpan _buildActionText(NeoHypertextHighlightedItem highlightedItem) {
    return TextSpan(
      text: highlightedItem.text,
      style: style?.copyWith(decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          switch (highlightedItem.actionType) {
            case NeoHypertextActionType.webView:
            // TODO: Handle this webView.
            case NeoHypertextActionType.callNumber:
              callNumber(highlightedItem.data ?? '');
            case NeoHypertextActionType.deeplink:
            // TODO: Handle this deeplink.
            case null:
              return;
          }
        },
    );
  }

  Future<void> callNumber(String data) async {
    final url = Uri(
      scheme: 'tel',
      path: data,
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
