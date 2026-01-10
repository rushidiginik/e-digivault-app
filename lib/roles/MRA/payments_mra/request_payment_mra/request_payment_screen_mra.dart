import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/constants/theme.dart';
import '../../../../../../../widgets/common_header.dart';
import '../../../../../../../widgets/common_search_bar_widget.dart';
import '../../../../../../../widgets/custom_tabBar_widget.dart';
import '../../../../../../../widgets/request_status_card.dart';

class RequestPaymentScreenMra extends StatefulWidget {
  const RequestPaymentScreenMra({super.key});

  @override
  State<RequestPaymentScreenMra> createState() =>
      _RequestPaymentScreenMraState();
}

class _RequestPaymentScreenMraState extends State<RequestPaymentScreenMra> {
  int selectedTabIndex = 0;

  bool get isPending => tabs[selectedTabIndex] == "Pending";

  bool get isApproved => tabs[selectedTabIndex] == "Approved";

  bool get isRejected => tabs[selectedTabIndex] == "Rejected";

  final List<String> tabs = ["Request", "Pending", "Approved", "Rejected"];

  final Map<int, Map<String, dynamic>> statusConfig = {
    0: {"text": "Request", "color": AppStyles.primaryColor},
    1: {"text": "Pending for Approval", "color": Colors.orange},
    2: {"text": "Processed", "color": const Color(0xFF50A000)},
    3: {"text": "Rejected", "color": const Color(0xFFA00000)},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: 'Request', showBack: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CommonSearchBar(),
            ),
            const SizedBox(height: 20),
            pendingCapsuleTabBar(
              tabs: tabs,
              selectedIndex: selectedTabIndex,
              onTap: (index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            if (tabs[selectedTabIndex] == "Request")
              _requestFormUI()
            else
              GestureDetector(
                onTap: () {
                  context.pushNamed(
                    'mraRequestPaymentView',
                    extra: tabs[selectedTabIndex],
                  );
                },
                child: Column(
                  children: [
                    RequestStatusCard(
                      name: "MRA-567653",
                      phone: isPending ? null : "89XXXXXX78",
                      email: isPending ? null : "Rajeshn@gmail.com",
                      jobId: isPending ? null : "JB-236754",
                      reqAmount: isPending ? null : "14A",
                      task: null,
                      progress: isPending ? "70%" : null,
                      step: (isApproved || isRejected) ? "4" : null,
                      statusText: statusConfig[selectedTabIndex]!["text"],
                      statusColor: statusConfig[selectedTabIndex]!["color"],
                    ),
                    RequestStatusCard(
                      name: "MRA-787878",
                      phone: isPending ? null : "98XXXXXX21",
                      email: isPending ? null : "demo@gmail.com",
                      jobId: isPending ? null : "JB-888888",
                      reqAmount: isPending ? null : "18A",
                      task: null,
                      progress: isPending ? "85%" : null,
                      step: (isApproved || isRejected) ? "4" : null,
                      statusText: statusConfig[selectedTabIndex]!["text"],
                      statusColor: statusConfig[selectedTabIndex]!["color"],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _requestFormUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _input("Client ID", initialValue: "CL-54178"),
          _input("Job ID", initialValue: "JB-98754"),
          _input("Project", initialValue: "E-Katha"),
          _input("Category", initialValue: "Revenue Records"),
          _input("Department", initialValue: "DC Office"),
          _input("Main Service", initialValue: "Gram Panchayat"),
          _input("Sub-Service", initialValue: "E-Katha B"),
          _input("Service", initialValue: "E-Katha IIb"),
          _input("Task", initialValue: "Select your task"),
          _input("Amount", initialValue: "250A"),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Request"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _input(String hint, {String? initialValue}) {
    final controller = TextEditingController(text: initialValue);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
