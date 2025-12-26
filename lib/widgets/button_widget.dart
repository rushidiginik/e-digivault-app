import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart' show AppStyles;

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double? width, radius;
  final Color? bgColor, textColor;
  final IconData? icons;
  final double? titleSize;
  final double? height;
  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.radius,
    this.width,
    this.textColor,
    this.bgColor,
    this.icons,
    this.titleSize,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 48,
        width: width ?? size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 6),
          color: bgColor ?? AppStyles.primaryColor,
          boxShadow: [
            BoxShadow(color: AppStyles.greyDE, spreadRadius: 2, blurRadius: 16),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icons != null
                  ? Icon(
                      icons,
                      color: textColor ?? AppStyles.whiteColor,
                      size: 20,
                    )
                  : SizedBox(),
              SizedBox(width: 6),
              textSemiBold(
                text: title,
                fontSize: titleSize ?? 15,
                fontColor: textColor ?? AppStyles.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonWidgetChild extends StatelessWidget {
  final VoidCallback onTap;
  final double? width, radius;
  final Color? bgColor, textColor, borderColor;
  final String? title;
  final IconData? icons;
  final double? height;

  const ButtonWidgetChild({
    super.key,
    required this.onTap,
    this.radius,
    this.icons,
    this.borderColor,
    this.title,
    this.width,
    this.textColor,
    this.bgColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 48,
        width: width ?? size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 12),
          color: bgColor ?? AppStyles.primaryColor,
          border: Border.all(
            color: borderColor ?? AppStyles.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(color: AppStyles.greyDE, spreadRadius: 2, blurRadius: 16),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icons != null
                  ? Icon(icons, color: textColor ?? AppStyles.whiteColor)
                  : SizedBox(),
              SizedBox(width: 6),
              textSemiBold(
                text: "${title ?? ""}",
                fontSize: 16,
                fontColor: textColor ?? AppStyles.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonWidgetIconEnd extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double? width, radius;
  final Color? bgColor, textColor;
  final IconData? icons;
  final double? titleSize;
  final double? height;

  const ButtonWidgetIconEnd({
    super.key,
    required this.onTap,
    required this.title,
    this.radius,
    this.width,
    this.textColor,
    this.bgColor,
    this.icons,
    this.titleSize,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 48,
        width: width ?? size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 6),
          color: bgColor ?? AppStyles.primaryColor,
          boxShadow: [
            BoxShadow(color: AppStyles.greyDE, spreadRadius: 2, blurRadius: 16),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              textSemiBold(
                text: title,
                fontSize: titleSize ?? 15,
                fontColor: textColor ?? AppStyles.whiteColor,
              ),
              if (icons != null) ...[
                const SizedBox(width: 6),
                Icon(icons, color: textColor ?? AppStyles.whiteColor, size: 20),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
