import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/roles/Accountant/HomePageAc/home_screen_ac.dart';
import 'package:e_digivault_org_app/roles/Accountant/MoreAc/more_screen_ac.dart';
import 'package:e_digivault_org_app/roles/Accountant/PaymentsAc/payments_screen_ac.dart';
import 'package:e_digivault_org_app/roles/Accountant/UserAc/user_screen_ac.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../GapAc/gap_screen_ac.dart';

class AcDashboardScreen extends StatefulWidget {
  const AcDashboardScreen({super.key});

  @override
  State<AcDashboardScreen> createState() => _AcDashboardScreenState();
}

class _AcDashboardScreenState extends State<AcDashboardScreen> {
  late Size size;
  int _selectedIndex = 0;

  ///  Drawer open karne ke liye
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> _titles = ["Home", "User", "GAP", "Payments", "More"];

  final List<Widget> _navIcons = [
    SvgPicture.asset(ImageConst.homeicon, height: 24, width: 24),
    SvgPicture.asset(ImageConst.clienticon, height: 24, width: 24),
    SvgPicture.asset(ImageConst.gapIconAc, height: 24, width: 24),
    SvgPicture.asset(ImageConst.paymentIconAc, height: 24, width: 24),
    SvgPicture.asset(ImageConst.moreIconAc, height: 24, width: 24),
  ];

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreenAc(),
      UserScreenAc(),
      GapScreenAc(),
      PaymentsScreenAc(),
      const SizedBox(), //  More ke liye placeholder
    ];
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return SafeArea(
      top: false,
      child: Scaffold(
        key: _scaffoldKey,

        ///  RIGHT SIDE BLUE DRAWER
        endDrawer: const MoreScreenAc(),

        body: IndexedStack(index: _selectedIndex, children: _screens),

        bottomNavigationBar: Container(
          color: AppStyles.whiteColor,
          padding: const EdgeInsets.all(12),
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
              children: List.generate(_titles.length, (index) {
                final bool isSelected = _selectedIndex == index;

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      /// 🔥 MORE CLICK
                      if (index == 4) {
                        _scaffoldKey.currentState!.openEndDrawer();
                      } else {
                        setState(() {
                          _selectedIndex = index;
                        });
                      }
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
    );
  }
}
