import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/routes/app_routes.dart';
import 'package:e_digivault_org_app/widgets/button_widget.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';
import 'package:e_digivault_org_app/widgets/common_divider.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:percent_indicator/flutter_percent_indicator.dart';

import 'package:sizer/sizer.dart';

class LeadScreen extends StatefulWidget {
  const LeadScreen({super.key});

  @override
  State<LeadScreen> createState() => _LeadScreenState();
}

class _LeadScreenState extends State<LeadScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();

  List<Map<String, dynamic>> myData = [
    {
      "client_name": "Rajesh Kumar",
      "date": "08 Apr 2025",
      "document": "Approved",
      "bgColor": AppStyles.lightGreenE6,
      "textColor": AppStyles.green2E,
    },
    {
      "client_name": "Prasad Rai",
      "date": "06 Apr 2025",
      "document": "Pending",
      "bgColor": AppStyles.lightOrangeFF,
      "textColor": AppStyles.orangeF5,
    },
    {
      "client_name": "Babu Shetty",
      "date": "05 Apr 2025",
      "document": "Pending",
      "bgColor": AppStyles.lightOrangeFF,
      "textColor": AppStyles.orangeF5,
    },
    {
      "client_name": "Varun Reddy",
      "date": "05 Apr 2025",
      "document": "Rejected",
      "bgColor": AppStyles.lightRedFD,
      "textColor": AppStyles.redColorC6,
    },
    {
      "client_name": "Renukha Pai",
      "date": "05 Apr 2025",
      "document": "Pending",
      "bgColor": AppStyles.lightOrangeFF,
      "textColor": AppStyles.orangeF5,
    },
    {
      "client_name": "Sushmitha",
      "date": "05 Apr 2025",
      "document": "Pending",
      "bgColor": AppStyles.lightOrangeFF,
      "textColor": AppStyles.orangeF5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonHeader(title: 'Leads', showBack: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Divider WITHOUT padding
            SizedBox(height: 14),
            const CommonDivider(),

            /// Everything else WITH padding
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _statusSummarySection(),
                  _iconSection(),
                  _recentActivitySection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusSummarySection() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.bar_chart_rounded, color: AppStyles.grey66),
            SizedBox(width: 10),
            textMedium(
              text: "Status Summary Cards Of Leads",
              fontSize: 14,
              fontColor: AppStyles.grey66,
            ),
          ],
        ),
        SizedBox(height: 12),
        CommonDivider(),
        SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _statusRowContainer(
                  bgColor: AppStyles.lightGreenE6,
                  fontColor: AppStyles.green2E,
                  title: "Verified",
                  value: "4",
                  icon: SvgPicture.asset(
                    ImageConst.completed,
                    height: 16,
                    width: 16,
                    color: AppStyles.green2E,
                  ),
                ),
                SizedBox(width: 24),
                _statusRowContainer(
                  bgColor: AppStyles.lightRedFD,
                  fontColor: AppStyles.redColorC6,
                  title: "Rejected",
                  value: "10",
                  icon: Icon(
                    Icons.close,
                    color: AppStyles.redColorC6,
                    size: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            _statusRowContainer(
              bgColor: AppStyles.lightOrangeFF,
              fontColor: AppStyles.orangeF5,
              title: "Pending",
              value: "23",
              icon: SvgPicture.asset(
                ImageConst.pending,
                height: 16,
                width: 16,
                color: AppStyles.orangeF5,
              ),
            ),
          ],
        ),
        SizedBox(height: 18),
        CommonDivider(),
      ],
    );
  }

  // Widget _iconSection() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 30.0),
  //     child: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 12),
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 child: SizedBox(
  //                   height: 50,
  //                   child: ButtonWidget(
  //                     onTap: () {
  //                       // Navigator.pushNamed(
  //                       //   context,
  //                       //   NavigatorConst.addLeadScreen,
  //                       // );
  //                       router.go('/add_leads_screen_bd');
  //                     },
  //                     title: 'add new lead',
  //                     icons: Icons.add,
  //                     bgColor: AppStyles.primaryColor,
  //                     textColor: AppStyles.whiteColor,
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(width: 15),
  //               Expanded(
  //                 child: SizedBox(
  //                   height: 50,
  //                   child: ButtonWidget(
  //                     onTap: () {
  //                       // Navigator.pushNamed(
  //                       //   context,
  //                       //   // NavigatorConst.viewLeadDetailsBDScreen,
  //                       //   NavigatorConst.viewLeadsScreen,
  //                       // );
  //                     },
  //                     title: "View Report",
  //                     icons: CupertinoIcons.eye,
  //                     bgColor: AppStyles.whiteColor,
  //                     textColor: AppStyles.primaryColor,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _iconSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 24),
      child: Center(
        child: SizedBox(
          height: 44,
          width: size.width * 0.40, // adjust as needed
          child: ButtonWidgetIconEnd(
            onTap: () {
              // Navigate to View Leads
              router.push('/view_leads_screen');
            },
            title: "View Leads",
            icons: CupertinoIcons.eye,
            bgColor: AppStyles.whiteColor,
            textColor: AppStyles.primaryColor,
            width: size.width * 0.40,
            height: 44,
          ),
        ),
      ),
    );
  }

  Widget _recentActivitySection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(ImageConst.recentClockSvg),
            SizedBox(width: 8),
            textSemiBold(text: "Recent Activity List", fontSize: 16),
          ],
        ),
        SizedBox(height: 12),
        CommonDivider(),
        SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(AppStyles.lightBlueEB),
            headingRowHeight: 35,
            border: TableBorder.all(
              color: AppStyles.greyDE, // horizontal + vertical lines
              width: 1,
            ),
            columns: [
              DataColumn(label: textMedium(text: "Lead Name", fontSize: 12)),
              DataColumn(label: textMedium(text: "Date", fontSize: 12)),
              DataColumn(label: textMedium(text: "Status Badge", fontSize: 12)),
            ],
            rows: myData.map((row) {
              return _buildRow(
                row["client_name"],
                row["date"],
                row["document"],
                row["bgColor"],
                row["textColor"],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _insightItem({
    required double percent,
    required String value,
    required String label,
    required Color progressColor,
    required Color backgroundColor,
  }) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 35.0,
          lineWidth: 12.0,
          percent: percent,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
          circularStrokeCap: CircularStrokeCap.round,
          center: const SizedBox.shrink(),
        ),
        const SizedBox(height: 10),
        textSemiBold(text: value, fontSize: 14),
        textRegular(text: label, fontSize: 12),
      ],
    );
  }

  Widget _dashIconConst({
    required Function() onTap,
    required String title,
    required String image,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width / 4.5,
        height: size.height * 0.11,
        color: AppStyles.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image, height: 50, width: 50),
            SizedBox(height: 6),
            textRegular(
              text: title,
              fontSize: 12,
              textAlign: TextAlign.center,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  static DataRow _buildRow(
    String name,
    String date,
    String document,
    Color bg,
    Color textColor,
  ) {
    return DataRow(
      cells: [
        DataCell(textRegular(text: name, fontSize: 12)),
        DataCell(
          textRegular(text: date, fontSize: 12, fontColor: AppStyles.grey66),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: textExtraBold(
              text: document,
              fontSize: 12,
              fontColor: textColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _statusRowContainer({
    required Color bgColor,
    required Color fontColor,
    required Widget icon,
    required String title,
    required String value,
  }) {
    return Container(
      height: 52,
      width: size.width * 0.42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppStyles.whiteColor,
                ),
                child: Center(child: icon),
              ),
              const SizedBox(width: 8),
              textSemiBold(text: title, fontSize: 14, fontColor: fontColor),
            ],
          ),
          textBold(text: value, fontSize: 24, fontColor: fontColor),
        ],
      ),
    );
  }
}
