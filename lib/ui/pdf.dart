// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class Pdfex2 extends StatefulWidget {
  const Pdfex2({super.key});

  @override
  _Pdfex2 createState() => _Pdfex2();
}

class _Pdfex2 extends State<Pdfex2> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Text("data"),
          Expanded(
            child: SfPdfViewer.asset(
              'assets/diyetpdf.pdf',
              key: _pdfViewerKey,
            ),
          ),
        ],
      ),
    );
  }
}
