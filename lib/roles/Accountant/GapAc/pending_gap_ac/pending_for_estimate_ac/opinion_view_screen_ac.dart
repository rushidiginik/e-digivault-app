import 'package:flutter/material.dart';

import '../../../../../widgets/all_opinion_widget.dart';
import '../../../../../widgets/common_app_bar_widget.dart';

class OpinionViewScreenAc extends StatefulWidget {
  const OpinionViewScreenAc({super.key});

  @override
  State<OpinionViewScreenAc> createState() => _OpinionViewScreenAcState();
}

class _OpinionViewScreenAcState extends State<OpinionViewScreenAc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBarWidget(title: ""),
      body: AllOpinionWidget(
        clientName: "Rajesh Kumar",
        documentName: "E-Katha",
        title2: "Opinion",
        title: "Opinion",
        overviewPoints: [
          "The property under lease is classified as E-\nKhata, which implies it is digitally recorded\nwith the local municipal authority (typically \nBBMP or relevant ULB).",
          "It is essential that the property has valid\nconversion documents (if converted from \n agricultural to commercial use), approved\nbuilding plans, and updated tax receipts.",
          "Lessee is advised to verify the ownership\ntitle and ensure that the land use \nclassification permits commercial activity \nin accordance with the zoning regulations.",
          "The property under lease is classified as E-\nKhata, which implies it is digitally recorded\nwith the local municipal authority (typically \nBBMP or relevant ULB)\n It is essential that the property has valid ",
          "The property under lease is classified as E-\nKhata, which implies it is digitally recorded\nwith the local municipal authority (typically \nBBMP or relevant ULB)\n It is essential that the property has valid ",
          "The property under lease is classified as E-\nKhata, which implies it is digitally recorded\nwith the local municipal authority (typically \nBBMP or relevant ULB)\n It is essential that the property has valid ",
          "The property under lease is classified as E-\nKhata, which implies it is digitally recorded\nwith the local municipal authority (typically \nBBMP or relevant ULB)\n It is essential that the property has valid ",
        ],
        legalPoints: [
          "The title appears clear and marketable.",
          "The land use permits commercial activity.",
          "No adverse legal issues found in documents reviewed.",
        ],
      ),
    );
  }
}
