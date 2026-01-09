import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/RegionalManager/HomePageRegionalManager/home_page_regionalhead.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/settings/common_settings/settings/settings_screen.dart';

class RegionalHeadDashboardScreen extends StatefulWidget {
  const RegionalHeadDashboardScreen({super.key});

  @override
  State<RegionalHeadDashboardScreen> createState() =>
      _RegionalHeadDashboardScreenState();
}

class _RegionalHeadDashboardScreenState
    extends State<RegionalHeadDashboardScreen> {
  late Size size;
  int _selectedIndex = 0;

  final List<String> _titles = ["home", "user", "estimate", "payments", "more"];

  // SVG icons similar to BD dashboard
  final List<Widget> _navIcons = [
    SvgPicture.asset(ImageConst.homeicon, height: 24, width: 24),
    SvgPicture.asset(ImageConst.clienticon, height: 24, width: 24),
    SvgPicture.asset(ImageConst.leadsicon, height: 24, width: 24),
    Icon(Icons.currency_rupee, size: 24), // Payments icon
    SvgPicture.asset(ImageConst.settingsicon, height: 24, width: 24),
  ];

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = const [
      HomePageRegionalHead(),
      // RegionalHeadUserScreen(),
      // RegionalHeadEstimateScreen(),
      // RegionalHeadPaymentScreen(),
      // SettingScreen(),
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
                        HapticFeedback.lightImpact();
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Handle both SVG and Icon widgets
                          if (_navIcons[index] is Icon)
                            Icon(
                              (_navIcons[index] as Icon).icon,
                              size: 24,
                              color: isSelected
                                  ? AppStyles.primaryColor
                                  : AppStyles.textBlack,
                            )
                          else
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
