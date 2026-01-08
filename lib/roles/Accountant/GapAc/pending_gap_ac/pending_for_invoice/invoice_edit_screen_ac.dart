import 'package:flutter/material.dart';
import '../../../../../widgets/common_header.dart';

class InvoiceEditScreenAc extends StatefulWidget {
  const InvoiceEditScreenAc({super.key});

  @override
  State<InvoiceEditScreenAc> createState() => _InvoiceEditScreenAcState();
}

class _InvoiceEditScreenAcState extends State<InvoiceEditScreenAc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonHeader(title: 'Edit Invoice', showBack: true),
    );
  }
}
