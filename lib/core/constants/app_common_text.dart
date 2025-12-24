import 'app_text_styles.dart';
import 'package:flutter/material.dart';

Widget textBold({
  required String text,
  required double fontSize,
  bool isNotLanguageConvert = false,
  Color? fontColor,
  TextAlign? textAlign,
  bool? isUnderlined,
  TextOverflow? textOverflow,
  int? maxLines,
  FontWeight? fontweight,
}) {
  return Text(
    text,
    // isNotLanguageConvert ? text :text.tr(),
    style: AppFontStyle.boldTextStyle(
      fontSize,
      fontWeight: fontweight,
      fontColor: fontColor,
      isUnderlined: isUnderlined,
    ),
    textAlign: textAlign ?? TextAlign.start,
    overflow: textOverflow,
    maxLines: maxLines,
  );
}

Widget textExtraBold({
  required String text,
  required double fontSize,
  bool isNotLanguageConvert = false,
  Color? fontColor,
  TextAlign? textAlign,
  bool? isUnderlined,
  TextOverflow? textOverflow,
}) {
  return Text(
    text,
    // isNotLanguageConvert ? text :text.tr(),
    style: AppFontStyle.extraBoldTextStyle(
      fontSize,
      fontColor: fontColor,
      isUnderlined: isUnderlined,
    ),
    textAlign: textAlign ?? TextAlign.start,
    overflow: textOverflow,
  );
}

Widget textSemiBold({
  required String text,
  required double fontSize,
  bool isNotLanguageConvert = false,
  Color? fontColor,
  TextAlign? textAlign,
  bool? isUnderlined,
  TextOverflow? textOverflow,
  int? maxLines,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    // isNotLanguageConvert ? text :text.tr(),
    style: AppFontStyle.semiBoldTextStyle(
      fontSize,
      fontColor: fontColor,
      fontWeight: fontWeight,
      isUnderlined: isUnderlined,
    ),
    textAlign: textAlign ?? TextAlign.start,
    overflow: textOverflow,
    maxLines: maxLines,
  );
}

Widget textMedium({
  required String text,
  required double fontSize,
  bool isNotLanguageConvert = false,
  Color? fontColor,
  TextAlign? textAlign,
  bool? isUnderlined,
  TextOverflow? textOverflow,
  int? maxLines,
}) {
  return Text(
    text,
    // isNotLanguageConvert ? text :text.tr(),
    style: AppFontStyle.mediumTextStyle(
      fontSize,
      fontColor: fontColor,
      isUnderlined: isUnderlined,
      fontWeight: FontWeight.w500,
    ),
    textAlign: textAlign ?? TextAlign.start,
    maxLines: maxLines,
    overflow: textOverflow,
  );
}

Widget textRegular({
  required String text,
  required double fontSize,
  bool isNotLanguageConvert = false,
  Color? fontColor,
  bool? softWrap,
  TextAlign? textAlign,
  bool? isUnderlined,
  TextOverflow? textOverflow,
  int? maxLines,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    // isNotLanguageConvert ? text :text.tr(),
    style: AppFontStyle.regularTextStyle(
      fontSize,
      
      fontColor: fontColor,
      isUnderlined: isUnderlined,
      fontWeight: fontWeight,
      
    ),
    textHeightBehavior: TextHeightBehavior(
      applyHeightToFirstAscent: false,
      applyHeightToLastDescent: false,
    ),
    textAlign: textAlign ?? TextAlign.start,
    overflow: textOverflow,
    softWrap: softWrap,
    maxLines: maxLines,
    
  );
}
