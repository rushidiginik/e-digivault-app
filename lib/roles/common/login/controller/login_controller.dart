import 'package:e_digivault_org_app/roles/common/login/controller/login_service.dart';
import 'package:e_digivault_org_app/roles/common/login/model/login_model.dart';
import 'package:e_digivault_org_app/roles/role_maneger/role_manager.dart';
import 'package:e_digivault_org_app/routes/app_routes.dart';
import 'package:e_digivault_org_app/utils/app_storage.dart';
import 'package:e_digivault_org_app/widgets/toast_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class AuthController extends GetxController {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode otpFocusNode = FocusNode();
  AuthService _service = AuthService();

  RxBool isOtpResend = false.obs;
  RxBool isOTPSenderTrue = true.obs;
  RxBool isSendOtp = false.obs;
  // bool isOtpResend = false;

  RxBool isVerifyOtpLoading = false.obs;
  LoginResponseModel? loginResponseModel;
  VerifyOtpModel? verifyOtpData;
  // bool isOTPSenderTrue = true;

  Future<void> sendOtp(String phone) async {
    try {
      isOtpResend.value = true;
      update();

      final response = await _service.sendOtp(phone);
      loginResponseModel = response;

      if (response.success) {
        debugPrint("Success: ${response.message}");
      } else {
        debugPrint(" Response error: ${response.message}");
        AppToast.error(response.message);
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      AppToast.error("An unexpected error occurred");
    } finally {
      isOtpResend.value = false;
      update();
    }
  }

  Future<bool> verifyOtp(String phone, String otp) async {
    try {
      debugPrint("Verifying OTP for phone: $phone with OTP: $otp");
      isVerifyOtpLoading.value = true;
      update();

      final VerifyOtpModel response = await _service.verifyOtp(phone, otp);
      verifyOtpData = response;

      debugPrint("Verify OTP Response: $response");

      if (response.success && response.data != null) {
        final data = response.data!;
        final employee = data.employee;

        // ✅ Store tokens
        await AppStorage.setAuthToken(data.accessToken);
        await AppStorage.setRefreshToken(data.refreshToken);

        // ✅ Store user info
        await AppStorage.setUserId(employee.id);
        await AppStorage.setPhoneNumber(employee.phone);
        await AppStorage.setRole(employee.role);
        await AppStorage.setUserName(employee.name);

        // ✅ Store profile image ONLY if exists
        // if (employee.profileImage != null &&
        //     employee.profileImage!.isNotEmpty) {
        //   await AppStorage.setProfileImage(employee.profileImage!);
        // }

        debugPrint("access token ${data.accessToken}");
        debugPrint("refresh token ${data.refreshToken}");
        debugPrint("userId ${employee.id}");
        debugPrint("API role: ${employee.role}");

        // Convert API role string to UserRole enum
        final userRole = UserRole.fromApiString(employee.role);

        if (userRole != null) {
          _navigateToDashboard(userRole);
          debugPrint("Success: ${response.message}");
          return true;
        } else {
          debugPrint("Invalid role received from API: ${employee.role}");
          AppToast.error("Invalid user role", gravity: ToastGravity.TOP);
          return false;
        }
      } else {
        debugPrint("Response error: ${response.message}");
        AppToast.error(response.message, gravity: ToastGravity.TOP);
        return false;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      AppToast.error("An unexpected error occurred", gravity: ToastGravity.TOP);
      return false;
    } finally {
      isVerifyOtpLoading.value = false;
      update();
    }
  }

  void _navigateToDashboard(UserRole role) {
    print("Role Checking Login:$role");
    switch (role) {
      case UserRole.businessDevelopment:
        router.go('/bd_dashboard_screen');
        break;
      case UserRole.stateHead:
        // Get.offAllNamed(NavigatorConst.stateHeadDashboard);
        break;
      case UserRole.regionalManager:
        // Get.offAllNamed(NavigatorConst.regionalManagerDashboard);
        break;
      case UserRole.incharge:
        // Get.offAllNamed(NavigatorConst.inchargeDashboard);
        break;
      case UserRole.marketReaserchAnalyst:
        router.go('/home_page_mra_screen');

        break;

      case UserRole.advocate:
        // Get.offAllNamed(NavigatorConst.legalHeadDashboard);
        break;
      case UserRole.accountant:
        // Get.offAllNamed(NavigatorConst.accountsDashboard);
        break;
    }
  }

  // Registration OTP Method - calls same service with role
  Future<void> registerSendOtp(String phone, String role) async {
    try {
      isOtpResend.value = true;
      update();

      final LoginResponseModel response = await _service.sendOtp(
        phone,
        role: role,
      );
      loginResponseModel = response;

      if (response.success && response.data != null) {
        debugPrint("Registration OTP Success: ${response.message}");

        final otp = response.data!.otp;
        if (otp.isNotEmpty) {
          AppToast.info("OTP: $otp");
        }
      } else {
        debugPrint("Registration OTP error: ${response.message}");
        AppToast.error(response.message);
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      AppToast.error("An unexpected error occurred");
    } finally {
      isOtpResend.value = false;
      update();
    }
  }

  Future<bool> registerVerifyOtp(String phone, String otp, String role) async {
    try {
      debugPrint(
        "Verifying Registration OTP for phone: $phone, role: $role with OTP: $otp",
      );
      isVerifyOtpLoading.value = true;
      update();

      final VerifyOtpModel response = await _service.verifyOtp(phone, otp);
      verifyOtpData = response;

      debugPrint("Register Verify OTP Response: $response");

      if (response.success && response.data != null) {
        final data = response.data!;
        final employee = data.employee;

        // ✅ Store tokens
        await AppStorage.setAuthToken(data.accessToken);
        await AppStorage.setRefreshToken(data.refreshToken);

        // ✅ Store user info
        await AppStorage.setUserId(employee.id);
        await AppStorage.setPhoneNumber(employee.phone);
        await AppStorage.setRole(employee.role);
        await AppStorage.setUserName(employee.name);

        debugPrint("Registration access token: ${data.accessToken}");
        debugPrint("Registration refresh token: ${data.refreshToken}");
        debugPrint("Registration userId: ${employee.id}");
        debugPrint("Registration API role: ${employee.role}");

        debugPrint("Registration Success: ${response.message}");
        return true;
      } else {
        debugPrint("Registration OTP error: ${response.message}");
        AppToast.error(response.message, gravity: ToastGravity.TOP);
        return false;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      debugPrint("Registration OTP exception details: $e");
      AppToast.error("An unexpected error occurred", gravity: ToastGravity.TOP);
      return false;
    } finally {
      isVerifyOtpLoading.value = false;
      update();
    }
  }
}
