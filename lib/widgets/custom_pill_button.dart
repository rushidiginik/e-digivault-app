import 'package:flutter/material.dart';

class CustomPillButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color textColor;
  final VoidCallback? onTap;

  const CustomPillButton({
    super.key,
    required this.title,
    required this.bgColor,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: textColor,
          ),
        ),
      ),
    );
  }
}