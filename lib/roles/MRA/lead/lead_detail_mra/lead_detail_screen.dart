import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/bottom_navigation_bar_mra.dart';
import 'package:e_digivault_org_app/widgets/button_widget.dart';
import 'package:e_digivault_org_app/widgets/custom_app_bar_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:percent_indicator/flutter_percent_indicator.dart';

import 'package:sizer/sizer.dart';

class LeadDetailScreenMra extends StatefulWidget {
  const LeadDetailScreenMra({super.key});

  @override
  State<LeadDetailScreenMra> createState() => _LeadScreenState();
}

class _LeadScreenState extends State<LeadDetailScreenMra> {
  late Size size;
  final TextEditingController controller = TextEditingController();

  List<Map<String, dynamic>> myData = [
    {"client_name": "Rajesh Kumar", "date": "08 Apr 2025", "document": "Approved", "bgColor": AppStyles.lightBlueEB, "textColor": AppStyles.blue2F},
    {"client_name": "Prasad Rai", "date": "06 Apr 2025", "document": "Pending", "bgColor": AppStyles.lightGreenE6, "textColor": AppStyles.green2E},
    {"client_name": "Babu Shetty", "date": "05 Apr 2025", "document": "Pending", "bgColor": AppStyles.lightOrangeFF, "textColor": AppStyles.orangeF5},
    {"client_name": "Varun Reddy", "date": "05 Apr 2025", "document": "Rejected", "bgColor": AppStyles.lightOrangeFF, "textColor": AppStyles.orangeF5},
    {"client_name": "Renukha Pai", "date": "05 Apr 2025", "document": "Pending", "bgColor": AppStyles.lightGreenE6, "textColor": AppStyles.green2E},
    {"client_name": "Sushmitha", "date": "05 Apr 2025", "document": "Pending", "bgColor": AppStyles.lightBlueEB, "textColor": AppStyles.blue2F},
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarMra(),
      backgroundColor: AppStyles.whiteColor,
      appBar: CustomAppbar(title: 'Lead', isBack: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // CommonSearchBar(),
              SizedBox(height: 1.h),
              _statusSummarySection(),
              _iconSection(),
              _recentActivitySection(),
            ],
          ),
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
            textMedium(text: "Status Summary", fontSize: 14, fontColor: AppStyles.grey66),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, top: 5),
          child: Divider(color: AppStyles.textBlack.withOpacity(0.1), height: 5),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _statusRowContainer(bgColor: AppStyles.lightGreenE6, fontColor: AppStyles.green2E, title: "verified", value: "4", icons: Icons.done),
                SizedBox(width: 24),
                _statusRowContainer(bgColor: AppStyles.lightRedFD, fontColor: AppStyles.redColor3F, title: "rejected", value: "10", icons: Icons.close),
              ],
            ),
            SizedBox(height: 12),
            _statusRowContainer(
              bgColor: AppStyles.lightOrangeFF,
              fontColor: AppStyles.orangeF5,
              title: "pending",
              value: "23",
              icons: Icons.access_time_rounded,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0, top: 12),
          child: Divider(color: AppStyles.textBlack.withOpacity(0.1), height: 5),
        ),
      ],
    );
  }

  Widget _iconSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ButtonWidget(
                      onTap: () {},
                      title: 'add new lead',
                      icons: Icons.add,
                      bgColor: AppStyles.primaryColor,
                      textColor: AppStyles.whiteColor,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ButtonWidget(
                      onTap: () {},
                      title: "View Report",
                      icons: CupertinoIcons.eye,
                      bgColor: AppStyles.whiteColor,
                      textColor: AppStyles.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _recentActivitySection() {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(""),
            SizedBox(width: 8),
            textSemiBold(text: "Recent Activity List", fontSize: 16),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Divider(color: AppStyles.textBlack.withOpacity(0.1), height: 5),
        ),
        SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(AppStyles.lightBlueEB),
            headingRowHeight: 40,
            border: TableBorder.all(
              color: AppStyles.greyDE, // horizontal + vertical lines
              width: 1,
            ),
            columns: [
              DataColumn(label: textMedium(text: "Lead Name", fontSize: 12)),
              DataColumn(label: textMedium(text: "date", fontSize: 12)),
              DataColumn(label: textMedium(text: "Status Badge", fontSize: 12)),
            ],
            rows: myData.map((row) {
              return _buildRow(row["client_name"], row["date"], row["document"], row["bgColor"], row["textColor"]);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _insightItem({required double percent, required String value, required String label, required Color progressColor, required Color backgroundColor}) {
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

  Widget _dashIconConst({required Function() onTap, required String title, required String image}) {
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
            textRegular(text: title, fontSize: 12, textAlign: TextAlign.center, maxLines: 2, textOverflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  static DataRow _buildRow(String name, String date, String document, Color bg, Color textColor) {
    return DataRow(
      cells: [
        DataCell(textRegular(text: name, fontSize: 12)),
        DataCell(textRegular(text: date, fontSize: 12, fontColor: AppStyles.grey66)),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
            child: textSemiBold(text: document, fontSize: 12, fontColor: textColor),
          ),
        ),
      ],
    );
  }

  Widget _statusRowContainer({required Color bgColor, required Color fontColor, required IconData icons, required String title, required String value}) {
    return Container(
      height: 52,
      width: size.width * 0.43,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: bgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(shape: BoxShape.circle, color: AppStyles.whiteColor),
                child: Center(child: Icon(icons, color: fontColor)),
              ),
              SizedBox(width: 8),
              textSemiBold(text: title, fontSize: 14, fontColor: fontColor),
            ],
          ),
          textBold(text: value, fontSize: 22, fontColor: fontColor),
        ],
      ),
    );
  }
}
