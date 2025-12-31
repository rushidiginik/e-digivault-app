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
                color: isSelected
                    ? AppStyles.black
                    : AppStyles.whiteColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? Color(0xCC151515)
                      : AppStyles.grey,
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
}