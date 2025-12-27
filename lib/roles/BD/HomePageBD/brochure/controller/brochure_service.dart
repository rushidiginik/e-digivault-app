import 'dart:convert';

import 'package:e_digivault_org_app/core/constants/api_url_list.dart';
import 'package:e_digivault_org_app/roles/BD/HomePageBD/brochure/model/brochure_model.dart';
import 'package:e_digivault_org_app/utils/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BrochureService {
  /// Fetch all brochures with pagination and filters
  Future<BrochureResponse?> getAllBrochures({
    int page = 1,
    int limit = 10,
    String? search,
    bool? isActive,
  }) async {
    try {
      // Build query parameters
      final queryParams = {
        'page': page.toString(),
        'limit': limit.toString(),
        if (search != null && search.isNotEmpty) 'search': search,
        if (isActive != null) 'isActive': isActive.toString(),
      };

      final uri = Uri.parse(
        ApiUrlList.getAllBrochures,
      ).replace(queryParameters: queryParams);

      debugPrint("📡 Fetching brochures from: $uri");

      final response = await http
          .get(
            uri,
            headers: {
              'Content-Type': 'application/json',
              // Add auth token if needed
              'Authorization': 'Bearer ${AppStorage.authToken}',
            },
          )
          .timeout(
            const Duration(seconds: 30),
            onTimeout: () => throw Exception('Request timeout'),
          );

      debugPrint("📥 Response status: ${response.statusCode}");
      debugPrint("📥 Response body: ${response.body}");

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return BrochureResponse.fromJson(json);
      } else {
        debugPrint("⚠️ Non-200 status: ${response.statusCode}");
        return null;
      }
    } on FormatException catch (e) {
      debugPrint("❌ JSON parsing error: $e");
    } on http.ClientException catch (e) {
      debugPrint("❌ Network error: $e");
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
    }

    return null;
  }
}
