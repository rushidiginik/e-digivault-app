import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/constants/theme.dart';
import '../../../../../../../widgets/common_header.dart';
import '../../../../../../../widgets/common_search_bar_widget.dart';
import '../../../../../../../widgets/custom_tabBar_widget.dart';
import '../../../../../../../widgets/request_status_card.dart';

class RequestPaymentScreenAc extends StatefulWidget {
  const RequestPaymentScreenAc({super.key});

  @override
  State<RequestPaymentScreenAc> createState() => _RequestPaymentScreenAcState();
}

class _RequestPaymentScreenAcState extends State<RequestPaymentScreenAc> {
  int selectedTabIndex = 0;

  bool get isPending => tabs[selectedTabIndex] == "Pending";

  bool get isApproved => tabs[selectedTabIndex] == "Approved";

  bool get isRejected => tabs[selectedTabIndex] == "Rejected";

  final List<String> tabs = ["Pending", "Approved", "Rejected"];

  final Map<int, Map<String, dynamic>> statusConfig = {
    0: {"text": "Pending for Approval", "color": Colors.orange},
    1: {"text": "Processed", "color": const Color(0xFF50A000)},
    2: {"text": "Rejected", "color": const Color(0xFFA00000)},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: 'Request', showBack: true),
      body: Column(
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
          GestureDetector(
            onTap: () {
              context.pushNamed(
                'acRequestPaymentView',
                extra: tabs[selectedTabIndex],
              );
            },
            child: Column(
              children: [
                RequestStatusCard(
                  name: "MRA-567653",

                  //  Pending me phone/email NAHI
                  phone: isPending ? null : "89XXXXXX78",
                  email: isPending ? null : "Rajeshn@gmail.com",

                  //  Pending me Job & Amount NAHI
                  jobId: isPending ? null : "JB-236754",
                  reqAmount: isPending ? null : "14A",

                  //  Task KISI TAB ME NAHI
                  task: null,

                  //  Pending me Progress
                  progress: isPending ? "70%" : null,

                  //  Approved / Rejected me Step 4
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
    );
  }
}
