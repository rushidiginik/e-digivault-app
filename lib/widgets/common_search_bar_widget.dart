import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';


class CommonSearchBar extends StatelessWidget {
  const CommonSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppStyles.whiteColor,
        border: Border.all(color: Color(0xFFDEE2E6), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search, color: AppStyles.primaryColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: textRegular(
              text: "Search here",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontColor: AppStyles.grey7C,
            ),
          ),
        ],
      ),
    );
  }
}