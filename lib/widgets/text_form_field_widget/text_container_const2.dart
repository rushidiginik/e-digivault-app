import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class TextContainerConst2 extends StatefulWidget {
  final String labelTitle, value;
  final double? width;

  const TextContainerConst2({
    super.key,
    required this.labelTitle,
    required this.value,
    this.width,
  });

  @override
  State<TextContainerConst2> createState() => _TextContainerConst2State();
}

class _TextContainerConst2State extends State<TextContainerConst2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.5.h), // responsive top padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Label text
          Padding(
            padding: EdgeInsets.only(left: 2.w, bottom: 0.5.h),
            child: textRegular(
              text: widget.labelTitle.tr(),
              fontSize: 16.sp,
              fontColor: AppStyles.black1A, // responsive font size
            ),
          ),

          /// Value container (auto height)
          Container(
            width: widget.width ?? 90.w, // responsive width
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
            decoration: BoxDecoration(
              color: AppStyles.whiteColor,
              borderRadius: BorderRadius.circular(1.5.w), // responsive radius
              border: Border.all(color: AppStyles.primaryColor),
            ),
            child: textRegular(
              text: widget.value,
              fontColor: AppStyles.black1A,

              fontSize: 16.sp, // responsive font size
              textAlign: TextAlign.start,
              maxLines: null, // unlimited
              textOverflow: TextOverflow.visible, // no cutting
            ),
          ),
        ],
      ),
    );
  }
}
