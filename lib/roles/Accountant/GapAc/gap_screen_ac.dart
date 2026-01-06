import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/constants/theme.dart';
import '../../../../../../../widgets/common_header.dart';
import '../../../../../../../widgets/common_search_bar_widget.dart';
import '../../../../../../../widgets/custom_tabBar_widget.dart';
import '../../../../../../../widgets/request_status_card.dart';

class GapScreenAc extends StatefulWidget {
  final String? status;

  const GapScreenAc({super.key, this.status});

  @override
  State<GapScreenAc> createState() => _GapScreenAcState();
}

class _GapScreenAcState extends State<GapScreenAc> {
  int selectedTabIndex = 0;

  String _pendingStatusText(String status) {
    switch (status) {
      case "GAP_PAYMENT_VERIFY":
        return "Gap Payment Verify";

      case "PENDING_ESTIMATE":
        return "Pending for Estimate";

      case "PENDING_INVOICE":
        return "Pending for Invoice";

      case "PENDING_INVOICE_VERIFY":
        return "Pending for Invoice Verification";

      default:
        return "Pending";
    }
  }

  final List<String> tabs = ["Assigned", "Approved", "Rejected"];

  final Map<int, Map<String, dynamic>> statusConfig = {
    0: {"text": "Pending for Approval", "color": Colors.orange},
    1: {"text": "Processed", "color": const Color(0xFF50A000)},
    2: {"text": "Rejected", "color": const Color(0xFFA00000)},
  };

  final List<Map<String, String>> requestList = [
    {
      "name": "Client ID : Cl-457158",
      "phone": "89XXXXXX78",
      "email": "Rajeshn@gmail.com",
      "cardStatus": "GAP_PAYMENT_VERIFY",
    },
    {
      "name": "Client ID : Cl-457158",
      "phone": "98XXXXXX21",
      "email": "Amit@gmail.com",
      "cardStatus": "PENDING_ESTIMATE",
    },
    {
      "name": "Client ID : Cl-457158",
      "phone": "76XXXXXX54",
      "email": "Suresh@gmail.com",
      "cardStatus": "PENDING_INVOICE",
    },
    {
      "name": "Client ID : Cl-457158",
      "phone": "76XXXXXX54",
      "email": "Suresh@gmail.com",
      "cardStatus": "PENDING_INVOICE_VERIFY",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: 'Client', showBack: true),
      body: Column(
        children: [
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CommonSearchBar(),
          ),

          const SizedBox(height: 18),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: const Text(
                            "GAP",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0A0E0A),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Center(
                          child: Container(
                            height: 3,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFF0052CC),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  pendingCapsuleTabBar(
                    tabs: tabs,
                    selectedIndex: selectedTabIndex,
                    onTap: (index) {
                      setState(() {
                        selectedTabIndex = index;
                      });
                    },
                  ),

                  const SizedBox(height: 10),

                  ListView.builder(
                    itemCount: requestList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    // parent scroll already hai
                    itemBuilder: (context, index) {
                      final item = requestList[index];

                      return GestureDetector(
                        onTap: () {
                          if (selectedTabIndex == 0) {
                            final cardStatus = item["cardStatus"];

                            switch (cardStatus) {
                              case "GAP_PAYMENT_VERIFY":
                                context.pushNamed(
                                  'acPendingGap',
                                  extra: "Pending",
                                );
                                break;

                              case "PENDING_ESTIMATE":
                                context.pushNamed('estimateScreen');
                                break;

                              case "PENDING_INVOICE":
                              case "PENDING_INVOICE_VERIFY":
                                context.pushNamed('invoiceScreen');
                                break;

                              default:
                                context.pushNamed(
                                  'acRequestView',
                                  extra: "Pending",
                                );
                            }
                          } else if (selectedTabIndex == 1) {
                            context.pushNamed(
                              'acGapDpApproved',
                              extra: "Approved",
                            );
                          } else if (selectedTabIndex == 2) {
                            context.pushNamed(
                              'acGapDpRejected',
                              extra: "Rejected",
                            );
                          }
                        },

                        child: RequestStatusCard(
                          name: item["name"]!,
                          phone: item["phone"]!,
                          email: item["email"]!,
                          statusText: selectedTabIndex == 0
                              ? _pendingStatusText(item["cardStatus"]!)
                              : statusConfig[selectedTabIndex]!["text"],
                          statusColor: statusConfig[selectedTabIndex]!["color"],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16), // bottom safe space
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
