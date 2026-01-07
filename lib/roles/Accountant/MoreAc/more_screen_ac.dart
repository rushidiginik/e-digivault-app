import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/image_const.dart';

class MoreScreenAc extends StatefulWidget {
  const MoreScreenAc({super.key});

  @override
  State<MoreScreenAc> createState() => _MoreScreenAcState();
}

class _MoreScreenAcState extends State<MoreScreenAc> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Drawer(
      width: width * 0.82,
      backgroundColor: const Color(0xFF001678),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 HEADER
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'e-DigiVault',
                    style: TextStyle(
                      color: Color(0xFFFFC700),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEFF2F4),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: Color(0xFF0A2C8C),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            _menuItem(
              SvgPicture.asset(
                ImageConst.moreestimateicone,
                color: Colors.white,
              ),
              'View Estimate Request',
              () {
                Navigator.pop(context);
              },
            ),

            _menuItem(
              SvgPicture.asset(ImageConst.moreinvoiceicon, color: Colors.white),
              'Invoice',
              () {
                Navigator.pop(context);
              },
            ),

            _menuItem(
              SvgPicture.asset(ImageConst.moreestiicon, color: Colors.white),
              'Estimate',
              () {
                Navigator.pop(context);
              },
            ),

            _menuItem(
              SvgPicture.asset(
                ImageConst.moreproposalicon,
                color: Colors.white,
              ),
              'Proposal',
              () {
                Navigator.pop(context);
              },
            ),

            _menuItem(
              SvgPicture.asset(ImageConst.settingsicon, color: Colors.white),
              'Settings',
              () {
                Navigator.pop(context);
                context.go('/settings_screen');
              },
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              child: InkWell(
                onTap: () => _showLogoutDialog(context),
                child: Container(
                  height: 44,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Logout',
                        style: TextStyle(
                          color: Color(0xFF0052CC),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.logout, color: Color(0xFF0052CC)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 MENU ITEM
  Widget _menuItem(Widget icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFF2E46A3),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: icon, // 👈 yahin tumhara PNG / SVG aayega
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => Navigator.pop(dialogContext),
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEFF2F4),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: Color(0xFF0052CC),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                const Center(
                  child: Text(
                    'Log Out',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),

                const SizedBox(height: 10),

                const Center(
                  child: Text(
                    'Are you sure you want to Log Out?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0052CC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          /// 1️ close dialog
                          Navigator.pop(dialogContext);

                          /// 2️ close drawer
                          Navigator.pop(context);

                          /// 3️ GO TO LOGIN (GoRouter)
                          context.go('/login_screen');
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
