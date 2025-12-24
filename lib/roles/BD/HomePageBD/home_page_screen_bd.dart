import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/button_widget.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:sizer/sizer.dart';

class HomePageBDScreen extends StatefulWidget {
  const HomePageBDScreen({super.key});

  @override
  State<HomePageBDScreen> createState() => _HomePageBDScreenState();
}

class _HomePageBDScreenState extends State<HomePageBDScreen> {
  late Size size;
  final TextEditingController controller = TextEditingController();

  List<Map<String, dynamic>> myData = [
    {
      "client_name": "Rajesh Kumar",
      "date": "08 Apr 2025",
      "document": "Invoice",
      "bgColor": AppStyles.lightBlueEB,
      "textColor": AppStyles.blue2F,
    },
    {
      "client_name": "Prasad Rai",
      "date": "06 Apr 2025",
      "document": "Estimate",
      "bgColor": AppStyles.lightGreenE6,
      "textColor": AppStyles.green2E,
    },
    {
      "client_name": "Babu Shetty",
      "date": "05 Apr 2025",
      "document": "Proposal",
      "bgColor": AppStyles.lightOrangeFF,
      "textColor": AppStyles.orangeF5,
    },
    {
      "client_name": "Varun Reddy",
      "date": "05 Apr 2025",
      "document": "Proposal",
      "bgColor": AppStyles.lightOrangeFF,
      "textColor": AppStyles.orangeF5,
    },
    {
      "client_name": "Renukha Pai",
      "date": "05 Apr 2025",
      "document": "Estimate",
      "bgColor": AppStyles.lightGreenE6,
      "textColor": AppStyles.green2E,
    },
    {
      "client_name": "Sushmitha",
      "date": "05 Apr 2025",
      "document": "Invoice",
      "bgColor": AppStyles.lightBlueEB,
      "textColor": AppStyles.blue2F,
    },
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonAppBarWidget(title: 'Dashboard', isBack: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              _salesInsightsSection(),
              _taskCardSection(),
              _iconSection(),
              _recentActivitySection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _taskCardSection() {
    return Card(
      elevation: 4,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppStyles.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Positioned(
              left: 240,
              top: 43,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textRegular(
                    text: "Total",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  textRegular(
                    text: "420",
                    fontSize: 16,
                    fontColor: AppStyles.pinkF2,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textRegular(
                      text: "Task",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     textRegular(text: "Total", fontSize: 14, fontWeight: FontWeight.w600),
                    //     textRegular(text: "420", fontSize: 16, fontColor: AppStyles.pinkF2, fontWeight: FontWeight.w500),
                    //   ],
                    // ),
                  ],
                ),

                SizedBox(height: 1.h),

                /// Task labels
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _taskItem(
                      color: AppStyles.green2E,
                      label: "Estimated",
                      value: "200",
                    ),
                    SizedBox(height: 1.h),
                    _taskItem(
                      color: AppStyles.orangeF5,
                      label: "Proposal",
                      value: "100",
                    ),
                    SizedBox(height: 1.h),
                    _taskItem(
                      color: AppStyles.redFD,
                      label: "Invoice",
                      value: "120",
                    ),
                  ],
                ),

                SizedBox(height: 1.5.h),
                Row(
                  children: [
                    Expanded(
                      flex: 100,
                      child: _progressSegment(
                        backgroundColor: AppStyles.lightGreen9f,
                        fillPercent: 0.77,
                        fillColor: AppStyles.green00,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      flex: 100,
                      child: _progressSegment(
                        backgroundColor: AppStyles.blueFF,
                        fillPercent: 0.77,
                        fillColor: AppStyles.blueCE,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      flex: 100,
                      child: _progressSegment(
                        backgroundColor: AppStyles.redC8,
                        fillPercent: 0.77,
                        fillColor: AppStyles.red4C,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _taskItem({
    required Color color,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: textRegular(
            text: "$label - $value",
            fontSize: 14,
            fontColor: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _progressSegment({
    required double fillPercent,
    required Color fillColor,
    required Color backgroundColor,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final fillWidth = width * fillPercent;

        return Stack(
          children: [
            // Background bar
            Container(
              height: 10,
              width: width,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // Filled bar
            Container(
              height: 10,
              width: fillWidth,
              decoration: BoxDecoration(
                color: fillColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _salesInsightsSection() {
    return Card(
      elevation: 5,
      color: AppStyles.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 12,
          left: 12,
          top: 12,
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            textMedium(text: "Client Overview", fontSize: 16),
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _insightItem(
                    percent: 0.75,
                    value: "12",
                    label: "GAP",
                    progressColor: AppStyles.orangeF5,
                    backgroundColor: AppStyles.lightOrangeF5,
                  ),
                ),
                Expanded(
                  child: _insightItem(
                    percent: 0.55,
                    value: "12",
                    label: "GAP",
                    progressColor: AppStyles.blue2F,
                    backgroundColor: AppStyles.lightBlueDD,
                  ),
                ),
                Expanded(
                  child: _insightItem(
                    percent: 0.25,
                    value: "22",
                    label: "GAP Appproved",
                    progressColor: AppStyles.green2E,
                    backgroundColor: AppStyles.lightGreenBC,
                  ),
                ),
                Expanded(
                  child: _insightItem(
                    percent: 0.25,
                    value: "62",
                    label: "GAP Pending",
                    progressColor: AppStyles.redFD,
                    backgroundColor: AppStyles.redA4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Divider(
            color: AppStyles.textBlack.withOpacity(0.1),
            height: 5,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _dashIconConst(
              onTap: () {
                // Navigator.pushNamed(context, NavigatorConst.brochureScreen);
              },
              title: "brochure",
              image: ImageConst.brochureIconPNG,
            ),
            _dashIconConst(
              onTap: () {
                //  Navigator.pushNamed(context, NavigatorConst.rateChartScreen);
              },
              title: "rate chart",
              image: ImageConst.chartIconPNG,
            ),
            _dashIconConst(
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   NavigatorConst.serviceDocumentScreen,
                // );
              },
              title: "service documents",
              image: ImageConst.copyIconPNG,
            ),
            _dashIconConst(
              onTap: () {
                // Navigator.pushNamed(context, NavigatorConst.videoPlayerScreen);
              },
              title: "video promo",
              image: ImageConst.cinemaIconPNG,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 14),
          child: Divider(
            color: AppStyles.textBlack.withOpacity(0.1),
            height: 5,
          ),
        ),
        ButtonWidget(
          onTap: () {
            //Navigator.pushNamed(context, NavigatorConst.liveTrackingScreen);
          },
          title: "Live Tracking",
          width: size.width * 0.55,
        ),
      ],
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
              DataColumn(label: textMedium(text: "client_name", fontSize: 12)),
              DataColumn(label: textMedium(text: "date", fontSize: 12)),
              DataColumn(label: textMedium(text: "document", fontSize: 12)),
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
          radius: 30.0,
          lineWidth: 9.0,
          percent: percent,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
          circularStrokeCap: CircularStrokeCap.round,
          center: const SizedBox.shrink(),
        ),
        SizedBox(height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: progressColor,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 1.w),
            textSemiBold(text: value, fontSize: 14),
          ],
        ),
        SizedBox(height: 1.h),
        SizedBox(
          height: 34,
          child: textRegular(
            text: label,
            fontSize: 12,
            textAlign: TextAlign.center,
            fontColor: progressColor,
          ),
        ),
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
        width: size.width / 4.50,
        height: size.height * 0.11,
        color: AppStyles.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image, height: 6.h, width: 10.w),
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
            child: textSemiBold(
              text: document,
              fontSize: 12,
              fontColor: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
