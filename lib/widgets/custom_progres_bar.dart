import 'package:flutter/material.dart';

class CustomProgresBar extends StatelessWidget {
  const CustomProgresBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _TaskItem(color: Color(0xFF4CAF50), text: "Completed - 200"),
                _TaskItem(color: Color(0xFFFF9800), text: "Ongoing - 100"),
                _TaskItem(color: Color(0xFFCE4C4C), text: "Pending - 120"),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "420",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7C4DFF),
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16),

        /// ───── BOTTOM BARS (ALAG-ALAG) ─────
        Row(
          children: const [
            _SingleBar(
              value: 200,
              max: 420,
              dark: Color(0xFF4CAF50),
              light: Color(0xFFC8E6C9),
            ),
            SizedBox(width: 9),
            _SingleBar(
              value: 100,
              max: 420,
              dark: Color(0xFF5C6BC0),
              light: Color(0xFFC5CAE9),
            ),
            SizedBox(width: 9),
            _SingleBar(
              value: 120,
              max: 420,
              dark: Color(0xFFE53935),
              light: Color(0xFFFFCDD2),
            ),
          ],
        ),
      ],
    );
  }
}

/// ───────── TASK ITEM ─────────
class _TaskItem extends StatelessWidget {
  final Color color;
  final String text;

  const _TaskItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          CircleAvatar(radius: 4, backgroundColor: color),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 13, color: Color(0xFF6F6F6F)),
          ),
        ],
      ),
    );
  }
}

/// ───────── SINGLE BAR ─────────
class _SingleBar extends StatelessWidget {
  final int value;
  final int max;
  final Color dark;
  final Color light;

  const _SingleBar({
    required this.value,
    required this.max,
    required this.dark,
    required this.light,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // flex: value,
      child: SizedBox(
        width: 110,
        child: Stack(
          children: [
            Container(
              height: 14,
              decoration: BoxDecoration(
                color: light,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            FractionallySizedBox(
              widthFactor: value / max,
              child: Container(
                height: 14,
                decoration: BoxDecoration(
                  color: dark,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}