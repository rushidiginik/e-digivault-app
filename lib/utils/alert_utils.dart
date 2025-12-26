import 'dart:ui';
import 'dart:developer';
import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/button_widget.dart';
import 'package:e_digivault_org_app/widgets/dotted_textfiled_widget.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';

class AlertUtils {
  ///  FOR SUCCESS POPUP
  static void showSuccessDialog({
    required BuildContext context,
    String title = "Success",
    required String message,
    int autoCloseSeconds = 2,
    VoidCallback? onDismiss,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // Auto close after specified seconds
        Future.delayed(Duration(seconds: autoCloseSeconds), () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
            onDismiss?.call();
          }
        });

        return Dialog(
          backgroundColor: AppStyles.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.92,
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
      },
    ).then((value) => onDismiss?.call());
  }

  ///  FOR REJECTED POPUP (AFTER REJECTION CONFIRMED)
  static void showRejectedDialog({
    required BuildContext context,
    String title = "Rejected",
    String message = "Your file E-katha has been Rejected.",
    int autoCloseSeconds = 2,
    VoidCallback? onDismiss,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // Auto close after specified seconds
        Future.delayed(Duration(seconds: autoCloseSeconds), () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
            onDismiss?.call();
          }
        });

        return Dialog(
          backgroundColor: AppStyles.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.92,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Rejected Icon Circle (RED)
                SvgPicture.asset(ImageConst.rejectIcon),
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
      },
    ).then((value) => onDismiss?.call());
  }

  ///  FOR REJECT DIALOG WITH REMARK
  static void showRejectDialog({
    required BuildContext context,
    String title = "Remark",
    String remarkText =
        "Application has been submitted to the corresponding authority waiting for the file of E-katha.",
    String buttonText = "Reject",
    VoidCallback? onReject,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: AppStyles.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: EdgeInsets.all(0),

          child: Container(
            width: MediaQuery.of(context).size.width * 0.83,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 👇 FIRST ROW - Title and Close Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textMedium(
                      text: title,
                      fontSize: 14,
                      fontColor: AppStyles.textBlack,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                        color: AppStyles.textBlack,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                /// 👇 SECOND ROW - Dotted Border Container
                CustomPaint(
                  painter: DottedBorderPainter(
                    color: AppStyles.grey66.withOpacity(0.5),
                    strokeWidth: 1,
                    dashWidth: 6.0,
                    dashSpace: 4.0,
                    borderRadius: 8.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                      bottom: 90,
                    ),
                    child: textRegular(
                      text: remarkText,
                      fontSize: 14,
                      fontColor: AppStyles.grey66,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(height: 5),

                /// 👇 THIRD ROW - Reject Button (LEFT ALIGNED)
                SizedBox(
                  width: 36.w, // Fixed width like in the image
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onReject?.call();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyles.redA5,
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: textSemiBold(
                      text: buttonText,
                      fontSize: 14,
                      fontColor: AppStyles.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showDoneCompleteDialog({
    required BuildContext context,
    required String mainTitle,
    required String subtitle,
    required String image,
    required Size size,
    Widget? headingChild,
    VoidCallback? onTap,
    int autoCloseSeconds = 2,
  }) {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(Duration(seconds: autoCloseSeconds), () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        });
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            backgroundColor: AppStyles.transparent,
            content: StatefulBuilder(
              builder: (context, setState) {
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    /// 👇 MAIN DIALOG UI
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppStyles.whiteColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(image, width: 70, height: 70),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04,
                              ),
                              child: textSemiBold(
                                text: mainTitle,
                                fontSize: 22,
                                fontColor: AppStyles.textBlack,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            headingChild ??
                                textRegular(
                                  text: subtitle,
                                  fontSize: 18,
                                  fontColor: AppStyles.grey66,
                                  textAlign: TextAlign.center,
                                ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppStyles.primaryColor.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("", height: 15, width: 20),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            // content: StatefulBuilder(
            //   builder: (context, setState) {
            //     return Container(
            //       height: MediaQuery.of(context).size.height * 0.25,
            //       width: MediaQuery.of(context).size.width * 0.9,
            //       decoration: BoxDecoration(
            //         color: AppStyles.whiteColor,
            //         borderRadius: BorderRadius.circular(20.0),
            //       ),
            //       padding: const EdgeInsets.all(18.0),
            //       child: Center(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Container(
            //               color: AppStyles.transparent,
            //               child: Image.asset(
            //                 image,
            //                 width: 70,
            //                 height: 70,
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //             Padding(
            //               padding: EdgeInsets.symmetric(
            //                 horizontal: size.width * 0.04,
            //               ),
            //               child: textSemiBold(
            //                 text: mainTitle.tr(),
            //                 fontSize: 22,
            //                 fontColor: AppStyles.textBlack,
            //                 textAlign: TextAlign.center,
            //               ),
            //             ),
            //             headingChild ??
            //                 textRegular(
            //                   text: subtitle.tr(),
            //                   fontSize: 18,
            //                   fontColor: AppStyles.grey66,
            //                   textAlign: TextAlign.center,
            //                 ),
            //             SizedBox(height: 20),

            //           ],
            //         ),
            //       ),

            //     );

            //   },

            // ),
          ),
        );
      },
    ).then((value) => log('Dialogue dismissed'));
  }

  Widget dialogCloseButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, top: 8),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: AppStyles.primaryColor.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Center(child: Image.asset("", height: 15, width: 20)),
        ),
      ),
    );
  }

  static Future<void> showDoneCompleteDialogwithblack({
    required BuildContext context,
    required String subtitle,
    required String image,
    required Size size,
    Widget? headingChild,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        // 🔥 AUTO CLOSE AFTER 2 SECONDS
        Future.delayed(const Duration(seconds: 2), () {
          if (Navigator.of(dialogContext).canPop()) {
            Navigator.of(dialogContext).pop();
          }
        });

        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(horizontal: 6.w),
            contentPadding: EdgeInsets.zero,
            content: Container(
              width: size.width * 0.8,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppStyles.whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// 🔹 CLOSE ICON
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.of(dialogContext).pop(),
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          color: AppStyles.primaryColor.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset("", height: 16, width: 16),
                      ),
                    ),
                  ),

                  SizedBox(height: 1.h),

                  /// 🔹 IMAGE
                  Image.asset(image, height: 70, fit: BoxFit.contain),

                  SizedBox(height: 1.5.h),

                  /// 🔹 TEXT
                  headingChild ??
                      textSemiBold(
                        text: subtitle,
                        fontSize: 16.sp,
                        fontColor: AppStyles.black,
                        textAlign: TextAlign.center,
                      ),

                  SizedBox(height: 1.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void showTextButtonDialog({
    required BuildContext context,
    required Widget child,
  }) {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: true,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            backgroundColor: AppStyles.transparent,
            content: StatefulBuilder(
              builder: (context, setState) {
                return IntrinsicHeight(
                  child: Container(
                    // height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: AppStyles.whiteColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.all(18.0),
                    child: Center(child: child),
                  ),
                );
              },
            ),
          ),
        );
      },
    ).then((value) => log('Dialogue dismissed'));
  }

  static void showaApproveRejectDialog({
    required BuildContext context,
    required Color bgColor,
    required Widget? icons,
    required String title,
    required String subtitle,
    required String subtitle1,
    required String buttonTitle,
    required Size size,
    required VoidCallback onTap,
  }) {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: true,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            backgroundColor: AppStyles.transparent,
            content: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: AppStyles.whiteColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 10),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: bgColor,
                                ),
                                child: icons,
                              ),
                              SizedBox(height: 20),
                              textSemiBold(
                                text: title,
                                fontSize: 22,
                                fontColor: AppStyles.black1A,
                              ),
                              SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  textMedium(
                                    text: subtitle,
                                    fontSize: 16,
                                    fontColor: AppStyles.grey66,
                                  ),
                                  SizedBox(height: 5),
                                  textMedium(
                                    text: subtitle1,
                                    fontSize: 16,
                                    fontColor: AppStyles.grey66,
                                  ),
                                ],
                              ),
                              // SizedBox(height: 25,),
                              ButtonWidget(
                                onTap: onTap,
                                title: buttonTitle,
                                width: size.width * 0.30,
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0, top: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppStyles.primaryColor.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset("", height: 15, width: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    ).then((value) => log('Dialogue dismissed'));
  }

  static void showCommonDialog({
    required BuildContext context,
    required Size size,
    required String hintText,

    required VoidCallback onTap,
    TextEditingController? controller,
    required String title,
    String buttonTitle = "Send",
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppStyles.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Close icon
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        color: AppStyles.primaryColor.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("", height: 15, width: 20),
                    ),
                  ),
                ),

                const SizedBox(height: 15),
                DottedTextField(
                  title: title,
                  controller: controller,
                  hintText: hintText,
                  maxLines: 4,
                ),

                const SizedBox(height: 24),

                /// Button
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ButtonWidget(
                    title: buttonTitle,
                    width: size.width * 0.35,
                    onTap: onTap,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //  static void showCommonDialog({
  //   required BuildContext context,
  //   required Size size,
  //   required VoidCallback onTap,
  //   TextEditingController? controller,
  //   String buttonTitle = "Send", // 👈 default
  // }) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (context) {
  //       return BackdropFilter(
  //         filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
  //         child: AlertDialog(
  //           backgroundColor: Colors.transparent,
  //           insetPadding: EdgeInsets.zero,
  //           contentPadding: EdgeInsets.zero,
  //           content: Container(
  //             width: size.width * 0.9,
  //             decoration: BoxDecoration(
  //               color: AppStyles.whiteColor,
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //             child: Stack(
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.fromLTRB(24, 30, 24, 24),
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       textSemiBold(
  //                         text: "Remark",
  //                         fontSize: 20,
  //                         fontColor: AppStyles.black,
  //                       ),

  //                       const SizedBox(height: 14),

  //                       Container(
  //                         padding: const EdgeInsets.all(12),
  //                         decoration: BoxDecoration(
  //                           border: Border.all(color: AppStyles.grey66),
  //                           borderRadius: BorderRadius.circular(12),
  //                         ),
  //                         child: TextField(
  //                           controller: controller,
  //                           maxLines: 3,
  //                           decoration: const InputDecoration(
  //                             border: InputBorder.none,
  //                             hintText:
  //                                 "Legal Opinion is not satisfactory.",
  //                           ),
  //                         ),
  //                       ),

  //                       const SizedBox(height: 24),

  //                       ButtonWidget(
  //                         title: buttonTitle,
  //                         width: size.width * 0.30,
  //                         onTap: onTap,
  //                       ),
  //                     ],
  //                   ),
  //                 ),

  //                 Positioned(
  //                   right: 12,
  //                   top: 12,
  //                   child: GestureDetector(
  //                     onTap: () => Navigator.pop(context),
  //                     child: Container(
  //                       height: 36,
  //                       width: 36,
  //                       decoration: BoxDecoration(
  //                         color:
  //                             AppStyles.primaryColor.withOpacity(0.15),
  //                         shape: BoxShape.circle,
  //                       ),
  //                       child: Icon(
  //                         Icons.close,
  //                         size: 20,
  //                         color: AppStyles.primaryColor,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  static void showGapAnalysisDialog({
    required BuildContext context,
    required Color bgColor,
    required Widget icons,
    required String title,
    required String subtitle,
    required String subtitle1,
    required String buttonTitle,
    required Size size,
    required VoidCallback onTap,
  }) {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: true,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            backgroundColor: AppStyles.transparent,
            content: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: AppStyles.whiteColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 20),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: bgColor,
                                ),
                                child: icons,
                              ),
                              SizedBox(height: 12),
                              textSemiBold(text: title, fontSize: 22),
                              SizedBox(height: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  textMedium(
                                    text: subtitle,
                                    fontSize: 16,
                                    fontColor: AppStyles.grey66,
                                  ),
                                  SizedBox(height: 4),
                                  textMedium(
                                    text: subtitle1,
                                    fontSize: 16,
                                    fontColor: AppStyles.grey66,
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              ButtonWidget(
                                onTap: onTap,
                                title: buttonTitle,
                                width: size.width * 0.30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0, top: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppStyles.primaryColor.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: AppStyles.primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    ).then((value) => log('Dialogue dismissed'));
  }

  static void showDoneCompleteWithDetailsListDialog({
    required BuildContext context,
    required List<String> titleList,
    required List<String> valueList,
    required String image,
    required Size size,
  }) {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: true,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            backgroundColor: AppStyles.transparent,
            content: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: AppStyles.whiteColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // padding: const EdgeInsets.all(18.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: size.width,
                            height: size.height * 0.13,
                            decoration: BoxDecoration(
                              color: AppStyles.greyF5,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.32,
                                vertical: size.height * 0.02,
                              ),
                              child: Container(
                                color: AppStyles.transparent,
                                child: Image.asset(
                                  image,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.fill,
                                  color: AppStyles.green2E,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: titleList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: SizedBox(
                                height: 30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textRegular(
                                      text: titleList[index],
                                      fontSize: 13,
                                    ),
                                    textBold(
                                      text: valueList[index],
                                      fontSize: 13,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        Divider(height: 0, color: AppStyles.greyF5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Container(
                                width: size.width * 0.28,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppStyles.lightGreenBC.withOpacity(
                                    0.4,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.offline_share,
                                      color: AppStyles.green2E,
                                    ),
                                    SizedBox(width: 8),
                                    textSemiBold(
                                      text: "share",
                                      fontSize: 12,
                                      fontColor: AppStyles.green2E,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    ).then((value) => log('Dialogue dismissed'));
  }

  static void showChooseUploadDocDialog({
    required BuildContext context,
    required Size size,
    required VoidCallback onChooseFileTap,
    required VoidCallback onCaptureFileTap,
  }) {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: true,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            backgroundColor: AppStyles.transparent,
            content: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: AppStyles.whiteColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.all(18.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.upload_file,
                                    color: AppStyles.primaryColor,
                                    size: 30,
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textMedium(
                                        text: "upload_files",
                                        fontSize: 14,
                                      ),
                                      textRegular(
                                        text: "select_an_upload_the_file",
                                        fontSize: 12,
                                        fontColor: AppStyles.grey66,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.close_outlined,
                                  color: AppStyles.textBlack,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DottedBorder(
                          color: AppStyles.black33,
                          strokeWidth: 1,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          dashPattern: const [6, 3],
                          child: Container(
                            width: size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 12),
                                Icon(
                                  Icons.upload_file,
                                  color: AppStyles.primaryColor,
                                  size: 22,
                                ),
                                SizedBox(height: 8),
                                textSemiBold(
                                  text: "choose_file_template",
                                  fontSize: 14,
                                ),
                                SizedBox(height: 3),
                                textRegular(
                                  text: "jpg_png_pdf_format",
                                  fontSize: 12,
                                  fontColor: AppStyles.grey66,
                                ),
                                SizedBox(height: 16),
                                ButtonWidgetChild(
                                  onTap: () {
                                    // Navigator.pushNamed(context, NavigatorConst.clientChooseTemplateScreen);
                                  },
                                  title: "choose_template",
                                  icons: Icons.dashboard,
                                  width: size.width * 0.50,
                                  bgColor: AppStyles.whiteColor,
                                  textColor: AppStyles.black33,
                                  borderColor: AppStyles.primaryColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ButtonWidgetChild(
                                        onTap: () {
                                          onChooseFileTap();
                                          Navigator.of(context).pop();
                                        },
                                        title: "choose_file",
                                        width: size.width * 0.34,
                                        bgColor: AppStyles.whiteColor,
                                        textColor: AppStyles.textBlack,
                                        borderColor: AppStyles.grey66,
                                      ),
                                      ButtonWidget(
                                        onTap: () {
                                          onCaptureFileTap();
                                          Navigator.of(context).pop();
                                        },
                                        title: "capture_file",
                                        width: size.width * 0.34,
                                        radius: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    ).then((value) => log('Dialogue dismissed'));
  }
}

// Create this custom widget in your utils or widgets folder:
class DottedBorderContainer extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final double borderWidth;
  final double dashWidth;
  final double dashSpace;
  final double borderRadius;

  const DottedBorderContainer({
    Key? key,
    required this.child,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    this.dashWidth = 6.0,
    this.dashSpace = 4.0,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(
        color: borderColor,
        strokeWidth: borderWidth,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
        borderRadius: borderRadius,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: 90,
        ),
        child: child,
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double borderRadius;

  DottedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(borderRadius),
        ),
      );

    _drawDashedPath(canvas, path, paint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    final dashPath = Path();
    double distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        final nextDistance = distance + dashWidth;
        final extractPath = pathMetric.extractPath(
          distance,
          nextDistance > pathMetric.length ? pathMetric.length : nextDistance,
        );
        dashPath.addPath(extractPath, Offset.zero);
        distance = nextDistance + dashSpace;
      }
      distance = 0.0;
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
