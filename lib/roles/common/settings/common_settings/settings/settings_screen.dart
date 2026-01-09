import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/common/login/controller/login_controller.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/settings/controller/settings_controller.dart';
import 'package:e_digivault_org_app/utils/alert_utils.dart';
import 'package:e_digivault_org_app/utils/app_storage.dart';
import 'package:e_digivault_org_app/widgets/bottom_navigation_bar_mra.dart';
import 'package:e_digivault_org_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String userName = "Guest";
  String? profileImageUrl;
  late Size size;
  final TextEditingController controller = TextEditingController();

  late SettingsController settingsController;
  late AuthController authController;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();

    // Initialize controllers safely
    settingsController = Get.put(SettingsController());

    try {
      authController = Get.find<AuthController>();
    } catch (e) {
      authController = Get.put(AuthController());
    }

    settingsController.initUserSettings();
    settingsController.getFaqList();
  }

  void _loadUserProfile() {
    setState(() {
      userName = AppStorage.userName ?? "Guest";
      profileImageUrl = AppStorage.profileImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBarMra(),
      backgroundColor: AppStyles.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  ImageConst.settingBgPNG,
                  fit: BoxFit.fill,
                  height: size.height * 0.30,
                  width: size.width,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 40),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage:
                          profileImageUrl != null && profileImageUrl!.isNotEmpty
                          ? CachedNetworkImageProvider(profileImageUrl!)
                          : null,
                      child: profileImageUrl == null || profileImageUrl!.isEmpty
                          ? const Icon(Icons.person, size: 32)
                          : null,
                    ),
                    const SizedBox(height: 30),
                    textSemiBold(
                      text: userName.isEmpty ? "Guest" : userName,
                      fontSize: 20,
                      fontColor: AppStyles.whiteColor,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: textSemiBold(text: "Settings", fontSize: 18),
                  ),
                  _listConst(
                    onTap: () {
                      context.push('/notification_setting_screen');
                    },
                    icons: Icons.notifications_outlined,
                    title: "Notifications",
                  ),
                  _listConst(
                    onTap: () {
                      context.push('/language_preference_screen');
                    },
                    icons: Icons.translate,
                    title: "Language Preference",
                  ),
                  _listConst(
                    onTap: () {
                      context.push('/privacy_setting_screen');
                    },
                    icons: Icons.vpn_key_outlined,
                    title: "Privacy Setting",
                  ),
                  _listConst(
                    onTap: () {
                      context.push('/contact_support_screen');
                    },
                    icons: Icons.headset_mic_outlined,
                    title: "Contact Support",
                  ),
                  _listConst(
                    onTap: () {
                      context.push('/faq_help_screen');
                    },
                    icons: Icons.help_outline,
                    title: "FAQ & Help",
                  ),
                  _listConst(
                    onTap: () {
                      context.push('/user_manual_screen');
                    },
                    icons: Icons.phone_iphone,
                    title: "User Manual",
                  ),
                  _listConst(
                    onTap: () {
                      showLogoutDialog(context);
                    },
                    icons: Icons.logout,
                    title: "Log Out",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    AlertUtils.showTextButtonDialog(
      context: context,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close Button (Top Right)
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppStyles.blueCC,
                  ),
                  child: const Icon(Icons.close, color: AppStyles.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Title
            const Text(
              'Log Out',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppStyles.black1A,
              ),
            ),
            const SizedBox(height: 8),
            // Message
            const Text(
              'Are you sure you want to Log Out?',
              style: TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // OK Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppStyles.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                onPressed: () async {
                  await settingsController.logoutUser();
                  authController.phoneNumberController.clear();
                  authController.otpController.clear();

                  await AppStorage.clearAll();

                  // Navigate to login and remove all previous routes
                  if (context.mounted) {
                    context.go('/login_screen');
                  }
                },
                child: Obx(
                  () => settingsController.isLogoutLoading.value
                      ? const CircularLoader(color: AppStyles.whiteColor)
                      : const Text('OK', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listConst({
    required VoidCallback onTap,
    required IconData icons,
    required String title,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppStyles.whiteColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppStyles.primaryColor.withOpacity(0.15),
                      ),
                      child: Center(
                        child: Icon(
                          icons,
                          color: AppStyles.primaryColor,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    textMedium(text: title, fontSize: 16),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ],
            ),
            Divider(height: 16, color: AppStyles.textBlack.withOpacity(0.07)),
          ],
        ),
      ),
    );
  }
}
