import 'dart:async';

import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/common/login/controller/login_controller.dart';
import 'package:e_digivault_org_app/widgets/button_widget.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';
import 'package:e_digivault_org_app/widgets/common_textfield.dart';
import 'package:e_digivault_org_app/widgets/loading_widget.dart';
import 'package:e_digivault_org_app/widgets/resend_otp_timer_widget.dart';
import 'package:e_digivault_org_app/widgets/toast_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.put(AuthController(), permanent: true);
  late Size size;
  bool phoneHasError = false;
  String? phoneErrorText;

  int _start = 180; // countdown seconds
  Timer? _timer;
  bool isOtpResend = false;

  bool otpSend = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  void onResendCode() {
    startTimer();
  }

  void startTimer() {
    setState(() {
      isOtpResend = true;
      _start = 180; // reset timer
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          isOtpResend = false;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  Future<void> sendOtp() async {
    final phone = authController.phoneNumberController.text;

    // ---------- FRONTEND VALIDATION ----------

    if (phone.length != 10) {
      authController.phoneFocusNode.unfocus();

      const msg = "Please enter a valid 10-digit Indian mobile number";

      setState(() {
        phoneHasError = true;
        phoneErrorText = msg;
      });

      // AppToast.error(msg);
      return;
    }

    setState(() {
      phoneHasError = false;
      phoneErrorText = null;
    });

    authController.phoneFocusNode.unfocus();
    await authController.sendOtp(phone);

    final response = authController.loginResponseModel;

    // number not registered / api failed
    if (response == null || response.success == false) {
      const msg = "Mobile number not registered";

      // TextField ke niche
      setState(() {
        phoneHasError = true;
        phoneErrorText = msg;
      });

      // Toast me SAME message
      // AppToast.error(msg);
      return;
    }

    // ---------- OTP SUCCESS ----------
    if (response.otp!.isNotEmpty) {
      setState(() {
        authController.isOTPSenderTrue.value = false;
      });

      Fluttertoast.showToast(timeInSecForIosWeb: 3, msg: "OTP ${response.otp!}");
    }
  }

  Future<void> verifyOtp() async {
    if (authController.otpController.text.length != 6) {
      AppToast.error("Please enter 6-digit OTP");
      return;
    }

    bool isSuccess = await authController.verifyOtp(authController.phoneNumberController.text, authController.otpController.text);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonAppBarWidget(title: "", allPadding: 20, isBack: false),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 12, right: 12.0),
              child: Column(
                children: [
                  _headingSection(),

                  _enterEmailPhoneSection(),
                  GetBuilder<AuthController>(
                    builder: (controller) {
                      return controller.isOTPSenderTrue.value ? const SizedBox() : _resendOtpSection();
                    },
                  ),

                  _buttonSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _headingSection() {
    return Column(
      children: [
        textSemiBold(text: "Welcome to e-DigiVault", fontSize: 24),

        textMedium(text: "Secure Access to Documents", fontSize: 16, fontColor: AppStyles.grey66),
      ],
    );
  }

  Widget _enterEmailPhoneSection() {
    return Column(
      children: [
        TextFormFieldConst(
          focusNode: authController.phoneFocusNode,
          labelTitle: "Enter Your Mobile Number",
          controller: authController.phoneNumberController,
          isPrefixIcon: Icons.perm_identity,
          type: "phone",
          hint: "9812546586",
          inputFormatters: [LengthLimitingTextInputFormatter(10)],

          hasError: phoneHasError,
          errorText: phoneErrorText,

          keyboardType: TextInputType.phone,

          onChanged: (value) {
            if (phoneHasError) {
              setState(() {
                phoneHasError = false;
                phoneErrorText = null;
              });
            }
          },

          onFieldSubmitted: (String value) async {
            await sendOtp();
          },
        ),
        SizedBox(height: 6),
      ],
    );
  }

  Widget _resendOtpSection() {
    return Column(
      children: [
        SizedBox(height: 2.h),
        Align(
          alignment: Alignment.topLeft,
          child: textRegular(text: "Enter OTP", fontSize: 16, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 2.h),
        Pinput(
          length: 6,
          controller: authController.otpController,
          defaultPinTheme: PinTheme(
            width: 15.w,
            height: 7.h,
            textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
          ),
          focusedPinTheme: PinTheme(
            width: 15.w,
            height: 7.h,
            textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppStyles.primaryColor, width: 2),
            ),
          ),
          onCompleted: (value) {},
        ),

        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ResendOtpTimerWidget(
              seconds: 180,
              onResend: () {
                sendOtp();
              },
              activeColor: AppStyles.textBlack,
              inactiveColor: AppStyles.greenColor87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Column(
        children: [
          SizedBox(height: 2.h),
          Obx(
            () => authController.isOtpResend.value || authController.isVerifyOtpLoading.value
                ? Container(height: 30, width: 30, child: CircularLoader())
                : GestureDetector(
                    onTap: () async {
                      authController.isOTPSenderTrue.value ? await sendOtp() : await verifyOtp();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      alignment: Alignment.center,

                      decoration: BoxDecoration(color: AppStyles.primaryColor, borderRadius: BorderRadius.circular(4)),
                      child: textRegular(text: authController.isOTPSenderTrue.value ? "Send OTP" : "Login", fontSize: 14, fontColor: AppStyles.whiteColor),
                    ),
                  ),
          ),
          SizedBox(height: 6.h),
        ],
      ),
    );
  }
}
