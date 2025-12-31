import 'dart:convert';

import 'package:e_digivault_org_app/core/constants/api_url_list.dart';
import 'package:e_digivault_org_app/roles/common/login/model/login_model.dart';
import 'package:e_digivault_org_app/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String loginUrl = ApiUrlList.loginUser;
  static const String verifyOtpUrl = ApiUrlList.verifyUserOtp;

  // Updated method with optional role parameter
  Future<LoginResponseModel> sendOtp(String phone, {String? role}) async {
    try {
      debugPrint("api url is $loginUrl");

      // Build request body - add role only if provided
      Map<String, dynamic> requestBody = {"phone": phone};
      if (role != null && role.isNotEmpty) {
        requestBody["role"] = role;
        debugPrint("Sending OTP with role: $role");
      }

      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      debugPrint(
        "response in ${role != null ? 'register' : 'login'} ${response.body}",
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return LoginResponseModel.fromJson(json);
      } else {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final message = data['message'] ?? 'Something went wrong';
        AppToast.error(message, gravity: ToastGravity.TOP);
        return LoginResponseModel(
          success: false,
          message: "Request failed: ${response.statusCode}",
        );
      }
    } catch (e) {
      debugPrint("sendOtp exception: $e");
      return LoginResponseModel(
        success: false,
        message: "Error: ${e.toString()}",
      );
    }
  }

  Future<VerifyOtpModel> verifyOtp(String phone, String otp) async {
    try {
      debugPrint("Sending verifyOtp request - Phone: $phone, OTP: $otp");
      final response = await http.post(
        Uri.parse(verifyOtpUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode({"phone": phone, "otp": otp}),
      );

      debugPrint("verifyOtp status code: ${response.statusCode}");
      debugPrint("verifyOtp response body: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        debugPrint("verifyOtp response json: $json");
        return VerifyOtpModel.fromJson(json);
      } else {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final message = data['message'] ?? 'Something went wrong';
        debugPrint("verifyOtp error response: $data");
        AppToast.error(message, gravity: ToastGravity.TOP);
        return VerifyOtpModel(
          success: false,
          message: "OTP verify failed: ${response.statusCode}",
        );
      }
    } catch (e, stack) {
      debugPrint("verifyOtp exception: $e");
      debugPrintStack(stackTrace: stack);
      AppToast.error("Error: ${e.toString()}");
      return VerifyOtpModel(success: false, message: "Error: ${e.toString()}");
    }
  }
}