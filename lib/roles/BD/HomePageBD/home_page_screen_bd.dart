import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/routes/app_routes.dart';
import 'package:e_digivault_org_app/widgets/bottom_navigation_bar_bd.dart';
import 'package:e_digivault_org_app/widgets/button_widget.dart';
import 'package:e_digivault_org_app/widgets/common_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      "bgColor": AppStyles.orange18.withOpacity(0.1),
      "textColor": AppStyles.orange18,
    },
    {
      "client_name": "Varun Reddy",
      "date": "05 Apr 2025",
      "document": "Proposal",
      "bgColor": AppStyles.orange18.withOpacity(0.1),
      "textColor": AppStyles.orange18,
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
      appBar: CommonHeader(title: 'Dashboard', showBack: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Column(
            children: [
              _salesInsightsSection(),
              SizedBox(height: 16),
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
    return Container(
      decoration: BoxDecoration(
        color: AppStyles.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.30),
            offset: const Offset(0, 2),
            blurRadius: 3,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 6),
            blurRadius: 10,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
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
                    fontSize: 14,
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
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),

                SizedBox(height: 1.h),

                /// Task labels
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _taskItem(
                      color: AppStyles.green00,
                      label: "Estimated",
                      value: "200",
                    ),
                    SizedBox(height: 1.h),
                    _taskItem(
                      color: AppStyles.blueCE,
                      label: "Proposal",
                      value: "100",
                    ),
                    SizedBox(height: 1.h),
                    _taskItem(
                      color: AppStyles.redA5,
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
                        backgroundColor: AppStyles.greenDO,
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
          width: 9,
          height: 9,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Row(
            children: [
              textRegular(
                text: "$label - ",
                fontSize: 14,
                fontColor: AppStyles.grey,
                fontWeight: FontWeight.w300,
              ),
              textRegular(
                text: "$value",
                fontSize: 14,
                fontColor: AppStyles.textBlack,
              ),
            ],
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
    return Container(
      decoration: BoxDecoration(
        color: AppStyles.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.30),
            offset: const Offset(0, 2),
            blurRadius: 3,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 6),
            blurRadius: 10,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 16,
          left: 16,
          top: 10,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            textMedium(
              text: "Client Overview",
              fontSize: 16,
              fontColor: AppStyles.textBlack15,
            ),
            const SizedBox(height: 16),
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
                    progressColor: AppStyles.blue21,
                    backgroundColor: AppStyles.blue22,
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
          padding: const EdgeInsets.only(top: 16.0, bottom: 16),
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
                router.push('/bd_brochure_screen');
              },
              title: "Brochure",
              image: ImageConst.brochureIconPNG,
            ),
            _dashIconConst(
              onTap: () {
                router.push('/bd_ratechart_screen');
              },
              title: "Rate Chart",
              image: ImageConst.chartIconPNG,
            ),
            _dashIconConst(
              onTap: () {
                router.push('/bd_servicedocuments_screen');
              },
              title: "Service Documents",
              image: ImageConst.copyIconPNG,
            ),
            _dashIconConst(
              onTap: () {
                router.push('/bd_videopromo_screen');
              },
              title: "Video Promo",
              image: ImageConst.cinemaIconPNG,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 16),
          child: Divider(
            color: AppStyles.textBlack.withOpacity(0.1),
            height: 5,
          ),
        ),
        ButtonWidget(
          onTap: () {
            router.push('/bd_livetracking_screen');
          },

          title: "Live Tracking",
          width: size.width * 0.59,
        ),
      ],
    );
  }

  Widget _recentActivitySection() {
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              ImageConst.recentClockSvg, // or any icon you want
              height: 24,
              width: 24,
              color: AppStyles.primaryColor, // optional
            ),
            SizedBox(width: 8),
            textSemiBold(text: "Recent Activity List", fontSize: 16),
          ],
        ),
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
              DataColumn(label: textMedium(text: "Client Name", fontSize: 12)),
              DataColumn(label: textMedium(text: "Date", fontSize: 12)),
              DataColumn(label: textMedium(text: "Document", fontSize: 12)),
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
            textRegular(text: value, fontSize: 12),
          ],
        ),
        SizedBox(height: 1.h),
        SizedBox(
          height: 40,
          child: textRegular(
            text: label,
            fontSize: 14,
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
            Image.asset(image, height: 40, width: 40),
            SizedBox(height: 7),
            textRegular(
              text: title,
              fontSize: 11,
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
        DataCell(
          textRegular(text: name, fontSize: 12, fontColor: AppStyles.textBlack),
        ),
        DataCell(
          textRegular(text: date, fontSize: 12, fontColor: AppStyles.grey66),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(30),
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
