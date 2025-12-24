import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  late Size size;
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    _loadCurrentPermissionState();
  }

  Future<void> _loadCurrentPermissionState() async {
    final status = await Permission.notification.status;
    setState(() => isSwitched = status.isGranted);
  }

  Future<void> _handleSwitchToggle(bool value) async {
    setState(() => isSwitched = value);

    if (value) {
      final status = await Permission.notification.status;

      if (!status.isGranted) {
        final result = await Permission.notification.request();

        if (!result.isGranted) {
          // Permission still denied → revert UI and open settings
          setState(() => isSwitched = false);
          await openAppSettings();
        }
      }
    } else {
      // User turned OFF → just open settings because we cannot revoke permission programmatically
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonAppBarWidget(title: "notifications"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Column(
            children: [
              ListTile(
                title: textMedium(text: "Notifications", fontSize: 16),
                trailing: CupertinoSwitch(
                  value: isSwitched,
                  onChanged: _handleSwitchToggle,
                  activeColor: AppStyles.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
