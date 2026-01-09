import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/constants/theme.dart';
import '../../../../../../../widgets/common_header.dart';
import '../../../../../../../widgets/common_search_bar_widget.dart';
import '../../../../../../../widgets/custom_tabBar_widget.dart';
import '../../../../widgets/estimate_request_card.dart';

class ViewEstimaterequestMoreScreenAc extends StatefulWidget {
  final String? status;

  const ViewEstimaterequestMoreScreenAc({super.key, this.status});

  @override
  State<ViewEstimaterequestMoreScreenAc> createState() =>
      _ViewEstimaterequestMoreScreenAcState();
}

class _ViewEstimaterequestMoreScreenAcState
    extends State<ViewEstimaterequestMoreScreenAc> {
  int selectedTabIndex = 0;

  String _pendingStatusText(String status) {
    switch (status) {
      case "GAP_PAYMENT_VERIFY":
        return "Gap Payment Verify";
      case "PENDING_ESTIMATE":
        return "Pending for Estimate Approval";
      case "PENDING_INVOICE":
        return "Pending for Invoice";
      case "PENDING_INVOICE_VERIFY":
        return "Verify Invoice";
      default:
        return "Pending";
    }
  }

  final List<String> tabs = ["Pending", "Approved", "Rejected"];

  final Map<int, Map<String, dynamic>> statusConfig = {
    0: {"color": Colors.orange},
    1: {"color": const Color(0xFF50A000)},
    2: {"color": const Color(0xFFA00000)},
  };

  ///  ONLY DATA UPDATED (cardStatus SAME as before)
  final List<Map<String, dynamic>> requestList = [
    {
      "cardStatus": "PENDING_ESTIMATE",
      "project": "Willow",
      "clientId": "CL-176754",
      "serviceId": "SR-176754",
      "service": "Khatha Extract",
      "date": "25-07-2030",
      "image": "assets/images/png/estimate_home_img1.png",
    },
    {
      "cardStatus": "PENDING_INVOICE",
      "project": "Willow",
      "clientId": "CL-176754",
      "serviceId": "SR-176754",
      "service": "Khatha Extract",
      "date": "25-07-2030",
      "image": "assets/images/png/estimate_home_img2.png",
    },
    {
      "cardStatus": "PENDING_INVOICE_VERIFY",
      "project": "Willow",
      "clientId": "CL-176754",
      "serviceId": "SR-176754",
      "service": "Khatha Extract",
      "date": "25-07-2030",
      "image": "assets/images/png/estimate_home_img3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: 'Estimate View', showBack: true),
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
                    itemBuilder: (context, index) {
                      final item = requestList[index];
                      final cardStatus = item["cardStatus"];

                      return GestureDetector(
                        onTap: () {
                          if (selectedTabIndex == 0) {
                            switch (cardStatus) {
                              case "GAP_PAYMENT_VERIFY":
                                context.pushNamed(
                                  'acPendingGap',
                                  extra: "Pending",
                                );
                                break;
                              case "PENDING_ESTIMATE":
                                context.pushNamed(
                                  'acPendingForEstimate',
                                  extra: "Pending",
                                );
                                break;
                              case "PENDING_INVOICE":
                                context.pushNamed(
                                  'acPendingForInvoice',
                                  extra: "Pending",
                                );
                                break;
                              default:
                                context.pushNamed(
                                  'acPendingForInvoice',
                                  extra: "Pending",
                                );
                            }
                          } else if (selectedTabIndex == 1) {
                            context.pushNamed(
                              'acEstimateStatusMore',
                              extra: "Approved",
                            );
                          } else if (selectedTabIndex == 2) {
                            context.pushNamed(
                              'acEstimateStatusMore',
                              extra: "Rejected",
                            );
                          }
                        },

                        ///  ONLY CARD ITEM UPDATED
                        child: EstimateRequestCard(
                          project: item["project"],
                          clientId: item["clientId"],
                          serviceId: item["serviceId"],
                          service: item["service"],
                          date: item["date"],
                          imagePath: item["image"],
                          statusText: selectedTabIndex == 0
                              ? _pendingStatusText(cardStatus)
                              : selectedTabIndex == 1
                              ? "Approved By SH"
                              : "Rejected",
                          statusColor: statusConfig[selectedTabIndex]!["color"],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
