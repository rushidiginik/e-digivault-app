import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/bottom_navigation_bar_mra.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';

import 'package:flutter/material.dart';

class MraDashboardScreen extends StatefulWidget {
  const MraDashboardScreen({super.key});

  @override
  State<MraDashboardScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<MraDashboardScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();

  List<Map<String, dynamic>> myData = [
    {"client_name": "Rajesh Kumar", "date": "08 Apr 2025", "document": "Invoice", "bgColor": AppStyles.lightBlueEB, "textColor": AppStyles.blue2F},
    {"client_name": "Prasad Rai", "date": "06 Apr 2025", "document": "Estimate", "bgColor": AppStyles.lightGreenE6, "textColor": AppStyles.green2E},
    {"client_name": "Babu Shetty", "date": "05 Apr 2025", "document": "Proposal", "bgColor": AppStyles.lightOrangeFF, "textColor": AppStyles.orangeF5},
    {"client_name": "Varun Reddy", "date": "05 Apr 2025", "document": "Proposal", "bgColor": AppStyles.lightOrangeFF, "textColor": AppStyles.orangeF5},
    {"client_name": "Renukha Pai", "date": "05 Apr 2025", "document": "Estimate", "bgColor": AppStyles.lightGreenE6, "textColor": AppStyles.green2E},
    {"client_name": "Sushmitha", "date": "05 Apr 2025", "document": "Invoice", "bgColor": AppStyles.lightBlueEB, "textColor": AppStyles.blue2F},
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonAppBarWidget(title: "dashboard", isBack: false),
      bottomNavigationBar: DashboardScreenMra(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [_salesInsightsSection(), _estimateSection(), _recentActivitySection()]),
        ),
      ),
    );
  }

  Widget _salesInsightsSection() {
    return Card(
      elevation: 5,
      color: AppStyles.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            textMedium(text: "Clients Sales Insights", fontSize: 18),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _insightItem(percent: 0.75, value: "56/140", label: "completed", progressColor: AppStyles.green2E, backgroundColor: AppStyles.lightGreenBC),
                _insightItem(percent: 0.55, value: "24/140", label: "pending", progressColor: AppStyles.orangeF5, backgroundColor: AppStyles.lightOrangeF5),
                _insightItem(percent: 0.25, value: "16/140", label: "rejected", progressColor: AppStyles.redColorC6, backgroundColor: AppStyles.lightRedED),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _estimateSection() {
    return Card(
      elevation: 5,
      color: AppStyles.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            textMedium(text: "Clients Sales Insights", fontSize: 18),
            const SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _estimateConst(percent: 0.75, value: "56/140", label: "verified", progressColor: AppStyles.green2E, backgroundColor: AppStyles.lightGreenBC),
                _estimateConst(percent: 0.55, value: "24/140", label: "pending", progressColor: AppStyles.orangeF5, backgroundColor: AppStyles.lightOrangeF5),
                _estimateConst(percent: 0.25, value: "16/140", label: "rejected", progressColor: AppStyles.redColorC6, backgroundColor: AppStyles.lightRedED),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _recentActivitySection() {
    return Column(
      children: [
        SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.access_time_rounded, color: AppStyles.primaryColor),
            SizedBox(width: 8),
            textSemiBold(text: "recent_activity_list", fontSize: 16),
          ],
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
              DataColumn(label: textMedium(text: "document_title", fontSize: 12)),
              DataColumn(label: textMedium(text: "date", fontSize: 12)),
              DataColumn(label: textMedium(text: "status_badge", fontSize: 12)),
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
        // CircularPercentIndicator(
        //   radius: 35.0,
        //   lineWidth: 12.0,
        //   percent: percent,
        //   backgroundColor: backgroundColor,
        //   progressColor: progressColor,
        //   circularStrokeCap: CircularStrokeCap.round,
        //   center: const SizedBox.shrink(),
        // ),
        const SizedBox(height: 10),
        textSemiBold(text: value, fontSize: 14),
        textRegular(text: label, fontSize: 12),
      ],
    );
  }

  Widget _estimateConst({required double percent, required String value, required String label, required Color progressColor, required Color backgroundColor}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width * 0.15,
            child: textRegular(text: label, fontSize: 14),
          ),
          // LinearPercentIndicator(
          //   width: size.width * 0.50,
          //   barRadius: Radius.circular(12),
          //   lineHeight: 14,
          //   percent: percent,
          //   backgroundColor: backgroundColor,
          //   progressColor: progressColor,
          //   center: const SizedBox.shrink(),
          // ),
          const SizedBox(height: 10),
          textMedium(text: value, fontSize: 14),
        ],
      ),
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
}
