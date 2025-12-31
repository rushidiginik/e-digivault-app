import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/roles/Accountant/HomePageAc/home_screen_ac.dart';
import 'package:e_digivault_org_app/roles/Accountant/MoreAc/more_screen_ac.dart';
import 'package:e_digivault_org_app/roles/Accountant/PaymentsAc/payments_screen_ac.dart';
import 'package:e_digivault_org_app/roles/Accountant/UserAc/user_screen_ac.dart';
import 'package:e_digivault_org_app/roles/BD/Client/client_screen_bd.dart';
import 'package:e_digivault_org_app/roles/BD/HomePageBD/home_page_screen_bd.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/lead_screen_bd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/settings/common_settings/settings/settings_screen.dart';
import '../GapAc/gap_screen_ac.dart';

class AcDashboardScreen extends StatefulWidget {
  const AcDashboardScreen({super.key});

  @override
  State<AcDashboardScreen> createState() => _AcDashboardScreenState();
}

class _AcDashboardScreenState extends State<AcDashboardScreen> {
  late Size size;
  int _selectedIndex = 0;

  final List<String> _titles = ["Home", "User", "GAP", "Payments", "Setting"];

  // SVG icons similar to CD dashboard
  final List<Widget> _navIcons = [
    SvgPicture.asset(ImageConst.homeicon, height: 24, width: 24),
    SvgPicture.asset(ImageConst.clienticon, height: 24, width: 24),
    SvgPicture.asset(ImageConst.gapIconAc, height: 24, width: 24),
    SvgPicture.asset(ImageConst.paymentIconAc, height: 24, width: 24),
    SvgPicture.asset(ImageConst.settingsicon, height: 24, width: 24),
  ];

  // Add screens for all navigation items
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreenAc(),
      UserScreenAc(),
      GapScreenAc(),
      PaymentsScreenAc(),
      SettingScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        body: IndexedStack(index: _selectedIndex, children: _screens),
        bottomNavigationBar: Container(
          color: AppStyles.whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: AppStyles.lightBlueEB,
                borderRadius: BorderRadius.circular(80),
                border: Border.all(color: AppStyles.greyDE),
                boxShadow: [
                  BoxShadow(
                    color: AppStyles.greyDE,
                    blurRadius: 20,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_titles.length, (index) {
                  bool isSelected = _selectedIndex == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              isSelected
                                  ? AppStyles.primaryColor
                                  : AppStyles.textBlack,
                              BlendMode.srcIn,
                            ),
                            child: _navIcons[index],
                          ),
                          const SizedBox(height: 4),
                          textMedium(
                            text: _titles[index],
                            fontSize: 12,
                            fontColor: isSelected
                                ? AppStyles.primaryColor
                                : AppStyles.textBlack,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payments')),
      body: const Center(child: Text('Payments Screen')),
    );
  }
}
