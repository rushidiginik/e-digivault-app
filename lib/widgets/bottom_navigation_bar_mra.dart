import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreenMra extends StatefulWidget {
  const DashboardScreenMra({super.key});

  @override
  State<DashboardScreenMra> createState() => _DashboardScreenMraState();
}

class _DashboardScreenMraState extends State<DashboardScreenMra> {
  int _selectedIndex = 0;

  final List<String> _titles = ["home", "client", "lead", "payments", "settings"];

  final List<IconData> _icons = [Icons.home_outlined, Icons.person_outline, Icons.person_add_alt, Icons.currency_rupee, Icons.settings_outlined];

  Future<void> navigate(int index) async {
    switch (index) {
      case 0:
        context.go('/home_page_mra_screen');
        break;
      case 1:
        // context.go('/mra/client');
        break;
      case 2:
        // context.go('/mra/lead');
        break;
      case 3:
        // context.go('/mra/payments');
        break;
      case 4:
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
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: AppStyles.lightBlueEB,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: AppStyles.greyDE),
            boxShadow: [BoxShadow(color: AppStyles.greyDE, blurRadius: 20, spreadRadius: 1)],
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent, // IMPORTANT
            elevation: 0,
            selectedItemColor: AppStyles.primaryColor,
            unselectedItemColor: AppStyles.textBlack,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            onTap: (index) {
              setState(() => _selectedIndex = index);
              navigate(index);
            },
            items: List.generate(_titles.length, (index) => BottomNavigationBarItem(icon: Icon(_icons[index]), label: _titles[index])),
          ),
        ),
      ),
    );
  }
}
