import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/client_page_container_helper.dart';
import 'package:e_digivault_org_app/routes/app_routes.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:e_digivault_org_app/widgets/common_serachBar_withController.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// Dummy Data Models
class DummyLead {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String createdAt;

  DummyLead({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.createdAt,
  });
}

class LeadReportScreen extends StatefulWidget {
  const LeadReportScreen({super.key});

  @override
  State<LeadReportScreen> createState() => _LeadReportScreenState();
}

class _LeadReportScreenState extends State<LeadReportScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  int selectedIndex = 0;
  String searchQuery = '';

  final List<String> options = ["Approved", "Pending", "Rejected"];

  // Dummy Data
  final List<DummyLead> approvedLeads = [
    DummyLead(
      id: 'APR001',
      name: 'John Smith',
      phone: '+1 234 567 8901',
      email: 'john.smith@email.com',
      createdAt: '2024-01-15T10:30:00Z',
    ),
    DummyLead(
      id: 'APR002',
      name: 'Emma Johnson',
      phone: '+1 234 567 8902',
      email: 'emma.johnson@email.com',
      createdAt: '2024-01-16T14:20:00Z',
    ),
    DummyLead(
      id: 'APR003',
      name: 'Michael Brown',
      phone: '+1 234 567 8903',
      email: 'michael.brown@email.com',
      createdAt: '2024-01-17T09:15:00Z',
    ),
    DummyLead(
      id: 'APR004',
      name: 'Sarah Davis',
      phone: '+1 234 567 8904',
      email: 'sarah.davis@email.com',
      createdAt: '2024-01-18T11:45:00Z',
    ),
    DummyLead(
      id: 'APR005',
      name: 'Robert Wilson',
      phone: '+1 234 567 8905',
      email: 'robert.wilson@email.com',
      createdAt: '2024-01-19T16:30:00Z',
    ),
  ];

  final List<DummyLead> pendingLeads = [
    DummyLead(
      id: 'PEN001',
      name: 'Jessica Martinez',
      phone: '+1 234 567 8906',
      email: 'jessica.martinez@email.com',
      createdAt: '2024-01-20T08:00:00Z',
    ),
    DummyLead(
      id: 'PEN002',
      name: 'David Anderson',
      phone: '+1 234 567 8907',
      email: 'david.anderson@email.com',
      createdAt: '2024-01-21T10:30:00Z',
    ),
    DummyLead(
      id: 'PEN003',
      name: 'Lisa Taylor',
      phone: '+1 234 567 8908',
      email: 'lisa.taylor@email.com',
      createdAt: '2024-01-22T13:15:00Z',
    ),
    DummyLead(
      id: 'PEN004',
      name: 'James Thomas',
      phone: '+1 234 567 8909',
      email: 'james.thomas@email.com',
      createdAt: '2024-01-23T15:45:00Z',
    ),
  ];

  final List<DummyLead> rejectedLeads = [
    DummyLead(
      id: 'REJ001',
      name: 'Jennifer White',
      phone: '+1 234 567 8910',
      email: 'jennifer.white@email.com',
      createdAt: '2024-01-10T09:00:00Z',
    ),
    DummyLead(
      id: 'REJ002',
      name: 'Christopher Harris',
      phone: '+1 234 567 8911',
      email: 'christopher.harris@email.com',
      createdAt: '2024-01-11T12:30:00Z',
    ),
    DummyLead(
      id: 'REJ003',
      name: 'Amanda Clark',
      phone: '+1 234 567 8912',
      email: 'amanda.clark@email.com',
      createdAt: '2024-01-12T14:00:00Z',
    ),
  ];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Scroll listener for pagination (can be extended if needed)
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // Load more data if needed
    }
  }

  void _onTabChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
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

  List<DummyLead> _getFilteredLeads() {
    List<DummyLead> currentLeads;

    switch (selectedIndex) {
      case 0:
        currentLeads = approvedLeads;
        break;
      case 1:
        currentLeads = pendingLeads;
        break;
      case 2:
        currentLeads = rejectedLeads;
        break;
      default:
        currentLeads = [];
    }

    if (searchQuery.isEmpty) {
      return currentLeads;
    }

    return currentLeads.where((lead) {
      final query = searchQuery.toLowerCase();
      return lead.name.toLowerCase().contains(query) ||
          lead.phone.toLowerCase().contains(query) ||
          lead.email.toLowerCase().contains(query);
    }).toList();
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
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
                _tabControllerSection(),
              ],
            ),
          ),

          /// List section WITHOUT padding
          Expanded(child: _buildLeadsList()),
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

  Widget _buildLeadsList() {
    final filteredLeads = _getFilteredLeads();
    final isPendingTab = selectedIndex == 1;

    if (filteredLeads.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined, size: 64, color: Colors.grey[400]),
            SizedBox(height: 16),
            Text(
              searchQuery.isEmpty
                  ? 'No ${options[selectedIndex].toLowerCase()} leads found'
                  : 'No results for "$searchQuery"',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        // Simulate refresh delay
        await Future.delayed(Duration(milliseconds: 500));
        setState(() {});
      },
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        itemCount: filteredLeads.length,
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index) {
          final lead = filteredLeads[index];
          final date = _formatDate(lead.createdAt);

          return ClientPageContainerHelper(
            onTap: () {
              router.push(
                '/leads_report_details_screen',
                extra: {
                  'isPending': isPendingTab,
                  'lead': lead,
                  'leadId': lead.id,
                },
              );
            },
            title: lead.name,
            subTitle: "Phone No : ${lead.phone}",
            thirdTitle: "Email: ",
            thirdValue: lead.email,
            forthTitle: isPendingTab ? "Status: " : "Date : ",
            forthSubTitle: isPendingTab ? "Pending for Review" : date,
            isForthContainerShow: isPendingTab,
          );
        },
      ),
    );
  }
}
