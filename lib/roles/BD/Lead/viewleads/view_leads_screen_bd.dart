import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/client_page_container_helper.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/controller/view_leads_controller.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/model/approved_lead_model.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/model/pending_lead_model.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/model/rejected_lead_model.dart';
import 'package:e_digivault_org_app/routes/app_routes.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:e_digivault_org_app/widgets/common_serachBar_withController.dart';
import 'package:e_digivault_org_app/widgets/loading_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ViewLeadsScreen extends StatefulWidget {
  const ViewLeadsScreen({super.key});

  @override
  State<ViewLeadsScreen> createState() => _ViewLeadsScreenState();
}

class _ViewLeadsScreenState extends State<ViewLeadsScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  int selectedIndex = 0;

  final List<String> options = ["Approved", "Pending", "Rejected"];

  // Use Get.find() if controller exists, otherwise Get.put()
  late final ViewLeadsController leadsController;

  @override
  void initState() {
    super.initState();

    // Try to find existing controller, otherwise create new one
    if (Get.isRegistered<ViewLeadsController>()) {
      leadsController = Get.find<ViewLeadsController>();
    } else {
      leadsController = Get.put(ViewLeadsController());
    }

    // Setup scroll listener for pagination
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // Load more data based on selected tab
      switch (selectedIndex) {
        case 0:
          leadsController.loadMoreApprovedLeads();
          break;
        case 1:
          leadsController.loadMorePendingLeads();
          break;
        case 2:
          leadsController.loadMoreRejectedLeads();
          break;
      }
    }
  }

  void _onTabChanged(int index) {
    setState(() {
      selectedIndex = index;
    });

    // Fetch data for the selected tab if not already loaded
    switch (index) {
      case 0:
        if (leadsController.approvedLeads.isEmpty) {
          leadsController.fetchApprovedLeads(refresh: true);
        }
        break;
      case 1:
        if (leadsController.pendingLeads.isEmpty) {
          leadsController.fetchPendingLeads(refresh: true);
        }
        break;
      case 2:
        if (leadsController.rejectedLeads.isEmpty) {
          leadsController.fetchRejectedLeads(refresh: true);
        }
        break;
    }
  }

  String _formatDate(String? dateString) {
    if (dateString == null) return 'N/A';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('dd-MM-yyyy').format(date);
    } catch (e) {
      return 'N/A';
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: 'Leads', showBack: true),
      body: Column(
        children: [
          /// Top section with padding
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CommonSearchBar(
                  controller: controller,
                  onChanged: (value) {
                    leadsController.updateSearch(value);
                  },
                ),
                _tabControllerSection(),
              ],
            ),
          ),

          /// List section WITHOUT padding
          Expanded(
            child: Obx(() {
              // Show error if any
              if (leadsController.errorMessage.value != null) {
                return _buildErrorContainer();
              }

              // Show appropriate list based on selected tab
              return [
                _buildLeadsList(
                  leadsController.approvedLeads,
                  leadsController.isLoadingApproved.value,
                  false,
                ),
                _buildLeadsList(
                  leadsController.pendingLeads,
                  leadsController.isLoadingPending.value,
                  true,
                ),
                _buildLeadsList(
                  leadsController.rejectedLeads,
                  leadsController.isLoadingRejected.value,
                  false,
                ),
              ][selectedIndex];
            }),
          ),
        ],
      ),
    );
  }

  Widget _tabControllerSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 20, right: 20),
      child: Center(
        child: Container(
          padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
          decoration: BoxDecoration(
            color: AppStyles.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(options.length * 2 - 1, (index) {
              if (index.isOdd) {
                return const SizedBox(width: 14);
              }

              final itemIndex = index ~/ 2;
              final isSelected = selectedIndex == itemIndex;

              return GestureDetector(
                onTap: () => _onTabChanged(itemIndex),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppStyles.whiteColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: textSemiBold(
                    text: options[itemIndex],
                    fontSize: 16.sp,
                    fontColor: isSelected
                        ? AppStyles.primaryColor
                        : AppStyles.whiteColor,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildLeadsList(List leads, bool isLoading, bool isPendingTab) {
    // Get filtered leads based on tab
    final filteredLeads = selectedIndex == 0
        ? leadsController.filteredApprovedLeads
        : selectedIndex == 1
        ? leadsController.filteredPendingLeads
        : leadsController.filteredRejectedLeads;

    if (isLoading && filteredLeads.isEmpty) {
      return Center(child: CircularLoader());
    }

    if (filteredLeads.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined, size: 64, color: Colors.grey[400]),
            SizedBox(height: 16),
            Text(
              leadsController.searchQuery.value.isEmpty
                  ? 'No ${options[selectedIndex].toLowerCase()} leads found'
                  : 'No results for "${leadsController.searchQuery.value}"',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => leadsController.refreshLeads(selectedIndex),
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        itemCount: filteredLeads.length,
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index) {
          final dynamic lead = filteredLeads[index];

          final name = leadsController.getLeadName(lead);
          final phone = leadsController.getLeadPhone(lead);
          final email = leadsController.getLeadEmail(lead);

          // Safe access to createdAt and id
          final createdAt = (lead is Lead)
              ? lead.createdAt
              : (lead is PendingLead)
              ? lead.createdAt
              : (lead is RejectedLead)
              ? lead.createdAt
              : null;
          final date = _formatDate(createdAt);

          final leadId = (lead is Lead)
              ? lead.id
              : (lead is PendingLead)
              ? lead.id
              : (lead is RejectedLead)
              ? lead.id
              : '';

          return ClientPageContainerHelper(
            onTap: () {
              router.push(
                '/view_leads_details_screen',
                extra: {
                  'isPending': isPendingTab,
                  'lead': lead,
                  'leadId': leadId,
                },
              );
            },
            title: name,
            subTitle: "Phone No : $phone",
            thirdTitle: "Email: ",
            thirdValue: email,
            forthTitle: isPendingTab ? "Status: " : "Date : ",
            forthSubTitle: isPendingTab ? "Pending for Review" : date,
            isForthContainerShow: isPendingTab,
          );
        },
      ),
    );
  }

  Widget _buildErrorContainer() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            leadsController.errorMessage.value!,
            style: const TextStyle(fontSize: 14, color: Colors.red),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              leadsController.clearError();
              leadsController.refreshLeads(selectedIndex);
            },
            icon: const Icon(Icons.refresh),
            label: const Text("Retry"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppStyles.primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
