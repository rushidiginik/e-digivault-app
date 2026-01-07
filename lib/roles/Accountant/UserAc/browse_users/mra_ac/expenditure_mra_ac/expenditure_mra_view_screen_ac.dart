import 'package:flutter/material.dart';

import '../../../../../../../widgets/common_header.dart';

class ExpenditureMraViewScreenAc extends StatefulWidget {
  const ExpenditureMraViewScreenAc({super.key});

  @override
  State<ExpenditureMraViewScreenAc> createState() =>
      _ExpenditureMraViewScreenAcState();
}

class _ExpenditureMraViewScreenAcState
    extends State<ExpenditureMraViewScreenAc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonHeader(title: 'MRA', showBack: true),
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
