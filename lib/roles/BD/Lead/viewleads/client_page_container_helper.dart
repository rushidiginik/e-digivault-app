import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ClientPageContainerHelper extends StatelessWidget {
  final VoidCallback onTap;
  final Color? bgColor, fontColor, bgFColor;
  final String title,
      subTitle,
      thirdTitle,
      thirdValue,
      forthTitle,
      forthSubTitle;
  final bool isForthContainerShow;
  final Widget? child;
  final double? horizontalPadding;

  const ClientPageContainerHelper({
    super.key,
    required this.onTap,
    this.bgColor,
    this.fontColor,
    this.bgFColor,
    required this.title,
    required this.subTitle,
    required this.thirdTitle,
    required this.thirdValue,
    required this.forthTitle,
    required this.forthSubTitle,
    this.child,
    this.horizontalPadding,
    this.isForthContainerShow = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textColor = fontColor ?? AppStyles.black33;

    return Padding(
      padding: EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 18),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: bgColor ?? AppStyles.whiteColor,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.20),
                offset: const Offset(1, 1),
                blurRadius: 1,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.20),
                offset: const Offset(-1, -1),
                blurRadius: 1,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 22,
              bottom: 22,
              left: 22,
              right: 6,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 114,
                  height: 104,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(102),
                    image: const DecorationImage(
                      image: AssetImage(ImageConst.manProfileJPG),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(width: 26),

                // Right Text Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      textExtraBold(
                        text: title,
                        fontSize: 14,
                        fontColor: textColor,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),

                      // Subtitle
                      textSemiBold(
                        text: subTitle,
                        fontSize: 12,
                        fontColor: textColor,
                        textOverflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 6),

                      // Third row
                      Row(
                        children: [
                          Flexible(
                            child: textRegular(
                              text: thirdTitle,
                              fontSize: 14.sp,
                              fontColor: textColor,
                              textOverflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: textRegular(
                              text: thirdValue,
                              fontSize: 14.sp,
                              fontColor: AppStyles.primaryColor,
                              textOverflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      // Fourth row
                      Row(
                        children: [
                          Flexible(
                            child: textRegular(
                              text: forthTitle,
                              fontSize: 14.sp,
                              fontColor: textColor,
                              textOverflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          isForthContainerShow
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppStyles.lightPurpleF8,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 1,
                                  ),
                                  child: textSemiBold(
                                    text: forthSubTitle,
                                    fontSize: 14.sp,
                                    fontColor: bgFColor ?? AppStyles.purple6F,
                                    textOverflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )
                              : Flexible(
                                  child: textRegular(
                                    text: forthSubTitle,
                                    fontSize: 14.sp,
                                    fontColor: textColor,
                                    textOverflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                        ],
                      ),

                      if (child != null) ...[const SizedBox(height: 4), child!],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
