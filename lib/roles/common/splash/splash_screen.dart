import 'dart:async';

import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/role_maneger/role_manager.dart';
import 'package:e_digivault_org_app/routes/app_routes.dart';
import 'package:e_digivault_org_app/utils/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static Widget create() => const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double _scaleValue = 1.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16),
    )..addListener(_updateScale);

    _controller.repeat();

    Timer(const Duration(milliseconds: 1400), () {
      context.go('/digivault_text_screen');
    });
  }

  void _updateScale() {
    setState(() {
      _scaleValue += 0.5;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.splashColor,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Transform.scale(
                scale: _scaleValue,
                child: SvgPicture.asset("assets/images/svg/animation_svg.svg"),
              ),
            ),
            Center(
              child: textExtraBold(
                text: "e-DigiVault",
                fontSize: 48,
                fontColor: AppStyles.yellowFF,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DigiVaultTextScreen extends StatefulWidget {
  const DigiVaultTextScreen({super.key});

  @override
  State<DigiVaultTextScreen> createState() => _DigiVaultTextScreenState();
}

class _DigiVaultTextScreenState extends State<DigiVaultTextScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      context.go('/sub_text_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildGradientTextScreen("e-DigiVault", 48);
  }
}

class SubTextScreen extends StatefulWidget {
  const SubTextScreen({super.key});

  @override
  State<SubTextScreen> createState() => _SubTextScreenState();
}

class _SubTextScreenState extends State<SubTextScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () async {
      // Check if user is logged in
      final authToken = AppStorage.authToken;
      final roleString = AppStorage.role;
      final hasSeenOnboarding = AppStorage.hasSeenOnboarding;

      if (authToken != null && authToken.isNotEmpty && roleString != null) {
        // User is logged in, navigate to their dashboard
        final userRole = UserRole.fromApiString(roleString);
        if (userRole != null) {
          _navigateToDashboard(userRole);
        } else {
          // Invalid role, go to login
          context.go('/login_screen');
        }
      } else if (hasSeenOnboarding) {
        // User has seen onboarding but not logged in
        context.go('/login_screen');
      } else {
        // First time user, show onboarding

        Timer(const Duration(seconds: 2), () async {
          context.go('/onboarding_screen');
        });
      }
    });
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

  @override
  Widget build(BuildContext context) {
    return _buildGradientTextScreen("Your Journey Begins Here", 32);
  }
}

/// Gradient text builder used by both sub-screens
Widget _buildGradientTextScreen(String text, double fontSize) {
  return Scaffold(
    backgroundColor: AppStyles.whiteColor,
    body: Center(
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF2C7CE6), Color(0xFF242E42)],
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: fontSize,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
