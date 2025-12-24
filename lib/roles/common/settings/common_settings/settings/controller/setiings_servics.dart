import 'dart:convert';

import 'package:e_digivault_org_app/core/constants/api_url_list.dart';
import 'package:e_digivault_org_app/core/constants/app_constant.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/settings/model/logout_user_model.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/settings/model/user_settings_model.dart';
import 'package:e_digivault_org_app/utils/app_storage.dart';
import 'package:e_digivault_org_app/widgets/toast_widget.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class SetiingsServics {
  String getUserSettingsUrl =
      "${ApiUrlList.getUserSettings}${AppStorage.userId}";

  // use settings logout endpoint (matches curl: POST /api/settings/logout)
  String logoutUser = "${AppConstants.baseUrl}settings/logout";

  Future<UserInitSettingsModel?> initUserSettings() async {
    try {
      print("token  ${AppStorage.authToken}");
      final response = await http.post(
        Uri.parse(ApiUrlList.initSettings),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${AppStorage.authToken}',
          'Accept': 'application/json',
        },
        // body: jsonEncode({"userId": AppStorage.userId, "userIdModel": "User"}),
      );
      print("response in settings ${ApiUrlList.initSettings}");
      print("response in settings ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        // AppToast.success(json['message'] ?? 'user settings created successfully');
        return UserInitSettingsModel.fromJson(json);
      } else {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final message = json['message'] ?? 'Something went wrong';

        return UserInitSettingsModel.fromJson(json);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<LogoutResponseModel?> logOutUser() async {
    try {
      print('Calling logout: $logoutUser');
      final response = await http.post(
        Uri.parse(logoutUser),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${AppStorage.authToken}',
        },
        // curl used an empty data payload; send no body to match that behaviour
      );
      print("resposne ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        AppToast.success(json['message'] ?? 'Logout user successfully');
        return LogoutResponseModel.fromJson(json);
      } else {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final message = json['message'] ?? 'Something went wrong';
        AppToast.error(message);
        return LogoutResponseModel.fromJson(json);
      }
    } catch (e) {
      AppToast.error(e.toString());
    }
    return null;
  }

  Future<UserInitSettingsModel?> updateUserSettings({
    required Map<String, dynamic> updateData,
  }) async {
    try {
      final uri = Uri.parse("${ApiUrlList.updateSettings}${AppStorage.userId}");

      final response = await http.patch(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppStorage.authToken}",
        },
        body: jsonEncode(updateData), // <-- FIXED (remove "data":)
      );

      print("Url For Privacy:$uri");

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        AppToast.success(json['message'] ?? "Settings updated successfully");
        return UserInitSettingsModel.fromJson(json);
      } else {
        AppToast.error(json['message'] ?? "Failed to update settings");
        return null;
      }
    } catch (e) {
      debugPrint("Update settings error: $e");
      AppToast.error("Something went wrong");
      return null;
    }
  }

  Future<GetSettingsResponse?> getUserSettings() async {
    try {
      print(getUserSettingsUrl);
      print(AppStorage.authToken);
      final response = await http.get(
        Uri.parse(getUserSettingsUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${AppStorage.authToken}',
          'Accept': 'application/json',
        },
      );

      print("resposne ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);

        return GetSettingsResponse.fromJson(json);
      } else {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final message = json['message'] ?? 'Something went wrong';
        AppToast.error(message);
        return GetSettingsResponse.fromJson(json);
      }
    } catch (e) {
      AppToast.error(e.toString());
    }
    return null;
  }

  Future<FaqResponse?> getFaqsList() async {
    try {
      final response = await http.get(
        Uri.parse("https://app.edigivault.com/api/settings/getFaqHelp"),
      );
      if (response.statusCode == 200) {
        print("response ${response.body}");
        final json = jsonDecode(response.body);
        return FaqResponse.fromJson(json);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
