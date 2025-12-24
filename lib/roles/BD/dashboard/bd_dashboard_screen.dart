import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/BD/Client/client_screen_bd.dart';
import 'package:e_digivault_org_app/roles/BD/HomePageBD/home_page_screen_bd.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/lead_screen_bd.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class DashboardBDScreen extends StatefulWidget {
  const DashboardBDScreen({super.key});

  @override
  State<DashboardBDScreen> createState() => _DashboardBDScreenState();
}

class _DashboardBDScreenState extends State<DashboardBDScreen> {
  late Size size;
  int _selectedIndex = 0;

  final List<String> _titles = ["home", "client", "lead", "Setting"];
  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.person_outline,
    Icons.person_add_alt,
    Icons.settings,
  ];

  // Add screens for all navigation items
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomePageBDScreen(),
      ClientScreen(),
      LeadScreen(),
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
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
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Container(
                      width: size.width / 5.5, // Adjusted for 5 items
                      color: AppStyles.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            _icons[index],
                            color: isSelected
                                ? AppStyles.primaryColor
                                : AppStyles.textBlack,
                            size: 24,
                          ),
                          const SizedBox(height: 5),
                          textMedium(
                            text: _titles[index],
                            fontSize: 11,
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
