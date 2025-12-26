import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class SuccessPopup extends StatelessWidget {
  final String title;
  final String message;

  const SuccessPopup({
    super.key,
    this.title = "Success",
    this.message = "Operation completed successfully.",
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: AppStyles.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      //insetPadding: const EdgeInsets.symmetric(vertical: 40, horizontal: 23),
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: width * 0.92,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Icon Circle
            SvgPicture.asset(ImageConst.successIcon),
            const SizedBox(height: 24),
            textSemiBold(text: title, fontSize: 20),
            const SizedBox(height: 16),
            textRegular(
              text: message,
              fontSize: 16.sp,
              fontColor: AppStyles.grey66,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
