import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  AppToast(String s);

  static void show(
    String message, {
    Color backgroundColor = Colors.black,
    ToastGravity? gravity, //  Nullable gravity param
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM, //  Default if null
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  static void success(String message, {ToastGravity? gravity}) {
    Fluttertoast.showToast(
      msg: "✔ $message",
      toastLength: Toast.LENGTH_SHORT,

      gravity: gravity,
      backgroundColor: AppStyles.green2E,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  static void error(String message, {ToastGravity? gravity}) {
    show(message, backgroundColor: AppStyles.redColorC6, gravity: gravity);
  }

  static void info(String message, {ToastGravity? gravity}) {
    show(message, backgroundColor: AppStyles.black33, gravity: gravity);
  }
}
