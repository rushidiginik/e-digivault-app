import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';


class AppFontStyle {
  static TextStyle extraBoldTextStyle(
    double fontSize, {
    Color? fontColor,
    FontWeight? fontWeight,
    bool? isUnderlined,
    bool isOtherLanguage = false,
  }) {
    return TextStyle(
      fontFamily: 'InterExtraBold',
      color: fontColor ?? AppStyles.textBlack,
      fontSize: fontSize,
      decoration:
          isUnderlined ?? false
              ? TextDecoration.underline
              : TextDecoration.none,
      fontWeight: fontWeight ?? FontWeight.w800,
      decorationThickness: 1.5,
    );
  }

  static TextStyle boldTextStyle(
    double fontSize, {
    Color? fontColor,
    FontWeight? fontWeight,
    bool? isUnderlined,
    bool isOtherLanguage = false,
  }) {
    return TextStyle(
      fontFamily: 'InterBold',
      color: fontColor ?? AppStyles.textBlack,
      fontSize: fontSize,
      decoration:
          isUnderlined ?? false
              ? TextDecoration.underline
              : TextDecoration.none,
      fontWeight: fontWeight ?? FontWeight.w700,
      decorationThickness: 1.5,
    );
  }

  static TextStyle semiBoldTextStyle(
    double fontSize, {
    Color? fontColor,
    FontWeight? fontWeight,
    bool? isUnderlined,
    bool isOtherLanguage = false,
  }) {
    return TextStyle(
      decoration:
          isUnderlined ?? false
              ? TextDecoration.underline
              : TextDecoration.none,
      fontFamily: 'InterSemiBold',
      color: fontColor ?? AppStyles.textBlack,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w600,
      decorationThickness: 1.5,
    );
  }

  static TextStyle mediumTextStyle(
    double fontSize, {
    Color? fontColor,
    FontWeight? fontWeight,
    bool? isUnderlined,
    bool isOtherLanguage = false,
  }) {
    return TextStyle(
      fontFamily: 'InterMedium',
      color: fontColor ?? AppStyles.textBlack,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w500,
      decoration:
          isUnderlined ?? false
              ? TextDecoration.underline
              : TextDecoration.none,
      decorationThickness: 1.5,
    );
  }

  static TextStyle regularTextStyle(
    double fontSize, {
    Color? fontColor,
    FontWeight? fontWeight,
    bool? isUnderlined,
    bool isOtherLanguage = false,
  }) {
    return TextStyle(
      fontFamily: 'InterRegular',
      color: fontColor ?? AppStyles.textBlack,
      fontSize: fontSize,
      decoration:
          isUnderlined ?? false
              ? TextDecoration.underline
              : TextDecoration.none,
      fontWeight: fontWeight ?? FontWeight.w400,
      decorationThickness: 1.5,
    );
  }
}
