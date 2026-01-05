import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../../../../core/constants/image_const.dart';
import '../../../../../../../core/constants/theme.dart';
import '../../../../../../../widgets/common_header.dart';
import '../../../widgets/client_page_container_helper_ac.dart';

class ApprovedGapScreenAc extends StatefulWidget {
  final String status;

  const ApprovedGapScreenAc({super.key, required this.status});

  @override
  State<ApprovedGapScreenAc> createState() => _ApprovedGapScreenAcState();
}

class _ApprovedGapScreenAcState extends State<ApprovedGapScreenAc> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: 'Assign GAP', showBack: true),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ImageConst.flowestimateicon,
                      height: 20,
                      width: 20,
                      color: AppStyles.primaryColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Service".tr,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: const Color(0x1A000000), thickness: 1),
              ),

              const SizedBox(height: 8),

              /// CLIENT CARD
              ClientPageContainerHelperAc(
                onTap: () {},
                idPrefix: "SH",
                idNumber: "567894",
                status: "Active",
                phone: "89XXXXXX78",
                email: "Rajesh@gmail.com",
                showDetailedCard: true,
                replaceIdWithName: true,
                displayName: "Rajesh Kumar",
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    /// SERVICE DETAILS CARD
                    _whiteCard(
                      Column(
                        children: [
                          _infoRow("Service Request Date", "24-05-25"),
                          const SizedBox(height: 12),
                          _infoRow("Service", "E-Katha"),
                          const SizedBox(height: 12),
                          _infoRow("", "Katha Extract"),
                          const SizedBox(height: 12),
                          _infoRow("", "Katha Mutation"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    _whiteCard(
                      Column(
                        children: [
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFDCE9FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Payment Details",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF130703),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          _infoRow("Ref Number", "00008575257"),
                          const SizedBox(height: 12),
                          _infoRow("Payment Time", "25-02-2023, 13:22:16"),
                          const SizedBox(height: 12),
                          _infoRow("Payment Method", "UPI"),
                          const SizedBox(height: 12),
                          _infoRow("Sender Name", "Ganesh"),
                          const SizedBox(height: 30),
                          _infoRow("Amount", "250A"),
                          const SizedBox(height: 12),

                          /// Amount + Status
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Payment Status",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE6F4EA),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      "Success",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF2E7D32),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    _whiteCard(
                      Column(
                        children: [
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFDCE9FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Verify Details",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF130703),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          _infoRow("Transaction Mode", "UPI"),
                          const SizedBox(height: 12),
                          _infoRow("UPI ID", "Rakshith@byl"),
                          const SizedBox(height: 12),
                          _infoRow("Receiver  Name", "Ganesh"),
                          const SizedBox(height: 30),
                          _infoRow("Amount", "250A"),
                          const SizedBox(height: 12),

                          /// Amount + Status
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Payment Status",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE6F4EA),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      "Success",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF2E7D32),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  /// COMMON WHITE CARD
  Widget _whiteCard(Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  /// INFO ROW
  Widget _infoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
