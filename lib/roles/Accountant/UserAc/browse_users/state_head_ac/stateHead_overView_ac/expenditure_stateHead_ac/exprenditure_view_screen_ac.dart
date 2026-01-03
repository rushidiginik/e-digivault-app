import 'package:flutter/material.dart';

import '../../../../../../../widgets/common_header.dart';

class ExprenditureViewScreenAc extends StatefulWidget {
  const ExprenditureViewScreenAc({super.key});

  @override
  State<ExprenditureViewScreenAc> createState() =>
      _ExprenditureViewScreenAcState();
}

class _ExprenditureViewScreenAcState extends State<ExprenditureViewScreenAc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonHeader(title: 'State Head', showBack: true),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 160.0),
          child: Container(
            height: 400,
            width: double.infinity,
            color: Colors.white,
            child: Image.asset("assets/images/png/exp_view.png"),
          ),
        )
      ]),
    );
  }
}
