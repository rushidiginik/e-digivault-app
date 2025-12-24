import 'dart:convert';
import 'package:e_digivault_org_app/core/constants/api_url_list.dart';
import 'package:e_digivault_org_app/utils/app_storage.dart';
import 'package:e_digivault_org_app/widgets/toast_widget.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';


class UserManualService {
  String apiUrldoc = "${ApiUrlList.userManualDoc}${AppStorage.userId}";
  String apiUrlVedio = "${ApiUrlList.userManualVideo}${AppStorage.userId}";

  /// Fetch User Manual Document URL
  Future<String?> fetchUserManual() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrldoc),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${AppStorage.authToken}',
          'Accept': 'application/json',
        },
      );
      print("dnb ${response.body}");

      final Map<String, dynamic> json = jsonDecode(response.body);

      if (response.statusCode == 200 && json['success'] == true) {
        // AppToast.success(json['message'] ?? 'User manual fetched successfully');
        return json['data']?['documentUrl'];
      } else {
        AppToast.error(json['message'] ?? 'Failed to fetch user manual');
        return null;
      }
    } catch (e) {
      debugPrint(" UserManualService Error: $e");
      AppToast.error("An error occurred while fetching user manual");
      return null;
    }
  }

  Future<String?> fetchUserVideo() async {
    try {
      print(apiUrlVedio);
      final response = await http.get(
        Uri.parse(apiUrlVedio),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${AppStorage.authToken}',
          'Accept': 'application/json',
        },
      );
      print("dnb ${response.body}");

      final Map<String, dynamic> json = jsonDecode(response.body);

      if (response.statusCode == 200 && json['success'] == true) {
        // AppToast.success(json['message'] ?? 'User manual fetched successfully');
        return json['data']?['videoUrl'];
      } else {
        AppToast.error(json['message'] ?? 'Failed to fetch user manual video');
        return null;
      }
    } catch (e) {
      debugPrint(" UserVedioService Error: $e");
      AppToast.error("An error occurred while fetching user vedio");
      return null;
    }
  }
}
