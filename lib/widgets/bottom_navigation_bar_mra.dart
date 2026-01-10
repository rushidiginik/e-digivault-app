import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarMra extends StatefulWidget {
  final int? forceSelectedIndex;

  const BottomNavigationBarMra({super.key, this.forceSelectedIndex});

  @override
  State<BottomNavigationBarMra> createState() => _DashboardScreenMraState();
}

class _DashboardScreenMraState extends State<BottomNavigationBarMra> {
  late int _selectedIndex;

  int _getIndexFromRoute(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.contains('/home_page_mra_screen')) return 0;
    if (location.contains('/lead_detail_screen_mra')) return 2;
    if (location.contains('/payments_screen_mra')) return 3;
    if (location.contains('/settings_screen')) return 4;

    return _selectedIndex;
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.forceSelectedIndex ?? 0;
  }

  @override
  void didUpdateWidget(covariant BottomNavigationBarMra oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.forceSelectedIndex != null &&
        widget.forceSelectedIndex != _selectedIndex) {
      setState(() {
        _selectedIndex = widget.forceSelectedIndex!;
      });
    }
  }

  final List<String> _titles = [
    "home",
    "client",
    "lead",
    "payments",
    "settings",
  ];

  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.person_outline,
    Icons.person_add_alt,
    Icons.currency_rupee,
    Icons.settings_outlined,
  ];

  Future<void> navigate(int index) async {
    switch (index) {
      case 0:
        context.go('/home_page_mra_screen');
        break;
      case 1:
        // context.go('/mra/client');
        break;
      case 2:
        context.go('/lead_detail_screen_mra');
        break;
      case 3:
        context.go('/payments_screen_mra');
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
            boxShadow: [
              BoxShadow(
                color: AppStyles.greyDE,
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex:
                widget.forceSelectedIndex ?? _getIndexFromRoute(context),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            // IMPORTANT
            elevation: 0,
            selectedItemColor: AppStyles.primaryColor,
            unselectedItemColor: AppStyles.textBlack,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            onTap: (index) {
              setState(() => _selectedIndex = index);
              navigate(index);
            },
            items: List.generate(
              _titles.length,
              (index) => BottomNavigationBarItem(
                icon: Icon(_icons[index]),
                label: _titles[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
