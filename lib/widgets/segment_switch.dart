import 'package:flutter/material.dart';

class SegmentSwitch extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChanged;
  final Color backgroundColor;
  final List<String> labels;

  const SegmentSwitch({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
    required this.backgroundColor,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(labels.length, (index) {
          return GestureDetector(
            onTap: () => onChanged(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 22),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:
                selectedIndex == index ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                labels[index],
                style: TextStyle(
                  color:
                  selectedIndex == index ? backgroundColor : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}