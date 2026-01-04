import 'package:flutter/material.dart';

import '../../../../../../../widgets/common_header.dart';

class ExpenditureInchargeViewScreenAc extends StatefulWidget {
  const ExpenditureInchargeViewScreenAc({super.key});

  @override
  State<ExpenditureInchargeViewScreenAc> createState() =>
      _ExpenditureInchargeViewScreenAcState();
}

class _ExpenditureInchargeViewScreenAcState
    extends State<ExpenditureInchargeViewScreenAc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonHeader(title: 'INCHARGE', showBack: true),
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
