import 'dart:convert';
import 'package:e_digivault_org_app/core/constants/api_url_list.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/model/approved_lead_model.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/model/leads_details_response.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/model/pending_lead_model.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/model/rejected_lead_model.dart';
import 'package:e_digivault_org_app/utils/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewLeadsService {
  /// Fetch Approved Leads
  Future<ApprovedLeadsResponse?> getApprovedLeads({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final uri = Uri.parse(ApiUrlList.getApprovedLeads).replace(
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );

      debugPrint("📡 Fetching approved leads from: $uri");

      final response = await http
          .get(
            uri,
            headers: {
              'Content-Type': 'application/json',
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
        return ApprovedLeadsResponse.fromJson(json);
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

  /// Fetch Pending Leads
  Future<PendingLeadsResponse?> getPendingLeads({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final uri = Uri.parse(ApiUrlList.getPendingLeads).replace(
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );

      debugPrint("📡 Fetching pending leads from: $uri");

      final response = await http
          .get(
            uri,
            headers: {
              'Content-Type': 'application/json',
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
        return PendingLeadsResponse.fromJson(json);
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

  /// Fetch Rejected Leads
  Future<RejectedLeadsResponse?> getRejectedLeads({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final uri = Uri.parse(ApiUrlList.getRejectedLeads).replace(
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );

      debugPrint("📡 Fetching rejected leads from: $uri");

      final response = await http
          .get(
            uri,
            headers: {
              'Content-Type': 'application/json',
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
        return RejectedLeadsResponse.fromJson(json);
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

  /// Fetch Lead Details by ID
  Future<LeadDetailsResponse?> getLeadById(String leadId) async {
    try {
      final uri = Uri.parse('${ApiUrlList.getLeadById}$leadId');

      debugPrint("📡 Fetching lead details from: $uri");

      final response = await http
          .get(
            uri,
            headers: {
              'Content-Type': 'application/json',
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
        return LeadDetailsResponse.fromJson(json);
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
