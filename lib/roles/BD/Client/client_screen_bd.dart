import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/bottom_navigation_bar_bd.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';
import 'package:e_digivault_org_app/widgets/header_action/header_action.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:percent_indicator/flutter_percent_indicator.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
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
      appBar: CommonAppBarWidget(
        title: "Client",
        isBack: true,
        actionWidget: [
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: HeaderAction(),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              _salesInsightsSection(),
              projectStatusCard(),
              _iconSection(),
              _recentActivitySection(),
            ],
          ),
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
                    label: "GAP Appproved",
                    progressColor: AppStyles.orangeF5,
                    backgroundColor: AppStyles.lightOrangeF5,
                  ),
                ),
                Expanded(
                  child: _insightItem(
                    percent: 0.55,
                    value: "12",
                    label: "GAP Appproved",
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

  Widget projectStatusCard() {
    return Card(
      elevation: 4,
      color: AppStyles.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textMedium(text: "Project", fontSize: 16),
            SizedBox(height: 1.h),
            _buildProgressRow('Pending', 280, 400, AppStyles.red4C),
            SizedBox(height: 1.h),
            _buildProgressRow('Completed', 120, 400, AppStyles.green00),
            SizedBox(height: 1.h),
            _buildProgressRow('Ongoing', 100, 400, AppStyles.blueCE),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressRow(String title, int value, int maxValue, Color color) {
    final progress = (value / maxValue).clamp(0.0, 1.0);

    return Row(
      children: [
        SizedBox(width: 80, child: Text(title)),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              const barHeight = 6.0;
              const knobWidth = 6.0;
              const knobHeight = 12.0;

              return TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOut,
                tween: Tween(begin: 0, end: progress),
                builder: (context, t, _) {
                  final filledWidth = constraints.maxWidth * t;
                  final knobLeft = (filledWidth - knobWidth / 2).clamp(
                    0.0,
                    constraints.maxWidth - knobWidth,
                  );

                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Track
                      Container(
                        height: barHeight,
                        decoration: BoxDecoration(
                          color: AppStyles.greyD9,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      // Fill
                      Positioned(
                        left: 0,
                        child: Container(
                          width: filledWidth,
                          height: barHeight,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      // End knob
                      Positioned(
                        left: knobLeft,
                        top: -(knobHeight - barHeight) / 2,
                        child: _progressKnob(color, knobWidth, knobHeight),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(width: 8),
        textMedium(text: value.toString(), fontSize: 12),
      ],
    );
  }

  Widget _progressKnob(Color color, double w, double h) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: color,

        border: Border.all(color: color, width: 3),

        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, 1),
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
    );
  }

  Widget _iconSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   NavigatorConst.bdGapAnalysisScreen,
                // );
              },
              child: Container(
                height: 5.h,
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppStyles.greyDE),
                  boxShadow: [
                    BoxShadow(
                      color: AppStyles.greyDE,
                      blurRadius: 20,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textRegular(
                        text: "GAP Analysis",
                        fontColor: AppStyles.whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 2.w),
                      SvgPicture.asset(ImageConst.normalClockSvg),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, NavigatorConst.viewClientBDScreen);
              },
              child: Container(
                height: 5.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppStyles.greyDE),
                  boxShadow: [
                    BoxShadow(
                      color: AppStyles.greyDE,
                      blurRadius: 20,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textRegular(
                        text: "View Client",
                        fontSize: 14,
                        fontColor: AppStyles.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 2.w),
                      SvgPicture.asset(ImageConst.eyeSvg),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: ButtonWidget(
          //     onTap: () {
          //       Navigator.pushNamed(context, NavigatorConst.clientUploadedDocScreen);
          //     },
          //     title: "upload_doc",
          //     icons: Icons.add,
          //   ),
          // ),
          // SizedBox(width: 10),
          // Expanded(
          //   child: ButtonWidget(
          //     onTap: () {
          //       Navigator.pushNamed(context, NavigatorConst.viewClientBDScreen);
          //     },
          //     title: "View Client",
          //     icons: CupertinoIcons.eye,
          //     bgColor: AppStyles.whiteColor,
          //     textColor: AppStyles.primaryColor,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _recentActivitySection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Divider(
            color: AppStyles.textBlack.withOpacity(0.1),
            height: 5,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/images/svg/clock_icon.svg",
              color: AppStyles.primaryColor,
            ),
            SizedBox(width: 8),
            textSemiBold(text: "recent_activity_list", fontSize: 16),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Divider(
            color: AppStyles.textBlack.withOpacity(0.1),
            height: 5,
          ),
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
        textRegular(
          text: label,
          fontSize: 12,
          textAlign: TextAlign.center,
          fontColor: progressColor,
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
