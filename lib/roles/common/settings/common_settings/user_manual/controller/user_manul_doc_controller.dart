import 'package:e_digivault_org_app/roles/common/settings/common_settings/user_manual/controller/user_manual_service.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';


class UserManualController extends GetxController {
  final UserManualService _service = UserManualService();

  RxBool isLoading = false.obs;
  String documentText = "";
  String userVideo = "";

  /// Fetch the manual document for current user
  Future<void> getUserManual() async {
    try {
      isLoading.value = true;

      final result = await _service.fetchUserManual();

      if (result != null) {
        documentText = result;
      }
    } catch (e) {
      debugPrint(" UserManualController Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch the manual document for current user
  Future<void> getUserVideo() async {
    try {
      isLoading.value = true;

      final result = await _service.fetchUserVideo();

      if (result != null) {
        userVideo = result;
        print("user ${userVideo}");
      }
    } catch (e) {
      debugPrint(" UserManualController Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
