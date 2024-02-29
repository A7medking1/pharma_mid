import 'package:flutter/material.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FloorPlaneScreen extends StatelessWidget {
  const FloorPlaneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Floor Plan',
      ),
      body: SfPdfViewer.asset(
        'assets/pdf/floor_plan.pdf',
        maxZoomLevel: 5,
      ),
    );
  }
}
