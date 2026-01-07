import 'package:flutter/material.dart';

import '../../../../../../../widgets/common_header.dart';

class ExpenditurePaymentViewScreenAc extends StatefulWidget {
  const ExpenditurePaymentViewScreenAc({super.key});

  @override
  State<ExpenditurePaymentViewScreenAc> createState() =>
      _ExpenditurePaymentViewScreenAcState();
}

class _ExpenditurePaymentViewScreenAcState
    extends State<ExpenditurePaymentViewScreenAc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonHeader(title: 'Receipt', showBack: true),
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
