import 'package:flutter/material.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ProgrammeAtGlanceScreen extends StatelessWidget {
  const ProgrammeAtGlanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Programme at glance',
      ),
      body: SfPdfViewer.asset(
        'assets/pdf/program_at_glance.pdf',
        maxZoomLevel: 5,
      ),
    );
  }
}
