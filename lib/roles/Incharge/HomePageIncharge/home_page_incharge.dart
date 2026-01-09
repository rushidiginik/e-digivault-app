import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_common_text.dart';
import '../../../core/constants/image_const.dart';
import '../../../core/constants/theme.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/common_header.dart';

class HomePageIncharge extends StatefulWidget {
  const HomePageIncharge({super.key});

  @override
  State<HomePageIncharge> createState() => _HomePageInchargeState();
}

class _HomePageInchargeState extends State<HomePageIncharge> {
  late Size size;

  List<Map<String, dynamic>> recentTaskData = [
    {
      "client_name": "Rajesh Kumar",
      "job_id": "BA-MA-5232",
      "category": "Revenue",
    },
    {
      "client_name": "Vasanth Rai",
      "job_id": "BA-MA-5452",
      "category": "Revenue",
    },
    {
      "client_name": "Suresh Pai",
      "job_id": "BA-MA-5692",
      "category": "Revenue",
    },
    {
      "client_name": "Rajesh Kumar",
      "job_id": "BA-MA-5412",
      "category": "Revenue",
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
              _userOverviewSection(),
              SizedBox(height: 16),
              _estimationOverviewSection(),
              SizedBox(height: 16),
              _recentTaskListSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userOverviewSection() {
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
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textMedium(
              text: "User overview",
              fontSize: 16,
              fontColor: AppStyles.textBlack15,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _userOverviewItem(
                  value: 56,
                  label: "MRA",
                  subLabel: "14-Active",
                  progress: 0.68,
                  progressColor: const Color(0xFF4CCB7F),
                  backgroundColor: const Color(0xFFE6F6EC),
                ),
                _userOverviewItem(
                  value: 24,
                  label: "Delivery Partner",
                  subLabel: "11-Active",
                  progress: 0.52,
                  progressColor: const Color(0xFFFF8A34),
                  backgroundColor: const Color(0xFFFFEADB),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _estimationOverviewSection() {
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
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textMedium(
              text: "Estimation Overview",
              fontSize: 16,
              fontColor: AppStyles.textBlack15,
            ),
            const SizedBox(height: 16),
            _estimationRow(
              label: "Approved",
              current: 50,
              total: 100,
              color: const Color(0xFF4CCB7F),
              lightColor: const Color(0xFFBCEDCA),
            ),
            const SizedBox(height: 12),
            _estimationRow(
              label: "Pending",
              current: 34,
              total: 100,
              color: const Color(0xFFFF8A34),
              lightColor: const Color(0xFFFFF2D9),
            ),
            const SizedBox(height: 12),
            _estimationRow(
              label: "Rejected",
              current: 16,
              total: 100,
              color: const Color(0xFFE85C55),
              lightColor: const Color(0xFFFDE6E4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _recentTaskListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.access_time_rounded,
              size: 24,
              color: AppStyles.primaryColor,
            ),
            SizedBox(width: 8),
            textSemiBold(text: "Recent Task List", fontSize: 16),
          ],
        ),
        SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppStyles.whiteColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppStyles.greyDE),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(AppStyles.lightBlueEB),
              headingRowHeight: 45,
              dataRowHeight: 50,
              columnSpacing: 40,
              horizontalMargin: 16,
              border: TableBorder(
                horizontalInside: BorderSide(color: AppStyles.greyDE, width: 1),
              ),
              columns: [
                DataColumn(
                  label: Row(
                    children: [
                      Icon(Icons.sort, size: 16, color: AppStyles.grey66),
                      SizedBox(width: 4),
                      textMedium(text: "Client Name", fontSize: 12),
                      SizedBox(width: 4),
                      Icon(
                        Icons.unfold_more,
                        size: 16,
                        color: AppStyles.grey66,
                      ),
                    ],
                  ),
                ),
                DataColumn(
                  label: Row(
                    children: [
                      Icon(Icons.sort, size: 16, color: AppStyles.grey66),
                      SizedBox(width: 4),
                      textMedium(text: "Job ID", fontSize: 12),
                      SizedBox(width: 4),
                      Icon(
                        Icons.unfold_more,
                        size: 16,
                        color: AppStyles.grey66,
                      ),
                    ],
                  ),
                ),
                DataColumn(
                  label: Row(
                    children: [
                      Icon(Icons.sort, size: 16, color: AppStyles.grey66),
                      SizedBox(width: 4),
                      textMedium(text: "Category", fontSize: 12),
                      SizedBox(width: 4),
                      Icon(
                        Icons.unfold_more,
                        size: 16,
                        color: AppStyles.grey66,
                      ),
                    ],
                  ),
                ),
              ],
              rows: recentTaskData.map((row) {
                return DataRow(
                  cells: [
                    DataCell(
                      textRegular(
                        text: row["client_name"],
                        fontSize: 13,
                        fontColor: AppStyles.textBlack,
                      ),
                    ),
                    DataCell(
                      textRegular(
                        text: row["job_id"],
                        fontSize: 13,
                        fontColor: AppStyles.grey66,
                      ),
                    ),
                    DataCell(
                      textRegular(
                        text: row["category"],
                        fontSize: 13,
                        fontColor: AppStyles.textBlack,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _userOverviewItem({
    required int value,
    required String label,
    required String subLabel,
    required double progress,
    required Color progressColor,
    required Color backgroundColor,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 10,
                  backgroundColor: backgroundColor,
                  valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                  strokeCap: StrokeCap.round,
                ),
              ),
              Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF130703),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF130703),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          subLabel,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF78716C),
          ),
        ),
      ],
    );
  }

  Widget _estimationRow({
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
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF130703),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 50,
          child: Text(
            "$current/$total",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF130703),
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
