import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/settings/controller/settings_controller.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';
import 'package:e_digivault_org_app/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PrivacySettingScreen extends StatefulWidget {
  const PrivacySettingScreen({super.key});

  @override
  State<PrivacySettingScreen> createState() => _PrivacySettingScreenState();
}

class _PrivacySettingScreenState extends State<PrivacySettingScreen> {
  late SettingsController settingsController;

  /// Stores switch values dynamically
  final Map<String, bool> _switchValues = {};

  @override
  void initState() {
    super.initState();

    settingsController = Get.find<SettingsController>();

    /// GET SETTINGS from API
    settingsController.getUserSettings();
  }

  /// Maps UI label → API field name
  String _mapKeyToApiField(String key) {
    switch (key) {
      case "Data Sharing":
        return "dataSharing";
      case "Visibility Control":
        return "visibilityControl";
      case "Access Permission":
        return "accessPermissions";
      case "Document Control":
        return "documentControl";
      case "Account History":
        return "accountHistory";
      case "Notification Privacy":
        return "notificationsPrivacy";
      default:
        return "";
    }
  }

  /// When user toggles switch → send PATCH API
  Future<void> _onSwitchChanged(String key, bool newValue) async {
    setState(() => _switchValues[key] = newValue);

    final String apiField = _mapKeyToApiField(key);

    final Map<String, dynamic> request = {
      "privacySettings": {apiField: newValue},
    };

    await settingsController.updateUserSettings(request);

    /// Refresh UI after PATCH
    await settingsController.getUserSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: const CommonAppBarWidget(title: "Privacy Setting"),

      body: Obx(() {
        // LOADING FOR GET SETTINGS
        if (settingsController.isGetSettingsLoading.value) {
          return const CircularLoader();
        }

        return GetBuilder<SettingsController>(
          builder: (controller) {
            final data = controller.getSettingsResponse?.data;

            /// Populate switch values AFTER API completes
            if (_switchValues.isEmpty && data != null) {
              _switchValues.addAll({
                "Data Sharing": data.privacySettings?.dataSharing ?? false,
                "Visibility Control":
                    data.privacySettings?.visibilityControl ?? false,
                "Access Permission":
                    data.privacySettings?.accessPermissions ?? false,
                "Document Control":
                    data.privacySettings?.documentControl ?? false,
                "Account History":
                    data.privacySettings?.accountHistory ?? false,
                "Notification Privacy":
                    data.privacySettings?.notificationsPrivacy ?? false,
              });
            }

            return Stack(
              children: [
                ListView.separated(
                  itemCount: _switchValues.length,
                  separatorBuilder:
                      (_, __) => const Divider(
                        height: 1,
                        thickness: 0.8,
                        color: AppStyles.greyDE,
                        indent: 12,
                        endIndent: 12,
                      ),
                  itemBuilder: (context, index) {
                    final key = _switchValues.keys.elementAt(index);
                    final bool value = _switchValues[key] ?? false;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textMedium(text: key, fontSize: 16),
                          CupertinoSwitch(
                            value: value,
                            activeColor: AppStyles.primaryColor,
                            onChanged: (val) => _onSwitchChanged(key, val),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                /// PATCH LOADER
                Obx(
                  () =>
                      settingsController.isPatchLoading.value
                          ? const CircularLoader()
                          : const SizedBox(),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
