import 'package:flutter/material.dart';

import '../../../../../../../widgets/common_header.dart';

class ExpenditureRegionalheadViewScreenAc extends StatefulWidget {
  const ExpenditureRegionalheadViewScreenAc({super.key});

  @override
  State<ExpenditureRegionalheadViewScreenAc> createState() =>
      _ExpenditureRegionalheadViewScreenAcState();
}

class _ExpenditureRegionalheadViewScreenAcState
    extends State<ExpenditureRegionalheadViewScreenAc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonHeader(title: 'Regional Head', showBack: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 160.0),
            child: Container(
              height: 400,
              width: double.infinity,
              color: Colors.white,
              child: Image.asset("assets/images/png/exp_view.png"),
            ),
          ),
        ],
      ),
    );
  }
}
