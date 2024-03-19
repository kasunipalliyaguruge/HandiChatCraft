import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/pdf_viewer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatelessWidget {
  PdfScreen({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(handloom[index],
         style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 14,
         ),
        ),
      ),
      body: SfPdfViewer.asset(pdf[index]),
    );
  }
}