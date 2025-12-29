import 'package:flutter/material.dart';

class MoreScreenAc extends StatefulWidget {
  const MoreScreenAc({super.key});

  @override
  State<MoreScreenAc> createState() => _MoreScreenAcState();
}

class _MoreScreenAcState extends State<MoreScreenAc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('More')),
      ),
    );
  }
}
