import 'package:flutter/material.dart';

class PaymentsScreenAc extends StatefulWidget {
  const PaymentsScreenAc({super.key});

  @override
  State<PaymentsScreenAc> createState() => _PaymentsScreenAcState();
}

class _PaymentsScreenAcState extends State<PaymentsScreenAc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Payments')),
      ),

    );
  }
}
