import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_border/dotted_border.dart';



class DottedTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;

  const DottedTextField({
    super.key,
   required this.title,
    required this.hintText,
    this.controller,
    this.maxLines = 4,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppStyles.black,
      strokeWidth: 1,
      dashPattern: const [6, 4],
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TITLE INSIDE BORDER
            textSemiBold(
             text: title,
             fontSize: 20,
             fontColor: AppStyles.black
            ),

            const SizedBox(height: 6),

            ///  TEXT FIELD
            TextFormField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppStyles.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
