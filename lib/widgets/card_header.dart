import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final Widget? trailing;

  const CardHeader({
    super.key,
    required this.title,
    this.style,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
          style ??
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
        ),
        trailing ?? const SizedBox(),
      ],
    );
  }
}