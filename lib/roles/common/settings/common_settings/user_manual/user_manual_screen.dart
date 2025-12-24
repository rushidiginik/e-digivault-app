import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';


class UserManualScreen extends StatefulWidget {
  const UserManualScreen({super.key});

  @override
  State<UserManualScreen> createState() => _UserManualScreenState();
}

class _UserManualScreenState extends State<UserManualScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonAppBarWidget(title: ""),
      body: SafeArea(child: _userManualSection()),
    );
  }

  Widget _userManualSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          // Title
          textBold(
            text: "user_manual",
            fontSize: 22,
            fontColor: AppStyles.black1A,
          ),

          const SizedBox(height: 16),

          // Subtitle
          textRegular(
            text: "please_choose_preferred_manual",
            fontSize: 16,
            fontColor: AppStyles.blue20,
          ),

          const SizedBox(height: 32),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Document Button
              _buildOption(
                imagePath: "assets/images/svg/company_profile_icon.svg",
                context,
                icon: Icons.description,
                text: "Company  Profile ",
                onTap: () {
                  // Get.toNamed(
                  //   NavigatorConst.userManualDocScreen,
                  //   arguments: {"isFromDoc": true},
                  // );
                },
              ),

              const SizedBox(width: 20),

              // Video Button
              _buildOption(
                imagePath: "assets/images/svg/vedio_ciocn.svg",
                context,
                icon: Icons.videocam,
                text: "video",
                onTap: () {
                  // Get.toNamed(
                  //   NavigatorConst.userManualDocScreen,
                  //   arguments: {"isFromDoc": false},
                  // );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required IconData icon,
    required String imagePath,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.30,
        height: size.height * 0.12,
        // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: AppStyles.blue20.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath),
            const SizedBox(height: 8),
            textMedium(
              text: text,
              fontSize: 14,
              fontColor: AppStyles.blue20,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
