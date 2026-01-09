import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/controller/view_leads_service.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/model/approved_lead_model.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/model/leads_details_response.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/model/pending_lead_model.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/model/rejected_lead_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewLeadsController extends GetxController {
  final ViewLeadsService service = ViewLeadsService();

  // Loading states
  final isLoadingApproved = false.obs;
  final isLoadingPending = false.obs;
  final isLoadingRejected = false.obs;

  // Data lists - Using different models
  final RxList<Lead> approvedLeads = <Lead>[].obs;
  final RxList<PendingLead> pendingLeads = <PendingLead>[].obs;
  final RxList<RejectedLead> rejectedLeads = <RejectedLead>[].obs;

  final Rx<LeadDetailsData?> leadDetails = Rx(null);
  final isLoadingDetails = false.obs;

  final searchQuery = ''.obs;

  // Pagination data
  final approvedCurrentPage = 1.obs;
  final approvedTotalPages = 1.obs;
  final pendingCurrentPage = 1.obs;
  final pendingTotalPages = 1.obs;
  final rejectedCurrentPage = 1.obs;
  final rejectedTotalPages = 1.obs;

  // Error states
  final Rx<String?> errorMessage = Rx(null);

  @override
  void onInit() {
    super.onInit();
    // Fetch approved leads initially
    fetchApprovedLeads(refresh: true);
  }

  //  filtered lists
  List<dynamic> get filteredApprovedLeads {
    if (searchQuery.value.isEmpty) return approvedLeads;
    return approvedLeads.where((lead) => _matchesSearch(lead)).toList();
  }

  List<dynamic> get filteredPendingLeads {
    if (searchQuery.value.isEmpty) return pendingLeads;
    return pendingLeads.where((lead) => _matchesSearch(lead)).toList();
  }

  List<dynamic> get filteredRejectedLeads {
    if (searchQuery.value.isEmpty) return rejectedLeads;
    return rejectedLeads.where((lead) => _matchesSearch(lead)).toList();
  }

  //  search method
  bool _matchesSearch(dynamic lead) {
    final query = searchQuery.value.toLowerCase();
    final name = getLeadName(lead).toLowerCase();
    final phone = getLeadPhone(lead).toLowerCase();
    final email = getLeadEmail(lead).toLowerCase();

    return name.contains(query) ||
        phone.contains(query) ||
        email.contains(query);
  }

  //  method to update search
  void updateSearch(String query) {
    searchQuery.value = query;
  }

  /// Fetch Approved Leads
  Future<void> fetchApprovedLeads({bool refresh = false}) async {
    try {
      if (refresh) {
        approvedCurrentPage.value = 1;
        approvedLeads.clear();
      }

      isLoadingApproved.value = true;
      errorMessage.value = null;

      debugPrint(
        "📡 Fetching approved leads - Page: ${approvedCurrentPage.value}",
      );

      final response = await service.getApprovedLeads(
        page: approvedCurrentPage.value,
        limit: 10,
      );

      if (response != null && response.success == true) {
        if (response.data?.leads != null && response.data!.leads!.isNotEmpty) {
          if (refresh) {
            approvedLeads.value = response.data!.leads!;
          } else {
            approvedLeads.addAll(response.data!.leads!);
          }
          approvedTotalPages.value = response.data?.totalPages ?? 1;
          approvedCurrentPage.value = response.data?.currentPage ?? 1;

          debugPrint("✅ Approved leads loaded: ${approvedLeads.length} total");
          debugPrint("📄 Total Pages: ${approvedTotalPages.value}");
        } else {
          debugPrint("⚠️ No approved leads found");
        }
      } else {
        errorMessage.value =
            response?.message ?? 'Failed to fetch approved leads';
        debugPrint("⚠️ Failed to fetch approved leads");
      }
    } catch (e, stackTrace) {
      errorMessage.value = 'An error occurred';
      debugPrint("❌ Approved leads fetch error: $e");
      debugPrint("Stack trace: $stackTrace");
    } finally {
      isLoadingApproved.value = false;
    }
  }

  /// Fetch Pending Leads
  Future<void> fetchPendingLeads({bool refresh = false}) async {
    try {
      if (refresh) {
        pendingCurrentPage.value = 1;
        pendingLeads.clear();
      }

      isLoadingPending.value = true;
      errorMessage.value = null;

      debugPrint(
        "📡 Fetching pending leads - Page: ${pendingCurrentPage.value}",
      );

      final response = await service.getPendingLeads(
        page: pendingCurrentPage.value,
        limit: 10,
      );

      if (response != null && response.success == true) {
        if (response.data?.leads != null && response.data!.leads!.isNotEmpty) {
          if (refresh) {
            pendingLeads.value = response.data!.leads!;
          } else {
            pendingLeads.addAll(response.data!.leads!);
          }
          pendingTotalPages.value = response.data?.totalPages ?? 1;
          pendingCurrentPage.value = response.data?.currentPage ?? 1;

          debugPrint("✅ Pending leads loaded: ${pendingLeads.length} total");
          debugPrint("📄 Total Pages: ${pendingTotalPages.value}");
        } else {
          debugPrint("⚠️ No pending leads found");
        }
      } else {
        errorMessage.value =
            response?.message ?? 'Failed to fetch pending leads';
        debugPrint("⚠️ Failed to fetch pending leads");
      }
    } catch (e, stackTrace) {
      errorMessage.value = 'An error occurred';
      debugPrint("❌ Pending leads fetch error: $e");
      debugPrint("Stack trace: $stackTrace");
    } finally {
      isLoadingPending.value = false;
    }
  }

  /// Fetch Rejected Leads
  Future<void> fetchRejectedLeads({bool refresh = false}) async {
    try {
      if (refresh) {
        rejectedCurrentPage.value = 1;
        rejectedLeads.clear();
      }

      isLoadingRejected.value = true;
      errorMessage.value = null;

      debugPrint(
        "📡 Fetching rejected leads - Page: ${rejectedCurrentPage.value}",
      );

      final response = await service.getRejectedLeads(
        page: rejectedCurrentPage.value,
        limit: 10,
      );

      if (response != null && response.success == true) {
        if (response.data?.leads != null && response.data!.leads!.isNotEmpty) {
          if (refresh) {
            rejectedLeads.value = response.data!.leads!;
          } else {
            rejectedLeads.addAll(response.data!.leads!);
          }
          rejectedTotalPages.value = response.data?.totalPages ?? 1;
          rejectedCurrentPage.value = response.data?.currentPage ?? 1;

          debugPrint("✅ Rejected leads loaded: ${rejectedLeads.length} total");
          debugPrint("📄 Total Pages: ${rejectedTotalPages.value}");
        } else {
          debugPrint("⚠️ No rejected leads found");
        }
      } else {
        errorMessage.value =
            response?.message ?? 'Failed to fetch rejected leads';
        debugPrint("⚠️ Failed to fetch rejected leads");
      }
    } catch (e, stackTrace) {
      errorMessage.value = 'An error occurred';
      debugPrint("❌ Rejected leads fetch error: $e");
      debugPrint("Stack trace: $stackTrace");
    } finally {
      isLoadingRejected.value = false;
    }
  }

  /// Load more approved leads (pagination)
  Future<void> loadMoreApprovedLeads() async {
    if (approvedCurrentPage.value < approvedTotalPages.value &&
        !isLoadingApproved.value) {
      approvedCurrentPage.value++;
      await fetchApprovedLeads();
    }
  }

  /// Load more pending leads (pagination)
  Future<void> loadMorePendingLeads() async {
    if (pendingCurrentPage.value < pendingTotalPages.value &&
        !isLoadingPending.value) {
      pendingCurrentPage.value++;
      await fetchPendingLeads();
    }
  }

  /// Load more rejected leads (pagination)
  Future<void> loadMoreRejectedLeads() async {
    if (rejectedCurrentPage.value < rejectedTotalPages.value &&
        !isLoadingRejected.value) {
      rejectedCurrentPage.value++;
      await fetchRejectedLeads();
    }
  }

  /// Refresh based on tab
  Future<void> refreshLeads(int tabIndex) async {
    switch (tabIndex) {
      case 0:
        await fetchApprovedLeads(refresh: true);
        break;
      case 1:
        await fetchPendingLeads(refresh: true);
        break;
      case 2:
        await fetchRejectedLeads(refresh: true);
        break;
    }
  }

  /// Clear error message
  void clearError() {
    errorMessage.value = null;
  }

  /// Helper methods to get data based on tab
  String getLeadName(dynamic lead) {
    if (lead is Lead) {
      // Approved Lead
      return lead.personalDetails?.name ??
          lead.organization?.nameOfOwner ??
          lead.organization?.orgName ??
          'N/A';
    } else if (lead is PendingLead) {
      // Pending Lead - usually no personalDetails
      return lead.createdBy?.name ??
          lead.organization?.nameOfOwner ??
          lead.organization?.orgName ??
          'N/A';
    } else if (lead is RejectedLead) {
      // Rejected Lead
      return lead.personalDetails?.name ??
          lead.organization?.nameOfOwner ??
          lead.organization?.orgName ??
          'N/A';
    }
    return 'N/A';
  }

  String getLeadPhone(dynamic lead) {
    if (lead is Lead) {
      return lead.personalDetails?.phone ?? 'N/A';
    } else if (lead is PendingLead) {
      return 'N/A'; // Pending leads usually don't have phone
    } else if (lead is RejectedLead) {
      return lead.personalDetails?.phone ?? 'N/A';
    }
    return 'N/A';
  }

  String getLeadEmail(dynamic lead) {
    if (lead is Lead) {
      return lead.personalDetails?.email ?? 'N/A';
    } else if (lead is PendingLead) {
      return lead.createdBy?.email ?? 'N/A';
    } else if (lead is RejectedLead) {
      return lead.personalDetails?.email ?? 'N/A';
    }
    return 'N/A';
  }

  /// Fetch Lead Details by ID
  Future<void> fetchLeadDetails(String leadId) async {
    try {
      isLoadingDetails.value = true;
      errorMessage.value = null;

      debugPrint("📡 Fetching lead details for ID: $leadId");

      final response = await service.getLeadById(leadId);

      if (response != null && response.success == true) {
        if (response.data != null) {
          leadDetails.value = response.data;
          debugPrint("✅ Lead details loaded successfully");
          debugPrint(
            "👤 Name: ${response.data!.personalDetails?.name ?? 'N/A'}",
          );
          debugPrint(
            "🏢 Organization: ${response.data!.organization?.orgName ?? 'N/A'}",
          );
        } else {
          errorMessage.value = "No lead details found";
          debugPrint("⚠️ No lead details found");
        }
      } else {
        errorMessage.value =
            response?.message ?? 'Failed to fetch lead details';
        debugPrint("⚠️ Failed to fetch lead details");
      }
    } catch (e, stackTrace) {
      errorMessage.value = 'An error occurred';
      debugPrint("❌ Lead details fetch error: $e");
      debugPrint("Stack trace: $stackTrace");
    } finally {
      isLoadingDetails.value = false;
    }
  }

  /// Helper method to get display value or "N/A"
  String getValueOrNA(String? value) {
    return value != null && value.isNotEmpty ? value : 'N/A';
  }
}
