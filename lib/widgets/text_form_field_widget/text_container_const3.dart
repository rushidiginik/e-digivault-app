import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TextContainerConst3 extends StatefulWidget {
  final String labelTitle, value;
  final double? width;

  const TextContainerConst3({
    super.key,
    required this.labelTitle,
    required this.value,
    this.width,
  });

  @override
  State<TextContainerConst3> createState() => _TextContainerConst3State();
}

class _TextContainerConst3State extends State<TextContainerConst3> {
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
              fontSize: 12.sp,
              fontColor: AppStyles.black1A,
              // responsive font size
            ),
          ),

          /// Value container (auto height)
          Container(
            width: widget.width ?? 90.w, // responsive width
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
            decoration: BoxDecoration(
              color: AppStyles.whiteColor,
              borderRadius: BorderRadius.circular(1.5.w), // responsive radius
              border: Border.all(color: AppStyles.greyDE),
            ),
            child: textRegular(
              text: widget.value,
              fontSize: 12.sp, // responsive font size
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
