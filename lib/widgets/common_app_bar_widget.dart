
import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CommonAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String? backImage;
  final String? actionIcon;
  final Function()? pressBack;
  final Function()? pressSkip;
  final String? selectedAccount;
  final Color? backgroundColor, iconColor;
  final List<Widget>? actionWidget;
  final bool isBack;
  final Widget? bottom;
  final double? preferredSize1, allPadding, leadingWidth;
  final bool centerTitle;

  const CommonAppBarWidget({
    required this.title,
    this.backImage,
    this.pressBack,
    this.actionIcon,
    this.pressSkip,
    this.selectedAccount,
    this.backgroundColor,
    this.iconColor,
    this.actionWidget,
    this.isBack = true,
    this.bottom,
    this.preferredSize1,
    this.allPadding,
    this.centerTitle = true,
    this.leadingWidth,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize =>
      Size.fromHeight(preferredSize1 ?? (bottom != null ? 120 : 60));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppStyles.whiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: centerTitle,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 40,
      leadingWidth: leadingWidth,
      backgroundColor: backgroundColor ?? AppStyles.whiteColor,
      leading:
          isBack == true
              ? Padding(
                padding: EdgeInsets.all(allPadding ?? 2.0),
                child: InkWell(
                  onTap:
                      pressBack ??
                      () {
                        try {
                          HapticFeedback.mediumImpact();
                          Navigator.of(context).pop();
                          FocusScope.of(context).unfocus();
                        } catch (e) {
                          print(e);
                        }
                      },
                  splashColor: AppStyles.splashEffectColor,
                  borderRadius: BorderRadius.circular(50.0),
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 20,
                  ), //Image.asset(ImageConst.backIconPNG),
                ),
              )
              : SizedBox(),
      title: textBold(text: title, fontSize: 20),

      bottom:
          bottom != null
              ? PreferredSize(
                preferredSize: const Size.fromHeight(
                  60,
                ), 
                child: bottom!,
              )
              : null,
      actions: actionWidget ?? [],
    );
  }
}