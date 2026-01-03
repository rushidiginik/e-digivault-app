import 'package:flutter/material.dart';
import '../core/constants/theme.dart';

class CustomTabBarWidget extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBarWidget({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      child: Row(
        children: List.generate(tabs.length, (index) {
          bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              margin: EdgeInsets.only(right: w * 0.02), // responsive spacing
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.045, // responsive width
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppStyles.black : AppStyles.whiteColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Color(0xCC151515) : AppStyles.grey,
                  width: 1,
                ),
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  color: isSelected ? AppStyles.whiteColor : Color(0x99151515),
                  fontSize: w * 0.032, // responsive text
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget pendingCapsuleTabBar({
    required List<String> tabs,
    required int selectedIndex,
    required Function(int) onTap,
  }) {
    return Container(
      height: 44,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppStyles.primaryColor, // 🔵 outer blue
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(tabs.length, (index) {
          final bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppStyles
                          .whiteColor // ⚪ selected
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? AppStyles.primaryColor
                      : AppStyles.whiteColor,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

Widget pendingCapsuleTabBar({
  required List<String> tabs,
  required int selectedIndex,
  required Function(int) onTap,
}) {
  return Container(
    height: 44,
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: AppStyles.primaryColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(tabs.length, (index) {
        final bool isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () => onTap(index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? AppStyles.whiteColor : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              tabs[index],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? AppStyles.primaryColor
                    : AppStyles.whiteColor,
              ),
            ),
          ),
        );
      }),
    ),
  );
}
