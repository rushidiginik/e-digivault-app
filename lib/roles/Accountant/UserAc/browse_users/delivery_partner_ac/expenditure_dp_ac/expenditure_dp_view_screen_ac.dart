import 'package:flutter/material.dart';

import '../../../../../../../widgets/common_header.dart';

class ExpenditureDpViewScreenAc extends StatefulWidget {
  const ExpenditureDpViewScreenAc({super.key});

  @override
  State<ExpenditureDpViewScreenAc> createState() =>
      _ExpenditureDpViewScreenAcState();
}

class _ExpenditureDpViewScreenAcState extends State<ExpenditureDpViewScreenAc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonHeader(title: 'DP', showBack: true),
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
