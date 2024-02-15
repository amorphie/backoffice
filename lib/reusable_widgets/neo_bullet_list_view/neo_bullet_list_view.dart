import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/extensions/widget_extensions.dart';

class NeoBulletListView extends StatelessWidget {
  final List<String> bulletList;

  const NeoBulletListView({required this.bulletList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...bulletList.map(_buildBulletItemRow)],
    );
  }

  Widget _buildBulletItemRow(String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.circle, size: 6).paddingOnly(top: 4, end: 4),
        Flexible(child: NeoText(description, maxLines: 3)),
      ],
    ).paddingSymmetric(vertical: 4);
  }
}
