import 'dart:async';
import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/common/login/controller/login_controller.dart';
import 'package:e_digivault_org_app/utils/alert_utils.dart';
import 'package:e_digivault_org_app/widgets/button_widget.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';
import 'package:e_digivault_org_app/widgets/loading_widget.dart';
import 'package:e_digivault_org_app/widgets/text_form_field_widget/text_form_field_const.dart';
import 'package:e_digivault_org_app/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size size;
  late AuthController authController;

  bool isLoading = false;
  int _start = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Initialize controller if not already registered
    if (!Get.isRegistered<AuthController>()) {
      Get.put(AuthController());
    }
    authController = Get.find<AuthController>();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> sendOtp() async {
    if (authController.phoneNumberController.text.length != 10) {
      AppToast.error("Please enter a valid 10-digit phone number");
      return;
    }

    setState(() => isLoading = true);

    await authController.sendOtp(authController.phoneNumberController.text);

    setState(() => isLoading = false);

    final response = authController.loginResponseModel;

    if (response != null && response.success && response.data != null) {
      authController.isOTPSenderTrue.value = false;
      startTimer();

      final otp = response.data!.otp;
      if (otp.isNotEmpty) {
        AppToast.info("OTP: $otp");
      }
    }
  }

  Future<void> verifyOtp() async {
    if (authController.otpController.text.length != 6) {
      AppToast.error("Please enter 6-digit OTP");
      return;
    }

    setState(() => isLoading = true);

    bool isSuccess = await authController.verifyOtp(
      authController.phoneNumberController.text,
      authController.otpController.text,
    );

    setState(() => isLoading = false);

    if (isSuccess) {
      _showSuccessDialog();
    }
  }

  void _showSuccessDialog() {
    AlertUtils.showDoneCompleteDialog(
      context: context,
      image: ImageConst.verifyDonePNG,
      mainTitle: "Success",
      subtitle: "Login Successful",
      size: size,
    );
  }

  Future<void> onResendCode() async {
    await authController.sendOtp(authController.phoneNumberController.text);

    final response = authController.loginResponseModel;

    if (response != null && response.success && response.data != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("OTP Resent!")));

      startTimer();

      final otp = response.data!.otp;
      if (otp.isNotEmpty) {
        AppToast.info("OTP: $otp");
      }
    }
  }

  void startTimer() {
    authController.isOtpResend.value = true;
    _start = 30;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        authController.isOtpResend.value = false;
        timer.cancel();
      } else {
        setState(() => _start--);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return SafeArea(
      top: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: AppStyles.whiteColor,
          appBar: CommonAppBarWidget(title: "", isBack: false),
          body: Obx(
            () => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _headingSection(),
                    _enterEmailPhoneSection(),
                    _resendOtpSection(),
                    _buttonSection(),
                    const SizedBox(height: 10),
                  ],
                ),
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
        textSemiBold(text: "Welcome to DigiVault", fontSize: 24),
        const SizedBox(height: 12),
        textMedium(
          text: "Secure access to your documents",
          fontSize: 16,
          fontColor: AppStyles.grey66,
        ),
      ],
    );
  }

  Widget _enterEmailPhoneSection() {
    return Column(
      children: [
        const SizedBox(height: 40),
        TextFormFieldConst(
          labelTitle: "Enter your mobile number",
          controller: authController.phoneNumberController,
          prefixIcon: Icons.perm_identity,
          type: "phone",
          hint: "9812546586",
          keyboardType: TextInputType.phone,
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        const SizedBox(height: 6),
        authController.isOTPSenderTrue.value
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 8),
                    child: textRegular(text: "Enter OTP", fontSize: 16),
                  ),
                  Pinput(
                    controller: authController.otpController,
                    length: 6,
                    focusNode: authController.otpFocusNode,
                    defaultPinTheme: PinTheme(
                      width: 46,
                      height: 46,
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppStyles.textBlack,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: AppStyles.grey66.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onCompleted: (pin) => verifyOtp(),
                  ),
                ],
              ),
      ],
    );
  }

  Widget _resendOtpSection() {
    return authController.isOTPSenderTrue.value
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                authController.isOtpResend.value
                    ? textSemiBold(text: "0:$_start", fontSize: 16)
                    : const SizedBox(),
                GestureDetector(
                  onTap: authController.isOtpResend.value
                      ? null
                      : () => onResendCode(),
                  child: textRegular(
                    text: authController.isOtpResend.value
                        ? "OTP sent successfully"
                        : "Resend Code",
                    fontSize: 12,
                    fontColor: authController.isOtpResend.value
                        ? AppStyles.greenColor87
                        : AppStyles.textBlack,
                  ),
                ),
              ],
            ),
          );
  }

  Widget _buttonSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: isLoading
          ? const CircularLoader()
          : ButtonWidget(
              onTap: authController.isOTPSenderTrue.value
                  ? () async => await sendOtp()
                  : () async => await verifyOtp(),
              title: authController.isOTPSenderTrue.value
                  ? "Send OTP"
                  : "Login",
            ),
    );
  }
}
