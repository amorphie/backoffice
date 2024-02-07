// ignore_for_file: library_private_types_in_public_api

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'neo_bo_pdf_file.dart';

/// Represents Homepage for Navigation
class NeoBoPdfViewWidget extends StatefulWidget {
  final Uint8List? bytes;
  const NeoBoPdfViewWidget({
    super.key,
    this.bytes,
  });

  @override
  _Pdfex2 createState() => _Pdfex2();
}

class _Pdfex2 extends State<NeoBoPdfViewWidget> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SfPdfViewer.memory(
          widget.bytes ?? testPdf,
          key: _pdfViewerKey,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
                semanticLabel: 'Bookmark',
              ),
              onPressed: () {
                _pdfViewerKey.currentState?.openBookmarkView();
              },
            ),
          ),
        ),
      ],
    );
  }
}
