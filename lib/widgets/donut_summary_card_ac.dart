import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DonutSummaryCardAc extends StatelessWidget {
  final double received;
  final double expenditure;
  final double requests;
  final double balance;

  const DonutSummaryCardAc({
    super.key,
    required this.received,
    required this.expenditure,
    required this.requests,
    required this.balance,
  });

  double get total => received + expenditure + requests + balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          /// DONUT CHART
          SizedBox(
            width: 140,
            height: 140,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    startDegreeOffset: -10,
                    sectionsSpace: 0,
                    centerSpaceRadius: 49,
                    sections: [
                      _section(requests, const Color(0xFFFFC328)),
                      _section(balance, const Color(0xFFC141CC)),
                      _section(expenditure, const Color(0xFFF35E47)),
                      _section(received, const Color(0xFF9CC741)),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${total.toInt()}A",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Total",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          /// RIGHT SIDE LEGEND
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _legend("Received", received, const Color(0xFF8BC34A)),
                _legend("Expenditure", expenditure, const Color(0xFFFF5A3C)),
                _legend("Requests", requests, const Color(0xFFFFC107)),
                _legend("Balance", balance, const Color(0xFFB84DFF)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PieChartSectionData _section(double value, Color color) {
    return PieChartSectionData(
      value: value,
      color: color,
      radius: 13,
      showTitle: false,
    );
  }

  Widget _legend(String title, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 14))),
          Text(
            "${value.toInt()}A",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
