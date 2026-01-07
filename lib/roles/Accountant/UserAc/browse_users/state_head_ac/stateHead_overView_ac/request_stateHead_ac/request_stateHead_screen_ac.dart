import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/constants/image_const.dart';
import '../../../../../../../core/constants/theme.dart';
import '../../../../../../../widgets/common_header.dart';
import '../../../../../../../widgets/common_search_bar_widget.dart';
import '../../../../../../../widgets/custom_tabBar_widget.dart';
import '../../../../../../../widgets/request_status_card.dart';

class RequestStateHeadScreenAc extends StatefulWidget {
  const RequestStateHeadScreenAc({super.key});

  @override
  State<RequestStateHeadScreenAc> createState() =>
      _RequestStateHeadScreenAcState();
}

class _RequestStateHeadScreenAcState extends State<RequestStateHeadScreenAc> {
  int selectedTabIndex = 0;

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
      appBar: CommonHeader(title: 'State Head', showBack: true),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CommonSearchBar(),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              children: [
                SvgPicture.asset(
                  ImageConst.requesticone,
                  height: 20,
                  width: 20,
                  color: AppStyles.primaryColor,
                ),
                const SizedBox(width: 12),
                const Text(
                  "Request",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: const Divider(thickness: 1),
          ),
          const SizedBox(height: 12),
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
              context.pushNamed('acRequestView', extra: tabs[selectedTabIndex]);
            },
            child: Column(
              children: [
                RequestStatusCard(
                  name: "State Head-567653",
                  phone: "89XXXXXX78",
                  email: "Rajeshn@gmail.com",
                  jobId: "JB-236754",
                  reqAmount: "14A",
                  task: "Online Application",
                  statusText: statusConfig[selectedTabIndex]!["text"],
                  statusColor: statusConfig[selectedTabIndex]!["color"],
                ),
                RequestStatusCard(
                  name: "State Head-567653",
                  phone: "89XXXXXX78",
                  email: "Rajeshn@gmail.com",
                  jobId: "JB-236754",
                  reqAmount: "14A",
                  task: "Online Application",
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
