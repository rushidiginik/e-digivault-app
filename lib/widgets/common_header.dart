import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final VoidCallback? onBack;

  const CommonHeader({
    super.key,
    required this.title,
    this.showBack = true,
    this.onBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(101); // 53 top padding + 48 content height

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppStyles.whiteColor,
      padding: const EdgeInsets.only(right: 16, left: 16, top: 45, bottom: 8),
      child: Row(
        children: [
          if (showBack)
            GestureDetector(
              onTap: onBack ?? () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 24,
              ),
            )
          else
            const SizedBox(width: 0),
          Expanded(
            child: textMedium(
              text: title,
              fontSize: 20,
              fontColor: AppStyles.textBlack,
            ),
          ),
          _circleIconButton(
            child: SvgPicture.asset(
              ImageConst.msgIconSvg,
              height: 24,
              width: 24,
              color: AppStyles.primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          _circleIconButton(
            child: SvgPicture.asset(
              ImageConst.notiIconSvg,
              height: 24,
              width: 24,
              color: AppStyles.primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppStyles.lightBlueEB,
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                image: AssetImage(ImageConst.manProfileJPG),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIconButton({required Widget child}) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: AppStyles.lightBlueEB,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Center(child: child),
      ),
    );
  }
}
