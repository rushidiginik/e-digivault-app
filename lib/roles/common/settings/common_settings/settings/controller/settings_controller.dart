import 'package:e_digivault_org_app/roles/common/settings/common_settings/settings/controller/setiings_servics.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/settings/model/logout_user_model.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/settings/model/user_settings_model.dart';
import 'package:e_digivault_org_app/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



class SettingsController extends GetxController {
  final SetiingsServics _service = SetiingsServics();

  RxBool isLogoutLoading = false.obs;
  RxBool isPatchLoading = false.obs;
  RxBool isGetSettingsLoading = false.obs;
  RxBool isFaqLoading = false.obs;
  late LogoutResponseModel logoutResponseModel;
  late UserInitSettingsModel userInitSettingsModel;
  GetSettingsResponse? getSettingsResponse;
  FaqResponse? faqResponse;

  Future<void> initUserSettings() async {
    try {
      final response = await _service.initUserSettings();
      if (response != null) {
        userInitSettingsModel = response;
      } else {}
    } catch (e) {
      // debugPrint(e.toString());
    }
  }

  Future<bool> logoutUser() async {
    try {
      isLogoutLoading.value = true;

      final response = await _service.logOutUser();

      if (response != null) {
        logoutResponseModel = response;
        AppToast.success(response.message);
        return true;
      } else {
        AppToast.error("Failed to Logout user");
        return false;
      }
    } catch (e) {
      AppToast.error("An unexpected error occurred");
      return false;
    } finally {
      isLogoutLoading.value = false;
    }
  }

  Future<void> updateUserSettings(Map<String, dynamic> updateData) async {
    try {
      isPatchLoading.value = true;
      final response = await _service.updateUserSettings(
        updateData: updateData,
      );

      if (response != null) {
        userInitSettingsModel = response;
        update();
      }
    } catch (e) {
      debugPrint('updateUserSettings error: $e');
    } finally {
      isPatchLoading.value = false;
    }
  }

  Future<void> getUserSettings() async {
    try {
      isGetSettingsLoading.value = true;
      final response = await _service.getUserSettings();
      if (response != null) {
        getSettingsResponse = response;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isGetSettingsLoading.value = false;
    }
  }

  Future<void> getFaqList() async {
    try {
      isFaqLoading.value = true;
      final response = await _service.getFaqsList();
      if (response != null) {
        faqResponse = response;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isFaqLoading.value = false;
    }
  }
}
