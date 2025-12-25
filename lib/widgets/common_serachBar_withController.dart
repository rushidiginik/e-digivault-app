import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';

class CommonSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const CommonSearchBar({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: AppStyles.whiteColor,
        border: Border.all(color: Color(0xFFDEE2E6), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppStyles.primaryColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: "Search here",
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 16,
                color: AppStyles.grey7C,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
