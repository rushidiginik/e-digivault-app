import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarBd extends StatefulWidget {
  const BottomNavigationBarBd({super.key});

  @override
  State<BottomNavigationBarBd> createState() => _BottomNavigationBarBdState();
}

class _BottomNavigationBarBdState extends State<BottomNavigationBarBd> {
  int _selectedIndex = 0;

  final List<String> _titles = ["home", "client", "lead", "settings"];

  // Using SVG icons like your existing BD dashboard
  final List<String> _iconPaths = [
    ImageConst.homeicon,
    ImageConst.clienticon,
    ImageConst.leadsicon,
    ImageConst.settingsicon,
  ];

  Future<void> navigate(int index) async {
    switch (index) {
      case 0:
        context.go('/bd_home_screen');
        break;
      case 1:
        context.go('/bd_client_screen');
        break;
      case 2:
        context.go('/bd_lead_screen');
        break;
      case 3:
        context.go('/settings_screen');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppStyles.whiteColor,
        padding: const EdgeInsets.all(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: AppStyles.lightBlueEB,
            borderRadius: BorderRadius.circular(40),
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
                    navigate(index);
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
                        child: SvgPicture.asset(
                          _iconPaths[index],
                          height: 24,
                          width: 24,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _titles[index],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isSelected
                              ? AppStyles.primaryColor
                              : AppStyles.textBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
