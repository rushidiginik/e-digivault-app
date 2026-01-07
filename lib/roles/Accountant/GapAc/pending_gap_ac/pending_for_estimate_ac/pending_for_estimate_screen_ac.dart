import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../../../../core/constants/image_const.dart';
import '../../../../../../../core/constants/theme.dart';
import '../../../../../../../widgets/common_header.dart';
import '../../../../../widgets/client_page_container_helper_ac.dart';

class PendingForEstimateScreenAc extends StatefulWidget {
  final String status;

  const PendingForEstimateScreenAc({super.key, required this.status});

  @override
  State<PendingForEstimateScreenAc> createState() =>
      _PendingForEstimateScreenAcState();
}

class _PendingForEstimateScreenAcState
    extends State<PendingForEstimateScreenAc> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: 'Estimate GAP', showBack: true),
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

              _crusadeProjectCard(context),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crusadeProjectCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F8FF), // grey background
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4EBF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== HEADER (GREY AREA) =====
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                ImageConst.buildingIconSvg,
                width: 22,
                height: 22,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Crusade project",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "SR ID - 57643A3",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "140A",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "EST",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF14246C),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// ===== WHITE CARD (ONLY BELOW PART) =====
          Container(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ACTION ROW
                Row(
                  children: [
                    const Text(
                      "Properties",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    _linkText("View EST", onTap: () {}),
                    const SizedBox(width: 18),
                    _linkText("View opinion", onTap: () {}),
                  ],
                ),

                const SizedBox(height: 8),

                _propertyRow("Property 1", "50A Est"),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0x0D000000), // very light grey
                ),
                _propertyRow("Property 2", "20A Est"),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0x0D000000), // very light grey
                ),
                _propertyRow("Property 3", "50A Est"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _linkText(String text, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2), // underline niche aayegi
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF0052CC), // blue underline
                width: 1.2, // thickness
              ),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF0052CC),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _propertyRow(String title, String amount) {
    return InkWell(
      onTap: () {
        // navigate to property detail
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 20,
              color: Colors.black,
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(title, style: const TextStyle(fontSize: 14))),
            Text(
              amount,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, size: 24, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
