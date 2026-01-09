import 'package:e_digivault_org_app/widgets/common_divider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_common_text.dart';
import '../../../core/constants/theme.dart';
import '../../../widgets/common_header.dart';

class HomePageAdvocate extends StatefulWidget {
  const HomePageAdvocate({super.key});

  @override
  State<HomePageAdvocate> createState() => _HomePageAdvocateState();
}

class _HomePageAdvocateState extends State<HomePageAdvocate> {
  late Size size;

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
              _overviewGapSection(),
              SizedBox(height: 16),
              _taskSection(),
              SizedBox(height: 16),
              _projectSection(),
              SizedBox(height: 16),
              CommonDivider(),
              SizedBox(height: 16),
              _leadConversionStatusSection(),
              SizedBox(height: 26),
            ],
          ),
        ),
      ),
    );
  }

  Widget _overviewGapSection() {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textMedium(
              text: "Overview Gap",
              fontSize: 16,
              fontColor: AppStyles.textBlack15,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _gapInsightItem(
                    percent: 0.55,
                    value: "22",
                    label: "completed",
                    progressColor: AppStyles.green2E,
                    backgroundColor: AppStyles.lightGreenBC,
                  ),
                ),
                Expanded(
                  child: _gapInsightItem(
                    percent: 0.64,
                    value: "32",
                    label: "Pending",
                    progressColor: AppStyles.orangeF5,
                    backgroundColor: AppStyles.lightOrangeF5,
                  ),
                ),
                Expanded(
                  child: _gapInsightItem(
                    percent: 0.30,
                    value: "12",
                    label: "Ongoing",
                    progressColor: AppStyles.blue2F,
                    backgroundColor: AppStyles.lightBlueDD,
                  ),
                ),
                Expanded(
                  child: _gapInsightItem(
                    percent: 0.82,
                    value: "62",
                    label: "Rejected",
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

  Widget _taskSection() {
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
              right: 16,
              top: 43,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textSemiBold(
                    text: "Total",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  textMedium(
                    text: "420",
                    fontSize: 14,
                    fontColor: AppStyles.pinkF2,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textMedium(text: "Task", fontSize: 16),
                SizedBox(height: 1.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _taskItem(
                      color: AppStyles.green00,
                      label: "Completed",
                      value: "200",
                    ),
                    SizedBox(height: 1.h),
                    _taskItem(
                      color: AppStyles.orangeF5,
                      label: "Ongoing",
                      value: "100",
                    ),
                    SizedBox(height: 1.h),
                    _taskItem(
                      color: AppStyles.redFD,
                      label: "Pending",
                      value: "120",
                    ),
                  ],
                ),
                SizedBox(height: 1.5.h),
                Row(
                  children: [
                    Expanded(
                      child: _progressSegment(
                        backgroundColor: AppStyles.lightGreenBC,
                        fillPercent: 0.48,
                        fillColor: AppStyles.green00,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: _progressSegment(
                        backgroundColor: AppStyles.lightOrangeF5,
                        fillPercent: 0.24,
                        fillColor: AppStyles.orangeF5,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: _progressSegment(
                        backgroundColor: AppStyles.lightRedFD,
                        fillPercent: 0.29,
                        fillColor: AppStyles.redFD,
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

  Widget _projectSection() {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textMedium(
              text: "Project",
              fontSize: 16,
              fontColor: AppStyles.textBlack15,
            ),
            const SizedBox(height: 16),
            _projectProgressRow('Pending', 280, 400, AppStyles.red4C),
            const SizedBox(height: 12),
            _projectProgressRow('Completed', 120, 400, AppStyles.green00),
            const SizedBox(height: 12),
            _projectProgressRow('Ongoing', 100, 400, AppStyles.blueCE),
          ],
        ),
      ),
    );
  }

  Widget _leadConversionStatusSection() {
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
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textMedium(
              text: "Lead Conversion Status",
              fontSize: 14,
              fontColor: AppStyles.textBlack15,
            ),
            const SizedBox(height: 16),
            _leadStatusRow(
              label: "Verified",
              current: 50,
              total: 100,
              color: AppStyles.green00,
              lightColor: AppStyles.lightGreenBC,
            ),
            const SizedBox(height: 12),
            _leadStatusRow(
              label: "Pending",
              current: 34,
              total: 100,
              color: AppStyles.orangeF5,
              lightColor: AppStyles.lightOrangeF5,
            ),
            const SizedBox(height: 12),
            _leadStatusRow(
              label: "Rejected",
              current: 16,
              total: 100,
              color: AppStyles.redFD,
              lightColor: AppStyles.lightRedFD,
            ),
          ],
        ),
      ),
    );
  }

  Widget _gapInsightItem({
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
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: progressColor,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 4),
            textSemiBold(text: value, fontSize: 14),
          ],
        ),
        SizedBox(height: 4),
        SizedBox(
          height: 24,
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
                fontWeight: FontWeight.w400,
              ),
              textRegular(
                text: value,
                fontSize: 14,
                fontColor: AppStyles.textBlack,
                fontWeight: FontWeight.w300,
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
            Container(
              height: 12,
              width: width,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              height: 12,
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

  Widget _projectProgressRow(
    String title,
    int value,
    int maxValue,
    Color color,
  ) {
    final double progress = (value / maxValue).clamp(0.0, 1.0);

    return Row(
      children: [
        SizedBox(
          width: 65,
          child: textRegular(
            text: title,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Background bar
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: AppStyles.greyD9,
                  borderRadius: BorderRadius.circular(0),
                ),
              ),

              // Progress bar + end indicator
              FractionallySizedBox(
                widthFactor: progress,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),

                    // End marker (exactly like image)
                    Positioned(
                      right: -3,
                      child: Container(
                        width: 6,
                        height: 14,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 30,
          child: textRegular(
            text: value.toString(),
            fontSize: 12,
            fontColor: AppStyles.textBlack,
          ),
        ),
      ],
    );
  }

  Widget _leadStatusRow({
    required String label,
    required int current,
    required int total,
    required Color color,
    required Color lightColor,
  }) {
    final progress = (current / total).clamp(0.0, 1.0);

    return Row(
      children: [
        SizedBox(
          width: 80,
          child: textRegular(
            text: label,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 14,
                width: 146,
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  height: 14,
                  width: 146,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 50,
          child: textMedium(
            text: "$current/$total",
            fontSize: 14,
            fontColor: AppStyles.textBlack,
          ),
        ),
      ],
    );
  }
}
