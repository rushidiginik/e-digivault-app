import 'package:flutter/material.dart';

class GapScreenAc extends StatefulWidget {
  const GapScreenAc({super.key});

  @override
  State<GapScreenAc> createState() => _GapScreenAcState();
}

class _GapScreenAcState extends State<GapScreenAc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Gap')),
      ),
    );
  }
}
