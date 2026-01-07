import 'package:e_digivault_org_app/widgets/client_page_container_helper_ac.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/constants/app_common_text.dart';
import '../../../../../../core/constants/image_const.dart';
import '../../../../../../core/constants/theme.dart';
import '../../../../../../widgets/common_header.dart';

class InchargeOverviewScreenAc extends StatefulWidget {
  const InchargeOverviewScreenAc({super.key});

  @override
  State<InchargeOverviewScreenAc> createState() =>
      _InchargeOverviewScreenAcState();
}

class _InchargeOverviewScreenAcState extends State<InchargeOverviewScreenAc> {
  late Size size;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppStyles.whiteColor,
        appBar: CommonHeader(title: 'INCHARGE', showBack: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Overview",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: const Color(0x1A000000), thickness: 2),
              ),
              SizedBox(height: 6),
              ClientPageContainerHelperAc(
                onTap: () {},
                idPrefix: "INCHARGE",
                idNumber: "567894",
                status: "Active",
                phone: "89XXXXXX78",
                email: "Rajesh@gmail.com",
                createdBy: "Renukha @ ADMIN",
                // 🔹 HERE
                showDetailedCard: true,
              ),
              _topContainSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topContainSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top summary card
          // Container(
          //   padding: const EdgeInsets.all(16),
          //   decoration: BoxDecoration(
          //     border: Border.all(color: Colors.grey.shade300),
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: GridView.count(
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     crossAxisCount: 2,
          //     childAspectRatio: 3,
          //     mainAxisSpacing: 12,
          //     crossAxisSpacing: 12,
          //     children: [
          //       _summaryItem(
          //         icon: Icons.grid_view,
          //         value: "5",
          //         label: "projects",
          //       ),
          //       _summaryItem(
          //         icon: Icons.insert_drive_file,
          //         value: "10.4A",
          //         label: "total invoiced",
          //       ),
          //       _summaryItem(
          //         icon: Icons.check_circle_outline,
          //         value: "9A",
          //         label: "payment",
          //       ),
          //       _summaryItem(
          //         icon: Icons.error_outline,
          //         value: "1.4A",
          //         label: "due",
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color: const Color(0x1A000000), thickness: 2),
          ),

          // Browse title
          // Padding(
          //   padding: const EdgeInsets.only(left: 16.0, bottom: 8),
          //   child: textMedium(text: "Browse".tr(), fontSize: 18),
          // ),
          const SizedBox(height: 12),
          // Browse grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            padding: EdgeInsets.zero,
            childAspectRatio: 1.1,
            children: [
              _browseItem(
                svgPath: ImageConst.flowestimateicon,
                label: "Estimate",
                onTap: () {
                  context.pushNamed('acEstimateIncharge');
                },
              ),

              _browseItem(
                svgPath: ImageConst.requesticone,
                label: "Request",
                onTap: () {
                  context.pushNamed('acRequestIncharge');
                },
              ),

              _browseItem(
                svgPath: ImageConst.expenditureicon,
                label: "Expenditure",
                onTap: () {
                  context.pushNamed('acExpenditureIncharge');
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color: const Color(0x1A000000), thickness: 2),
          ),
        ],
      ),
    );
  }

  // Widget _summaryItem({
  //   required IconData icon,
  //   required String value,
  //   required String label,
  // }) {
  //   return Row(
  //     children: [
  //       Icon(icon, color: AppStyles.primaryColor, size: 30),
  //       const SizedBox(width: 8),
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           textSemiBold(text: value, fontSize: 16),
  //           textRegular(text: label.tr(), fontSize: 12),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  Widget _browseItem({
    required String svgPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            svgPath,
            height: 40,
            width: 40,
            color: AppStyles.primaryColor,
          ),
          const SizedBox(height: 3),
          textRegular(
            text: label.tr(),
            textAlign: TextAlign.center,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
