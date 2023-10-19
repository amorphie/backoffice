// ignore_for_file: library_private_types_in_public_api

import 'dart:typed_data';

import 'package:admin/ui/widgets/pdf/pdf_file.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class PdfWidget extends StatefulWidget {
  final Uint8List? bytes;
  const PdfWidget({
    super.key,
    this.bytes,
  });

  @override
  _Pdfex2 createState() => _Pdfex2();
}

class _Pdfex2 extends State<PdfWidget> {
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
          testPdf,
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
