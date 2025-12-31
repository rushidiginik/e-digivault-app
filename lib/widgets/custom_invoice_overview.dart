import 'package:flutter/material.dart';

class CustomInvoiceOverview extends StatelessWidget {
  const CustomInvoiceOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 10),
        _InvoiceRow(
          title: "Paid",
          value: 50,
          max: 100,
          darkColor: Color(0xFF2E7D32),
          lightColor: Color(0xFFC8E6C9),
        ),
        SizedBox(height: 10),

        _InvoiceRow(
          title: "Partially Paid",
          value: 34,
          max: 100,
          darkColor: Color(0xFFF57C00),
          lightColor: Color(0xFFFFE0B2),
        ),
        SizedBox(height: 10),

        _InvoiceRow(
          title: "Not Paid",
          value: 16,
          max: 100,
          darkColor: Color(0xFFC62828),
          lightColor: Color(0xFFFFCDD2),
        ),
      ],
    );
  }
}

/// ───────── SINGLE ROW ─────────
class _InvoiceRow extends StatelessWidget {
  final String title;
  final int value;
  final int max;
  final Color darkColor;
  final Color lightColor;

  const _InvoiceRow({
    required this.title,
    required this.value,
    required this.max,
    required this.darkColor,
    required this.lightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // LEFT TEXT
        SizedBox(
          width: 90,
          child: Text(
            title,
            style: const TextStyle(fontSize: 12, color: Color(0xFF130703)),
          ),
        ),

        // PROGRESS BAR
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 14,
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                widthFactor: value / max,
                child: Container(
                  height: 14,
                  decoration: BoxDecoration(
                    color: darkColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 10),

        // RIGHT VALUE
        SizedBox(
          width: 60,
          child: Text(
            "$value/$max",
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
