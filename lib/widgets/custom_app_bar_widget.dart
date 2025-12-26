import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class CustomAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Function()? pressBack;
  final Function()? onMessageTap;
  final Function()? onNotificationTap;
  final Function()? onProfileTap;
  final bool isBack;
  final String? profileImage;
  final Color? backgroundColor;
  final List<Widget>? actionWidget;

  const CustomAppbar({
    super.key,
    required this.title,
    this.pressBack,
    this.onMessageTap,
    this.onNotificationTap,
    this.onProfileTap,
    this.isBack = true,
    this.profileImage,
    this.backgroundColor,
    this.actionWidget,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final double iconSize =
        MediaQuery
            .of(context)
            .size
            .width * 0.05; // responsive icon size
    final double circleSize = iconSize * 2.2;

    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? AppStyles.whiteColor,
      toolbarHeight: 64,
      titleSpacing: 12,
      title: Row(
        children: [
          if (isBack)
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 20),
              onPressed:
              pressBack ??
                      () {
                    HapticFeedback.mediumImpact();
                    Navigator.of(context).pop();
                  },
            ),
          isBack
              ? textBold(
            text: title.tr,
            fontSize: 20,
            fontweight: FontWeight.w500,
          )
              : Padding(
            padding: const EdgeInsets.only(left: 12),
            child: textBold(
              text: title.tr,
              fontSize: 20,
              fontweight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          if (actionWidget != null && actionWidget!.isNotEmpty)
            ...actionWidget!
          else
            Row(
              children: [
                _circleIcon(
                  image:"",
                  onTap: onMessageTap,
                  circleSize: circleSize,
                  iconSize: iconSize,
                ),
                const SizedBox(width: 8),
                _circleIcon(
                  image: "",
                  onTap: onNotificationTap,
                  circleSize: circleSize,
                  iconSize: iconSize,
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                   
                  },
                  child: ClipOval(
                    child: Image.asset(
                      width: circleSize,
                      height: circleSize,
                      "",
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _circleIcon({
    required String image,
    required double circleSize,
    required double iconSize,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(circleSize),
      child: Container(
        height: circleSize,
        width: circleSize,
        alignment: Alignment.center,
        // centers the icon inside
        decoration: BoxDecoration(
          color: AppStyles.blueCC,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          image,
          fit: BoxFit.contain,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}